import QtQuick
import QtQuick.Layouts
import QtCore


Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")



    Settings {
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }



    ColumnLayout {
        id: header
        objectName: "header"
        anchors.fill: parent
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.1
        }

        RowLayout {
            id: sectionsLayout
            objectName: "sectionsLayout"
            Layout.preferredWidth: parent.width
            Layout.fillHeight: true

            Rectangle {
                id: sideBarSection
                objectName: "sideBarSection"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                color: "#a0a6a5"
            }

            Rectangle {
                id: notesSection
                objectName: "notesSection"
                Layout.preferredWidth: parent.width * 0.35
                Layout.fillHeight: true
                color: "#f6761f"
            }
            Rectangle {
                id: goalsSection
                objectName: "goalsSection"
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.5
                color: "#474e41"
            }
        }
    }


}
