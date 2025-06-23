import QtQuick
import QtQuick.Controls

import Nota

CheckBox {

    required property int pixelSize

    text: "Hello World"
    contentItem: Text {
        text: parent.text
        font.pixelSize: parent.pixelSize
        font.bold: parent.checked ? true : false
        font.strikeout: parent.checked ? true : false
        verticalAlignment: Text.AlignVCenter
        leftPadding: parent.indicator.width + parent.spacing
    }

    indicator: Rectangle {
        implicitWidth: 15
        implicitHeight: 15
        x: parent.leftPadding
        y: parent.height / 2 - height / 2
        radius: 5
        border.color: Theme.accentColor
        border.width: 1

            // Checkmark
        Rectangle {
            visible: parent.parent.checked
            color: Theme.accentColor
            border.color: Theme.accentColor
            radius: 3
            anchors.margins: 3
            anchors.fill: parent
        }
    }
}

