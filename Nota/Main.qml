import QtQuick
import QtQuick.Layouts
import QtCore

import Nota

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
