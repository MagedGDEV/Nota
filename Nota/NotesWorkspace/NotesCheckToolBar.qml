pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Nota

Rectangle {
    id: notesToolBar
    property int buttonSize: 20
    width: 60.5
    radius: 10
    color: Theme.primaryBackgroundColor

    Behavior on opacity {

        NumberAnimation {
            duration: 500
            easing.type: Easing.Linear
        }
    }

    border {
        color: Theme.borderBackgroundColor
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 6


        Behavior on opacity {
            NumberAnimation {
                duration: 500
                easing.type: Easing.Linear
            }
        }

        NotesToolBarButton {
            id: editBtn
            implicitHeight: notesToolBar.height - 12
            Layout.preferredWidth: notesToolBar.buttonSize
            icon.source: "qrc:/icons/svg/edit.svg"
            onClicked: {
                notesTextAreaContainer1.visible = true
                notesTextAreaContainer0.checkBoxEnabled = false
                notesCheckView.destroy()
            }
        }

        Item {Layout.fillWidth: true}

        NotesToolBarButton {
            id: deleteBtn
            implicitHeight: notesToolBar.height - 12
            Layout.preferredWidth: notesToolBar.buttonSize
            icon.source: "qrc:/icons/svg/trash.svg"
            onClicked: {
                notesTextAreaContainer0.destroy()
            }
        }
    }
}
