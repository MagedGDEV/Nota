pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts


Item {

    id: root
    property int _margins: 20

    implicitWidth: 100
    implicitHeight: 700

    Image {
        id: logo
        width: 50
        height: 50
        source: "qrc:/icons/logo.png"
        fillMode: Image.PreserveAspectFit

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: root._margins
        }
    }
    ColumnLayout {
        id: sectionsLayout
        objectName: "sectionsLayout"
        anchors {
            top: logo.bottom
            left: parent.left
            right: parent.right
            topMargin: root._margins
            leftMargin: 10
            rightMargin: 12
        }

        VerticalBarButton {

            Layout.fillWidth: true
            id: templatesBtn
            objectName: "templatesBtn"
            text: "Templates"
            icon {
                source: "qrc:/icons/svg/duplicate.svg"
                width: Theme.mediumIconSize
                height: Theme.mediumIconSize
            }
            flat: true
        }

        VerticalBarButton {

            Layout.fillWidth: true
            id: importBtn
            objectName: "importBtn"
            text: "Import"
            icon {
                source: "qrc:/icons/svg/download.svg"
                width: Theme.mediumIconSize
                height: Theme.mediumIconSize
            }
            flat: true
        }

        VerticalBarButton {

            Layout.fillWidth: true
            id: trashBtn
            objectName: "trashBtn"
            text: "Trash"
            icon {
                source: "qrc:/icons/svg/trash.svg"
                width: Theme.mediumIconSize
                height: Theme.mediumIconSize
            }
            flat: true
        }

        Text {
            id: workspaceTxt
            text: "WORKSPACE"
            color: Theme.secondaryFontColor
            padding: 20
            Layout.alignment: Qt.AlignHCenter
        }

        ColumnLayout {
            id: workspaceLayout
            objectName: "sectionsLayout"
            VerticalBarButton {

                Layout.fillWidth: true
                id: tasksBtn
                objectName: "tasksBtn"
                text: "Tasks"
                icon {
                    source: "qrc:/icons/svg/hastag.svg"
                    width: Theme.mediumIconSize
                    height: Theme.mediumIconSize
                }
                flat: true
            }

            VerticalBarButton {

                Layout.fillWidth: true
                id: developmentBtn
                objectName: "developmentBtn"
                text: "Development"
                icon {
                    source: "qrc:/icons/svg/square-terminal.svg"
                    width: Theme.mediumIconSize
                    height: Theme.mediumIconSize
                }
                flat: true
            }

            VerticalBarButton {

                Layout.fillWidth: true
                id: achievementsBtn
                objectName: "achievementsBtn"
                text: "Achievements"
                icon {
                    source: "qrc:/icons/svg/trophy.svg"
                    width: Theme.mediumIconSize
                    height: Theme.mediumIconSize
                }
                flat: true
            }

        }

    }

    VerticalBarButton {
        id: newPage
        objectName: "newPageBtn"
        text: "New Page"
        icon {
            source: "qrc:/icons/svg/add.svg"
            width: Theme.mediumIconSize
            height: Theme.mediumIconSize
        }
        anchors {
            bottom: root.bottom
            left: root.left
            right: root.right
            bottomMargin: root._margins
            leftMargin: 10
            rightMargin: 12
        }
        flat: true

        onClicked: {
            Client.addTable("New Goals")
        }
    }

}

