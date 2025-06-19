import QtQuick
import QtQuick.Layouts

import Nota

Item {

    id: root

    property int _margins: 20

    implicitWidth: 100
    implicitHeight: 700

    Image {
        id: logo
        width: 50
        height: 50
        source: "../../resources/icons/logo.png"
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
                source: "../../resources/icons/svg/templates.svg"
                width: 20
                height: 20
            }
            flat: true
        }

        VerticalBarButton {

            Layout.fillWidth: true
            id: importBtn
            objectName: "importBtn"
            text: "Import"
            icon {
                source: "../../resources/icons/svg/download.svg"
                width: 20
                height: 20
            }
            flat: true
        }

        VerticalBarButton {

            Layout.fillWidth: true
            id: trashBtn
            objectName: "trashBtn"
            text: "Trash"
            icon {
                source: "../../resources/icons/svg/trash.svg"
                width: 20
                height: 20
            }
            flat: true
        }

        Text {
            id: workspaceTxt
            text: "WORKSPACE"
            color: "#808080"
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
                    source: "../../resources/icons/svg/hashtag.svg"
                    width: 20
                    height: 20
                }
                flat: true
            }

            VerticalBarButton {

                Layout.fillWidth: true
                id: developmentBtn
                objectName: "developmentBtn"
                text: "Development"
                icon {
                    source: "../../resources/icons/svg/development.svg"
                    width: 20
                    height: 20
                }
                flat: true
            }

            VerticalBarButton {

                Layout.fillWidth: true
                id: achievementsBtn
                objectName: "achievementsBtn"
                text: "Achievements"
                icon {
                    source: "../../resources/icons/svg/cup.svg"
                    width: 20
                    height: 20
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
            source: "../../resources/icons/svg/add.svg"
            width: 20
            height: 20
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

