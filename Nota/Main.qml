import QtQuick
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

}
