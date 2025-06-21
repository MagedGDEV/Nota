import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCore


Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: "Nota"



    Settings {
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }

    Rectangle {
        id: textSpace
        anchors.centerIn: parent
        width: 400
        height: textArea.implicitHeight

        color: "#EEEEEE"
        border {
            color: textArea.focus ? "black" : "transparent"
        }

        TextArea {
            id: textArea
            anchors.fill: parent
            placeholderText: "Markdown Text Area"
            placeholderTextColor: "#808080"
            color: "black"

            Keys.onReturnPressed: (event) => {
                // meta modifier read on macos "ctrl"
                // control modifier read on macos "cmd"
                if (event.modifiers & Qt.MetaModifier)
                    insert(textArea.text.length, '\n')
                else
                    editingFinished()
            }

            onEditingFinished: {
                focus = false
            }
        }
    }

    Rectangle {

        height: 45
        width: 175
        radius: 5
        opacity: textArea.focus ? 1 : 0
        anchors {
            bottom: textSpace.top
            right: textSpace.right
        }

        border {
            width: 1
            color: "#808080"
        }


        Behavior on opacity {

            NumberAnimation {
                duration: 500
                easing.type: Easing.Linear
            }
        }

        RowLayout {
            anchors.fill: parent
            anchors.margins: 6

            Button {
                contentItem: Item {
                    anchors.fill: parent
                    Text {
                        text: "i"
                        color: "black"
                        anchors.centerIn: parent

                    }
                }

                Layout.preferredHeight: 30
                Layout.preferredWidth: 30
                background: Rectangle {
                    radius: 5
                    color: "transparent"
                    border {
                        width: 1
                        color: "#EEEEEE"
                    }
                }


                onClicked: {
                    textArea.font.pixelSize++;
                }

            }

            Item{Layout.fillWidth: true}

            Button {

                contentItem: Item {
                    anchors.fill: parent
                    Text {
                        text: "d"
                        color: "black"
                        anchors.centerIn: parent

                    }
                }

                Layout.preferredHeight:30
                Layout.preferredWidth: 30
                background: Rectangle {

                    radius: 5
                    color: "transparent"
                    border {
                        width: 1
                        color: "#EEEEEE"
                    }
                }

                onClicked: {
                    textArea.font.pixelSize--;
                }

            }

            Item{Layout.fillWidth: true}

            Button {
                contentItem: Item {
                    anchors.fill: parent
                    Text {
                        text: "f"
                        color: "black"
                        anchors.centerIn: parent

                    }
                }

                Layout.preferredHeight:30
                Layout.preferredWidth: 30
                background: Rectangle {
                    radius: 5
                    color: "transparent"
                    border {
                        width: 1
                        color: "#EEEEEE"
                    }
                }

            }

            Item{Layout.fillWidth: true}

            Button {
                contentItem: Item {
                    anchors.fill: parent
                    Text {
                        text: "c"
                        color: "black"
                        anchors.centerIn: parent

                    }
                }

                Layout.preferredHeight:30
                Layout.preferredWidth: 30
                background: Rectangle {
                    radius: 5
                    color: "transparent"
                    border {
                        width: 1
                        color: "#EEEEEE"
                    }
                }
                onClicked: {
                    textArea.color = "red"
                }
            }
        }
    }


}
