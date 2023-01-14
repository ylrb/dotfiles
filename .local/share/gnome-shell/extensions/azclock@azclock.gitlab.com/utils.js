const { GLib } = imports.gi;

const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();

function unpackData(settings){
    return settings.get_value('widget-data').deep_unpack();
}

function getData(data, widgetIndex, elementIndex, elementKey, parseType){
    const desktopWidgets = data;

    const clockData = desktopWidgets[widgetIndex];
    const element = clockData[elementIndex][elementKey];

    if(!parseType)
        return element;
    else if(parseType === 'int')
        return parseInt(element);
    else if(parseType === 'bool')
        return element === 'true';
    else if(parseType === 'pango_align'){
        if(element === 'Start')
            return imports.gi.Pango.Alignment.LEFT;
        else if(element === 'Center')
            return imports.gi.Pango.Alignment.CENTER;
        else if(element === 'End')
            return imports.gi.Pango.Alignment.RIGHT;
    }
    else if(parseType === 'clutter_align'){
        if(element === 'Start')
            return imports.gi.Clutter.ActorAlign.START;
        else if(element === 'Center')
            return imports.gi.Clutter.ActorAlign.CENTER;
        else if(element === 'End')
            return imports.gi.Clutter.ActorAlign.END;
    }
}

function setData(data, widgetIndex, elementIndex, elementKey, newValue){
    const settings = ExtensionUtils.getSettings();
    const desktopWidgets = data;

    let clockData = desktopWidgets[widgetIndex];
    clockData[elementIndex][elementKey] = newValue.toString();

    desktopWidgets.splice(widgetIndex, 1, clockData);
    settings.set_value('widget-data', new GLib.Variant('aaa{ss}', desktopWidgets));
}

var DigitalClockSettings = [
    {
        'Name': 'Digital Clock Widget',
        'Widget_Type': 'Widget_Box',

        'Lock_Widget': 'false',

        'Location_X': '50',
        'Location_Y': '50',

        'Box_BackgroundEnabled': 'false',
        'Box_BackgroundColor': 'rgba(0, 0, 0, .2)',
        'Box_BorderEnabled': 'false',
        'Box_BorderWidth': '0',
        'Box_BorderRadius': '20',
        'Box_BorderColor': 'black',
        'Box_Spacing': '8',
        'Box_Padding': '25',
        'Box_VerticalLayout': 'true'
    },
    {
        'Name': 'Time Label',
        'Element_Type': 'Digital_Clock',

        'Text_ShadowEnabled': 'true',
        'Text_ShadowColor': 'black',
        'Text_ShadowX': '2',
        'Text_ShadowY': '2',
        'Text_ShadowSpread': '0',
        'Text_ShadowBlur': '4',

        'Text_Color': 'white',
        'Text_CustomFontEnabled': 'false',
        'Text_CustomFontFamily': 'Cantarell',
        'Text_Size': '64',
        'Text_DateFormat': '%H∶%M∶%S',

        'Text_AlignmentX': 'Center',
        'Text_AlignmentY': 'Center',
        'Text_LineAlignment': 'Center'
    },
    {
        'Name': 'Date Label',
        'Element_Type': 'Digital_Clock',

        'Text_ShadowEnabled': 'true',
        'Text_ShadowColor': 'black',
        'Text_ShadowX': '2',
        'Text_ShadowY': '2',
        'Text_ShadowSpread': '0',
        'Text_ShadowBlur': '4',

        'Text_Color': 'white',
        'Text_CustomFontEnabled': 'false',
        'Text_CustomFontFamily': 'Cantarell',
        'Text_Size': '32',
        'Text_DateFormat': '%A %b %d',

        'Text_AlignmentX': 'Center',
        'Text_AlignmentY': 'Center',
        'Text_LineAlignment': 'Center'
    }
];

