const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();

const {Adw, Gdk, GObject, Gtk} = imports.gi;
const Gettext = imports.gettext.domain(Me.metadata['gettext-domain']);
const _ = Gettext.gettext;

const Settings = Me.imports.settings;
const { SubPage } = Settings.SubPage;

var DigitalClockSubPage = GObject.registerClass(
class AzClock_DigitalClockSubPage extends SubPage {
    _init(settings, params) {
        super._init(settings, params);

        let generalGroup = new Adw.PreferencesGroup();
        this.add(generalGroup);

        let dateFormatExpanderRow = new Adw.ExpanderRow({
            title: _("Date/Time Format"),
            expanded: true,
            enable_expansion: true
        });

        let dateFormatEntry = new Gtk.Entry({
            valign: Gtk.Align.FILL,
            vexpand: true,
            halign: Gtk.Align.FILL,
            hexpand: true,
            text: this.getClockElementData('Text_DateFormat'),
            xalign: 1,
        });
        dateFormatEntry.connect('changed',() => {
            this.setClockElementData('Text_DateFormat', dateFormatEntry.get_text());
        });
        let dateFormatRow = new Adw.ActionRow({
            activatable: false,
            selectable: false
        });

        let linksBox = new Gtk.Box({
            css_classes: ['linked']
        });

        let linkButton = new Gtk.LinkButton({
            label: _("Format Guide"),
            uri: 'https://docs.python.org/3/library/datetime.html#strftime-and-strptime-format-codes',
            css_classes: ['caption'],
            valign: Gtk.Align.CENTER,
        });
        linksBox.append(linkButton);

        let linkButton2 = new Gtk.LinkButton({
            label: _("Markup Guide"),
            uri: 'https://docs.gtk.org/Pango/pango_markup.html',
            css_classes: ['caption'],
            valign: Gtk.Align.CENTER,
        });
        linksBox.append(linkButton2);

        dateFormatRow.set_child(dateFormatEntry);

        dateFormatExpanderRow.add_action(linksBox);
        dateFormatExpanderRow.add_row(dateFormatRow);

        generalGroup.add(dateFormatExpanderRow);

        let textAlignmentXRow = this.createComboRow(_("Alignment X"), 'Text_AlignmentX');
        generalGroup.add(textAlignmentXRow);

        let textAlignmentYRow = this.createComboRow(_("Alignment Y"), 'Text_AlignmentY');
        generalGroup.add(textAlignmentYRow);

        let lineAlignmentRow = this.createComboRow(_("Line Alignment"), 'Text_LineAlignment');
        generalGroup.add(lineAlignmentRow);

        let textOptionsGroup = new Adw.PreferencesGroup({
            title: _("Text Style")
        });
        this.add(textOptionsGroup);

        let fontEnabled = this.getClockElementData('Text_CustomFontEnabled', 'bool');
        let fontFamily = this.getClockElementData('Text_CustomFontFamily');
        let fontButton = new Gtk.FontButton({
            valign: Gtk.Align.CENTER,
            use_size: false,
            use_font: true,
            level: Gtk.FontChooserLevel.FAMILY, //| Gtk.FontChooserLevel.STYLE,
            font: fontFamily
        });
        let fontRow = new Adw.ActionRow({
            title: _("Font"),
        });
        fontButton.connect('notify::font', (widget) => {
            this.setClockElementData('Text_CustomFontFamily', widget.font);
        });
        fontRow.add_suffix(fontButton);
        let fontExpanderRow = new Adw.ExpanderRow({
            title: _("Override Font Family"),
            show_enable_switch: true,
            expanded: fontEnabled,
            enable_expansion: fontEnabled
        });
        fontExpanderRow.connect("notify::enable-expansion", (widget) => {
            this.setClockElementData('Text_CustomFontEnabled', widget.enable_expansion);
        });
        fontExpanderRow.add_row(fontRow);
        textOptionsGroup.add(fontExpanderRow);

        let timeFontSizeRow = this.createSpinRow(_("Font Size"), 'Text_Size', 8, 200);
        textOptionsGroup.add(timeFontSizeRow);

        let textColorRow = this.createColorRow(_("Text Color"), 'Text_Color');
        textOptionsGroup.add(textColorRow);

        let shadowExpanderRow = this.createShadowExpanderRow(_("Text Shadow"), 'Text_Shadow');
        textOptionsGroup.add(shadowExpanderRow);
    }

    createComboRow(title, setting){
        const value = this.getClockElementData(setting);
        let stringList = new Gtk.StringList();
        stringList.append(_("Start"));
        stringList.append(_("Center"));
        stringList.append(_("End"));

        let selectedValue = 0;

        if(value === 'Start')
            selectedValue = 0;
        else if(value === 'Center')
            selectedValue = 1;
        else if(value === 'End')
            selectedValue = 2;

        let comboRow = new Adw.ComboRow({
            title: _(title),
            model: stringList,
            selected: selectedValue
        });
        comboRow.connect("notify::selected", (widget) => {
            this.setClockElementData(setting, widget.selected_item.string);
        });
        return comboRow;
    }
});
