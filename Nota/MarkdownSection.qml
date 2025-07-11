pragma ComponentBehavior: Bound
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
            id: notesView
            Layout.fillHeight: true
            Layout.fillWidth: true

            Flow {
                id: notesList
                clip: true
                width: notesView.width
            }

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical: ScrollBar {

                id: scrollBar
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }
                policy: ScrollBar.AlwaysOn
                width: 10
                minimumSize: 0.1

                background: Rectangle {
                    height: parent.height
                    implicitWidth: 10
                    color: Theme.primaryBackgroundColor
                }

                contentItem: Rectangle {
                    implicitWidth: 5
                    implicitHeight: 75
                    radius: width / 2
                    color: Theme.accentColor
                    opacity: scrollBar.active ? 1 : 0

                    Behavior on opacity {

                        NumberAnimation {
                            duration: Theme.animationDuration
                            easing.type: Easing.Linear
                        }
                    }
                }
            }
        }
    }

    RoundButton {
        id: addNote
        anchors {
            bottom: root.bottom
            right: root.right
            margins: root._margin
        }

        icon.width: 28
        icon.height: 28
        icon.color: "white"
        icon.source: "qrc:/icons/svg/plus-small.svg"
        onClicked: textAreaComponent.createObject(notesList)
        background: Rectangle {
            radius: width / 2
            anchors.fill: parent
            color: Theme.accentColor
            opacity: mouse.containsMouse ? Theme.addPageOpacityActive: Theme.addPageOpacityInactive
            MouseArea {
                id: mouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: mouse.containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                onClicked: addNote.clicked()
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
