import QtQuick
import QtQuick.Controls

import Nota

Button {
    id: root
    property bool on: false

    icon.width: 10
    icon.height: 10

    background: Rectangle {
        radius: 5
        border {
            width: 1
            color: Theme.borderBackgroundColor
        }
        color: mouse.containsMouse ? Theme.secondaryBackgroundColor : Theme.primaryBackgroundColor
        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            onClicked: root.clicked()
            cursorShape: mouse.containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
        }
    }
}
