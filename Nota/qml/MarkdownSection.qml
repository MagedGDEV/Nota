import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Nota

Item {
    id: root
    implicitWidth: 400
    implicitHeight: 700
    property int _margin: 20


    ColumnLayout {
        anchors.fill: parent
        Rectangle {
            Layout.topMargin: root._margin
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            radius: height / 2
            color: Theme.secondaryBackgroundColor
        }

        Image {
            source: "qrc:/icons/illustrations/study.svg"
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 300
            sourceSize.width: 300
            Layout.alignment: Qt.AlignHCenter
        }
        ScrollView {
            Layout.margins: root._margin
            Layout.fillHeight: true
            Layout.fillWidth: true

            Flow {
                id: notesList
                anchors.fill: parent
                Layout.margins: _margin

                clip: true

                Component.onCompleted: {
                    textAreaComponent.createObject(notesList)
                    textAreaComponent.createObject(notesList)
                    textAreaComponent.createObject(notesList)
                    textAreaComponent.createObject(notesList)
                    textAreaComponent.createObject(notesList)
                    textAreaComponent.createObject(notesList)
                    textAreaComponent.createObject(notesList)
                    textAreaComponent.createObject(notesList)
                    textAreaComponent.createObject(notesList)
                    textAreaComponent.createObject(notesList)
                }
            }
        }


    }


    Component {
        id: textAreaComponent
        NotesTextArea {
            width: notesList.width
            radius: 10
        }
    }

}