var AnalogClockSettings = [
    {
        'Name': 'Analog Clock Widget',
        'Widget_Type': 'Widget_Box',

        'Lock_Widget': 'false',

        'Location_X': '50',
        'Location_Y': '50',

        'Box_BackgroundEnabled': 'false',
        'Box_BackgroundColor': 'rgba(0, 0, 0, .2)',
        'Box_BorderEnabled': 'false',
        'Box_BorderWidth': '0',
        'Box_BorderRadius': '20',
        'Box_BorderColor': 'black',
        'Box_Spacing': '8',
        'Box_Padding': '25',
        'Box_VerticalLayout': 'true'
    },{
        'Name': 'Analog Clock',
        'Element_Type': 'Analog_Clock',

        'Clock_Size': '300',

        'ClockFace_Visible': 'true',
        'ClockFace_Style': '3',
        'ClockFace_ShadowEnabled': 'true',
        'ClockFace_ShadowColor': 'rgba(55, 55, 55, 0.3)',
        'ClockFace_ShadowX': '3',
        'ClockFace_ShadowY': '3',
        'ClockFace_ShadowSpread': '0',
        'ClockFace_ShadowBlur': '3',
        'ClockFace_BoxShadowEnabled': 'true',
        'ClockFace_BoxShadowColor': 'rgba(0, 0, 0, 0.3)',
        'ClockFace_BoxShadowX': '3',
        'ClockFace_BoxShadowY': '5',
        'ClockFace_BoxShadowSpread': '0',
        'ClockFace_BoxShadowBlur': '4',
        'ClockFace_Color': 'black',
        'ClockFace_BackgroundColor': 'white',
        'ClockFace_BorderEnabled': 'true',
        'ClockFace_BorderWidth': '2',
        'ClockFace_BorderRadius': '999',
        'ClockFace_BorderColor': 'black',

        'ClockButton_Visible': 'true',
        'ClockButton_Style': '1',
        'ClockButton_Color': 'yellow',
        'ClockButton_ShadowEnabled': 'false',
        'ClockButton_ShadowColor': 'rgba(55, 55, 55, 0.3)',
        'ClockButton_ShadowX': '3',
        'ClockButton_ShadowY': '3',
        'ClockButton_ShadowSpread': '0',
        'ClockButton_ShadowBlur': '3',

        'SecondHand_Visible': 'true',
        'SecondHand_Style': '3',
        'SecondHand_Color': 'red',
        'SecondHand_ShadowEnabled': 'true',
        'SecondHand_ShadowColor': 'rgba(55, 55, 55, 0.3)',
        'SecondHand_ShadowX': '3',
        'SecondHand_ShadowY': '3',
        'SecondHand_ShadowSpread': '0',
        'SecondHand_ShadowBlur': '3',

        'MinuteHand_Style': '3',
        'MinuteHand_Color': 'black',
        'MinuteHand_ShadowEnabled': 'true',
        'MinuteHand_ShadowColor': 'rgba(55, 55, 55, 0.3)',
        'MinuteHand_ShadowX': '3',
        'MinuteHand_ShadowY': '3',
        'MinuteHand_ShadowSpread': '0',
        'MinuteHand_ShadowBlur': '3',

        'HourHand_Style': '3',
        'HourHand_Color': 'black',
        'HourHand_ShadowEnabled': 'true',
        'HourHand_ShadowColor': 'rgba(55, 55, 55, 0.3)',
        'HourHand_ShadowX': '3',
        'HourHand_ShadowY': '3',
        'HourHand_ShadowSpread': '0',
        'HourHand_ShadowBlur': '3'
    }
];

var EmptyWidgetSettings = [
    {
        'Name': 'Custom Empty Widget',
        'Widget_Type': 'Widget_Box',

        'Lock_Widget': 'false',

        'Location_X': '50',
        'Location_Y': '50',

        'Box_BackgroundEnabled': 'false',
        'Box_BackgroundColor': 'rgba(0, 0, 0, .2)',
        'Box_BorderEnabled': 'false',
        'Box_BorderWidth': '0',
        'Box_BorderRadius': '20',
        'Box_BorderColor': 'black',
        'Box_Spacing': '8',
        'Box_Padding': '25',
        'Box_VerticalLayout': 'true'
    }
];