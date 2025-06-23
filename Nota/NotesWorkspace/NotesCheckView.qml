import QtQuick

Rectangle {
    id: notesCheckView

    height: notesCheckViewList.height
    required property var lines
    required property int pixelSize
    Behavior on height {
        NumberAnimation {
            duration: 500
            easing.type: Easing.Linear
        }
    }

    Flow {
        id: notesCheckViewList
        width: notesCheckView.width
        anchors.bottom: notesCheckView.bottom
    }

    NotesCheckToolBar {
        z: 1
        height: 32
        opacity:  1
        anchors {
            top: notesCheckViewList.top
            right: notesCheckViewList.right
            topMargin: 5
            rightMargin: 5
        }
    }


    Component.onCompleted: {
        for (let i = 0; i < lines.length; i++){
            checkBox.createObject(notesCheckViewList, {
                "width": notesCheckViewList.width,
                "text": lines[i],
                "pixelSize": notesCheckView.pixelSize
            })
        }
        notesTextAreaContainer0.height = notesCheckView.height
    }

    Component {
        id: checkBox
        NotesCheckBox {}
    }
}
