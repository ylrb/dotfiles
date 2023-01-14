const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();

const {Adw, GObject, Gtk} = imports.gi;
const Gettext = imports.gettext.domain(Me.metadata['gettext-domain']);
const _ = Gettext.gettext;

const Settings = Me.imports.settings;
const { SubPage } = Settings.SubPage;

const CLOCK_STYLE_COUNT = 8;
const BUTTON_STYLE_COUNT = 5;

var AnalogClockSubPage = GObject.registerClass(
class AzClock_AnalogClockSubPage extends SubPage {
    _init(settings, params) {
        super._init(settings, params);

        let generalGroup = new Adw.PreferencesGroup({
            title: _('Clock Settings')
        });
        this.add(generalGroup);

        let clockSizeRow = this.createSpinRow(_("Size"), 'Clock_Size', 100, 1000);
        generalGroup.add(clockSizeRow);

        let clockFaceGroup = new Adw.PreferencesGroup({
            title: _('Clock Face')
        });
        this.add(clockFaceGroup);

        let clockStyleRow = this.createSpinRow(_("Style"), 'ClockFace_Style', 1, CLOCK_STYLE_COUNT);
        clockFaceGroup.add(clockStyleRow);

        let clockColorRow = this.createColorRow(_("Color"), 'ClockFace_Color');
        clockFaceGroup.add(clockColorRow);

        let clockBackgroundColorRow = this.createColorRow(_("Background Color"), 'ClockFace_BackgroundColor');
        clockFaceGroup.add(clockBackgroundColorRow);

        let borderEnabled = this.getClockElementData('ClockFace_BorderEnabled', 'bool');

        let borderOptionsRow = new Adw.ExpanderRow({
            title: _("Border"),
            show_enable_switch: true,
            enable_expansion: borderEnabled
        });
        clockFaceGroup.add(borderOptionsRow);
        borderOptionsRow.connect("notify::enable-expansion", (widget) => {
            this.setClockElementData('ClockFace_BorderEnabled', widget.enable_expansion);
        });

        let borderWidthRow = this.createSpinRow(_("Border Width"), 'ClockFace_BorderWidth', 0, 15);
        borderOptionsRow.add_row(borderWidthRow);
        let borderColorRow = this.createColorRow(_("Border Color"), 'ClockFace_BorderColor');
        borderOptionsRow.add_row(borderColorRow);

        let shadowExpanderRow = this.createShadowExpanderRow(_("Inner Shadow"), 'ClockFace_Shadow');
        clockFaceGroup.add(shadowExpanderRow);

        let shadowOuterExpanderRow = this.createShadowExpanderRow(_("Outer Shadow"), 'ClockFace_BoxShadow');
        clockFaceGroup.add(shadowOuterExpanderRow);

        let enableSwitch = new Gtk.Switch({
            valign: Gtk.Align.CENTER,
            active: this.getClockElementData('ClockFace_Visible', 'bool')
        });
        enableSwitch.connect('notify::active', (widget) => {
            this.setClockElementData('ClockFace_Visible', widget.get_active());

            clockStyleRow.sensitive = widget.get_active();
            clockColorRow.sensitive = widget.get_active();
            clockBackgroundColorRow.sensitive = widget.get_active();
            borderOptionsRow.sensitive = widget.get_active();
            shadowExpanderRow.sensitive = widget.get_active();
            shadowOuterExpanderRow.sensitive = widget.get_active();
        });
        clockFaceGroup.set_header_suffix(enableSwitch);

        clockStyleRow.sensitive = enableSwitch.get_active();
        clockColorRow.sensitive = enableSwitch.get_active();
        clockBackgroundColorRow.sensitive = enableSwitch.get_active();
        borderOptionsRow.sensitive = enableSwitch.get_active();
        shadowExpanderRow.sensitive = enableSwitch.get_active();
        shadowOuterExpanderRow.sensitive = enableSwitch.get_active();

        this.createHandGroup('ClockButton', _('Button in Center'), BUTTON_STYLE_COUNT);
        this.createHandGroup('SecondHand', _('Second Hand'), CLOCK_STYLE_COUNT);
        this.createHandGroup('MinuteHand', _('Minute Hand'), CLOCK_STYLE_COUNT);
        this.createHandGroup('HourHand', _('Hour Hand'), CLOCK_STYLE_COUNT);
    }

    createHandGroup(elementType, title, maxStyles){
        let handGroup = new Adw.PreferencesGroup({
            title: _(title)
        });
        this.add(handGroup);

        let styleRow = this.createSpinRow(_("Style"), `${elementType}_Style`, 1, maxStyles);
        handGroup.add(styleRow);

        let handColorRow = this.createColorRow(_("Color"), `${elementType}_Color`);
        handGroup.add(handColorRow);

        let shadowExpanderRow = this.createShadowExpanderRow(_("Shadow"), `${elementType}_Shadow`);
        handGroup.add(shadowExpanderRow);

        if(elementType === 'SecondHand' || elementType === 'ClockButton'){
            let enableSwitch = new Gtk.Switch({
                valign: Gtk.Align.CENTER,
                active: this.getClockElementData(`${elementType}_Visible`, 'bool')
            });
            enableSwitch.connect('notify::active', (widget) => {
                this.setClockElementData(`${elementType}_Visible`, widget.get_active());

                styleRow.sensitive = widget.get_active();
                shadowExpanderRow.sensitive = widget.get_active();
                handColorRow.sensitive = widget.get_active();
            });
            handGroup.set_header_suffix(enableSwitch);

            styleRow.sensitive = enableSwitch.get_active();
            shadowExpanderRow.sensitive = enableSwitch.get_active();
            handColorRow.sensitive = enableSwitch.get_active();
        }
    }
});
