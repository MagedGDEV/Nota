pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls

import Nota


Button {
    id: root
    property bool on: false

    Behavior on height {
        NumberAnimation {
            duration: Theme.animationDuration
            easing.type: Easing.Linear
        }
    }

    icon.width: Theme.markupButtonIconSize
    icon.height: Theme.markupButtonIconSize
    icon.color: on ? Theme.accentColor : Theme.primaryFontColor
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
