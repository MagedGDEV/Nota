import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Item {
    id: root
    implicitWidth: 400
    implicitHeight: 700
    property int _margin: 20

    ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            Layout.topMargin: root._margin
            Rectangle {
                width: parent.width * 0.8
                height: parent.height * 0.8
                radius: width / 2
                anchors.horizontalCenter: parent.horizontalCenter

                border {
                    width: 1
                    color: Theme.borderBackgroundColor
                }

                RowLayout {
                    width: parent.width * 0.8
                    anchors {
                        centerIn: parent
                    }

                    Image {
                        Layout.preferredHeight: Theme.smallIconSize
                        Layout.preferredWidth: Theme.smallIconSize
                        source: "qrc:/icons/svg/search.svg"
                        sourceSize.height: Layout.preferredHeight * 1.5
                        sourceSize.width: Layout.preferredWidth * 1.5
                    }

                    TextField {
                        Layout.fillWidth: true
                        color: Theme.primaryFontColor
                        placeholderTextColor: Theme.secondaryFontColor
                        placeholderText: "Search Notes"
                        background: null
                    }

                }
            }
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.topMargin: root._margin
            Text {
                text: "Workspace"
                font {
                    pixelSize: 28

                }
            }
        }




        ListView {
            id: workspaceListView
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            spacing: 5
            model: 15

            ScrollBar.vertical: ScrollBar {

            }

            delegate: Rectangle {
                width: workspaceListView.width
                height: 150
                radius: 25
                color: Theme.secondaryBackgroundColor
            }


        }


    }


}



