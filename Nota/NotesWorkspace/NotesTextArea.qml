import QtQuick
import QtQuick.Controls
import Nota

Rectangle {
    id: notesTextAreaContainer0

    property bool checkBoxEnabled: false

    height: checkBoxEnabled ? notesTextCheckBoxContainer.height :
        (notesTextArea.focus ? notesTextAreaContainer1.height + 45 + 5: notesTextAreaContainer1.height)
    color: Theme.primaryBackgroundColor
    Behavior on height {
        NumberAnimation {
            duration: 500
            easing.type: Easing.Linear
        }
    }

    Flow {
        id: notesTextCheckBoxContainer
        width: parent.width - 10
    }

    Rectangle {
        id: notesTextAreaContainer1
        width: parent.width - 10
        height: notesTextArea.implicitHeight
        color: (notesTextArea.focus || mouse.containsMouse) ? Theme.secondaryBackgroundColor : Theme.primaryBackgroundColor
        radius: 5
        anchors {
            bottom: parent.bottom
        }
        TextArea {
            id: notesTextArea
            anchors.fill: parent
            wrapMode: TextEdit.Wrap
            placeholderText: "Markdown Text Area"
            placeholderTextColor: Theme.secondaryFontColor
            color: Theme.primaryFontColor

            Keys.onReturnPressed: (event) => {
                if (event.modifiers & Qt.MetaModifier)
                    insert(notesTextArea.text.length, '\n')
                else
                    editingFinished()
            }

            onEditingFinished: focus = false
        }

        NotesToolBar {
            height: notesTextArea.focus ? 32 : 0
            opacity: notesTextArea.focus ? 1 : 0
            anchors {
                bottom: notesTextAreaContainer1.top
                right: notesTextAreaContainer1.right
                bottomMargin: 5
            }
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            onClicked: notesTextArea.forceActiveFocus()
            cursorShape: mouse.containsMouse ? Qt.IBeamCursor : Qt.ArrowCursor
        }
    }
}


