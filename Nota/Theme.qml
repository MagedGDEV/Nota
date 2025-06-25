pragma Singleton

import QtQuick

QtObject {


    // Main
    readonly property color accentColor: "#F6761F"

    // Font
    readonly property string primaryFontFamily: "Ubuntu"
    readonly property color primaryFontColor: "black"
    readonly property color secondaryFontColor: "#808080"

    // Background
    readonly property color primaryBackgroundColor: "transparent"
    readonly property color secondaryBackgroundColor: "#EEEEEE"
    readonly property color borderBackgroundColor: "#808080"

    // Icon
    readonly property int markupButtonIconSize: 10
    readonly property int smallIconSize: 15
    readonly property int mediumIconSize: 20


    // Add Text Area button
    readonly property int addPageIconSize: 28
    readonly property double addPageOpacityActive: 0.8
    readonly property double addPageOpacityInactive: 0.5


    readonly property int animationDuration: 500
    // Logo
    readonly property int logoSize: 50

}
