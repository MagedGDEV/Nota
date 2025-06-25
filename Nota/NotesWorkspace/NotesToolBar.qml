pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Nota

Rectangle {
    id: notesToolBar
    property int buttonSize: 20
    width: 215
    radius: 10
    color: Theme.primaryBackgroundColor

    Behavior on height {
        NumberAnimation {
            duration: Theme.animationDuration
            easing.type: Easing.Linear
        }
    }

    Behavior on opacity {

        NumberAnimation {
            duration: Theme.animationDuration
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
            implicitHeight: notesToolBar.height - 12
            Layout.preferredWidth: notesToolBar.buttonSize
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
            implicitHeight: notesToolBar.height - 12
            Layout.preferredWidth: notesToolBar.buttonSize
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
            implicitHeight: notesToolBar.height - 12
            Layout.preferredWidth: notesToolBar.buttonSize
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
            implicitHeight: notesToolBar.height - 12
            Layout.preferredWidth: notesToolBar.buttonSize
            icon.source: "qrc:/icons/svg/caret-up.svg"
            onClicked: {
                if (notesTextArea.font.pixelSize < 32)
                notesTextArea.font.pixelSize++
            }
        }

        Item {Layout.fillWidth: true}

        NotesToolBarButton {
            id: decreaseSize
            implicitHeight: notesToolBar.height - 12
            Layout.preferredWidth: notesToolBar.buttonSize
            icon.source: "qrc:/icons/svg/caret-down.svg"
            onClicked: {
                if (notesTextArea.font.pixelSize > 8)
                    notesTextArea.font.pixelSize--
            }
        }

        Item {Layout.fillWidth: true}

        NotesToolBarButton {
            id: checkbox
            implicitHeight: notesToolBar.height - 12
            Layout.preferredWidth: notesToolBar.buttonSize
            icon.source: "qrc:/icons/svg/checkbox.svg"
            onClicked: {
                if (notesTextArea.text !== ""){
                    let lines = notesTextArea.text.split("\n")
                    notesTextAreaContainer1.visible = false
                    notesTextAreaContainer0.checkBoxEnabled = true
                    let checkView = checkBoxComponent.createObject(notesTextCheckBoxContainer, {
                        "width": Qt.binding(() => notesTextCheckBoxContainer.width),
                        "lines": lines,
                        "pixelSize": notesTextArea.font.pixelSize
                    })
                }
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

    Component {
        id: checkBoxComponent
        NotesCheckView {}
    }
}
