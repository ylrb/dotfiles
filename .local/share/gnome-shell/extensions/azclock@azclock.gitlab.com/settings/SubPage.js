const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();

const {Adw, Gdk, GLib, GObject, Gtk} = imports.gi;
const Gettext = imports.gettext.domain(Me.metadata['gettext-domain']);
const Utils = Me.imports.utils;
const _ = Gettext.gettext;

var SubPage = GObject.registerClass({
    Properties: {
        'title':  GObject.ParamSpec.string(
            'title', 'title', 'title',
            GObject.ParamFlags.READWRITE,
            ''),
        'widget-index':  GObject.ParamSpec.int(
            'widget-index', 'widget-index', 'widget-index',
            GObject.ParamFlags.READWRITE,
            0, GLib.MAXINT32, 0),
        'element-index':  GObject.ParamSpec.int(
            'element-index', 'element-index', 'element-index',
            GObject.ParamFlags.READWRITE,
            0, GLib.MAXINT32, 0),
    },
},
class AzClock_SubPage extends Gtk.Box {
    _init(settings, params) {
        super._init({
            orientation: Gtk.Orientation.VERTICAL,
            ...params
        });
        this._settings = settings;

        this.headerLabel = new Adw.WindowTitle({
            title: _(this.title),
        });

        this.headerBar = new Adw.HeaderBar({
            title_widget: this.headerLabel,
            decoration_layout: ''
        });

        this.append(this.headerBar);
        this.page = new PrefsPage();
        this.append(this.page);

        let nameGroup = new Adw.PreferencesGroup();
        this.add(nameGroup);

        let nameEntry = new Gtk.Entry({
            valign: Gtk.Align.CENTER,
            width_chars: 20,
            text: this.getClockElementData('Name'),
        });
        nameEntry.connect('changed',() => {
            this.setClockElementData('Name', nameEntry.get_text());
            this.headerLabel.title = nameEntry.get_text();
            this.title = nameEntry.get_text();
        });
        let nameRow = new Adw.ActionRow({
            title: _("Element Name"),
            activatable_widget: nameEntry,
        });
        nameRow.add_suffix(nameEntry);
        nameGroup.add(nameRow);

        let backButton = new Gtk.Button({
            icon_name: 'go-previous-symbolic',
            tooltip_text: _("Back"),
            css_classes: ['flat'],
        });

        backButton.connect('clicked', () => {
            const window = this.get_root();
            window.close_subpage();
        });

        this.headerBar.pack_start(backButton);
    }

    add(widget){
        this.page.add(widget);
    }

    resetScrollAdjustment(){
        const maybeScrolledWindowChild = [...this.page][0];

        if(maybeScrolledWindowChild instanceof Gtk.ScrolledWindow)
            maybeScrolledWindowChild.vadjustment.value = 0;
    }

    createShadowExpanderRow(title, elementType){
        let shadowEnabled = this.getClockElementData(`${elementType}Enabled`, 'bool');
        let shadowExpanderRow = new Adw.ExpanderRow({
            title: _(title),
            show_enable_switch: true,
            expanded: false,
            enable_expansion: shadowEnabled
        });
        shadowExpanderRow.connect("notify::enable-expansion", (widget) => {
            this.setClockElementData(`${elementType}Enabled`, widget.enable_expansion);
        });

        let shadowColorRow = this.createColorRow(_("Shadow Color"), `${elementType}Color`);
        shadowExpanderRow.add_row(shadowColorRow);
        let xOffsetRow = this.createSpinRow(_("Shadow X Offset"), `${elementType}X`, -15, 15);
        shadowExpanderRow.add_row(xOffsetRow);
        let yOffsetRow = this.createSpinRow(_("Shadow Y Offset"), `${elementType}Y`, -15, 15);
        shadowExpanderRow.add_row(yOffsetRow);
        let spreadRow = this.createSpinRow(_("Shadow Spread"), `${elementType}Spread`, 0, 15);
        shadowExpanderRow.add_row(spreadRow);
        let blurRow = this.createSpinRow(_("Shadow Blur"), `${elementType}Blur`, 0, 15);
        shadowExpanderRow.add_row(blurRow);
        return shadowExpanderRow;
    }

    createSpinRow(title, setting, lower, upper){
        const value = this.getClockElementData(setting, 'int');
        let spinButton = new Gtk.SpinButton({
            adjustment: new Gtk.Adjustment({
                lower, upper, step_increment: 1, page_increment: 1, page_size: 0,
            }),
            climb_rate: 1,
            digits: 0,
            numeric: true,
            valign: Gtk.Align.CENTER,
        });
        spinButton.set_value(value);
        spinButton.connect('value-changed', (widget) => {
            this.setClockElementData(setting, widget.get_value());
        });
        let spinRow = new Adw.ActionRow({
            title: _(title),
            activatable_widget: spinButton
        });

        spinRow.setValue = (value) => {
            spinButton.set_value(value);
        }

        spinRow.add_suffix(spinButton);
        return spinRow;
    }

    createColorRow(title, setting){
        const value = this.getClockElementData(setting);
        let rgba = new Gdk.RGBA();
        rgba.parse(value ?? '');
        let colorButton = new Gtk.ColorButton({
            rgba,
            use_alpha: true,
            valign: Gtk.Align.CENTER
        });
        colorButton.connect('color-set', (widget) => {
            this.setClockElementData(setting, widget.get_rgba().to_string());
        });
        let colorRow = new Adw.ActionRow({
            title: _(title),
            activatable_widget: colorButton
        });
        colorRow.add_suffix(colorButton);

        colorRow.setValue = (value) => {
            rgba = new Gdk.RGBA();
            rgba.parse(value);
            colorButton.set_rgba(rgba);
        }
        return colorRow;
    }

    getClockElementData(elementType, parseType){
        return Utils.getData(Utils.unpackData(this._settings), this.widget_index, this.element_index, elementType, parseType) || null;
    }

    setClockElementData(elementType, newValue){
        const changedData = this.getChangedData(elementType);
        this._settings.set_value('changed-data', new GLib.Variant('a{ss}', changedData));
        Utils.setData(Utils.unpackData(this._settings), this.widget_index, this.element_index, elementType, newValue);
    }

    getChangedData(elementType){
        return {
            'WidgetIndex': this.widget_index.toString(),
            'ElementIndex': this.element_index.toString(),
            'ElementType': elementType,
        }
    }
});

var PrefsPage = GObject.registerClass(
class AzClock_PrefsPage extends Adw.PreferencesPage {
    _init(params) {
        super._init(params);
        this.children = [];
    }

    add(page){
        this.children.push(page);
        super.add(page);
    }
});