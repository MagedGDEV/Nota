import QtQuick
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

    RowLayout {
        id: sectionsLayout
        objectName: "sectionsLayout"
        anchors.fill: parent

        SideBar {
            id: sideBarSection
            objectName: "sideBarSection"
            Layout.preferredWidth: parent.width * 0.15
            Layout.fillHeight: true

        }

        WorkspaceSection {
            id: notesSection
            objectName: "notesSection"
            Layout.preferredWidth: parent.width * 0.3
            Layout.fillHeight: true
            Layout.bottomMargin: 5
        }
        MarkdownSection {
            id: goalsSection
            objectName: "goalsSection"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.bottomMargin: 5
        }
    }
}
