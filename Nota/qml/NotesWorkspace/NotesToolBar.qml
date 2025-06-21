import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import Nota

Rectangle {


    property int buttonSize: 20


    width: 185
    radius: 10
    color: Theme.primaryBackgroundColor

    Behavior on height {
        NumberAnimation {
            duration: 500
            easing.type: Easing.Linear
        }
    }

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
        NotesToolBarButton {
            id: bold
            Layout.preferredHeight: buttonSize
            Layout.preferredWidth: buttonSize
            icon.source: "qrc:/icons/svg/bold.svg"
            onClicked: {
                on = !on
                if (on)
                    notesTextArea.font.bold = true
                else
                    notesTextArea.font.bold = false
            }
        }

        Item {Layout.fillWidth: true}

        NotesToolBarButton {
            id: italic
            Layout.preferredHeight: buttonSize
            Layout.preferredWidth: buttonSize
            icon.source: "qrc:/icons/svg/italic.svg"
            onClicked: {
                on = !on
                if (on)
                    notesTextArea.font.italic = true
                else
                    notesTextArea.font.italic = false
            }
        }

        Item {Layout.fillWidth: true}

        NotesToolBarButton {
            id: underline
            Layout.preferredHeight: buttonSize
            Layout.preferredWidth: buttonSize
            icon.source: "qrc:/icons/svg/underline.svg"
            onClicked: {
                on = !on
                if (on)
                    notesTextArea.font.underline = true
                else
                    notesTextArea.font.underline = false
            }
        }

        Item {Layout.fillWidth: true}

        NotesToolBarButton {
            id: increaseSize
            Layout.preferredHeight: buttonSize
            Layout.preferredWidth: buttonSize
            icon.source: "qrc:/icons/svg/caret-up.svg"
            onClicked: {
                notesTextArea.font.pixelSize++
            }
        }

        Item {Layout.fillWidth: true}

        NotesToolBarButton {
            id: decreaseSize
            Layout.preferredHeight: buttonSize
            Layout.preferredWidth: buttonSize
            icon.source: "qrc:/icons/svg/caret-down.svg"
            onClicked: {
                notesTextArea.font.pixelSize--
            }
        }

        Item {Layout.fillWidth: true}

        NotesToolBarButton {
            id: deleteBtn
            Layout.preferredHeight: buttonSize
            Layout.preferredWidth: buttonSize
            icon.source: "qrc:/icons/svg/trash.svg"
            onClicked: {
                notesTextAreaContainer0.destroy()
            }
        }
    }
}
