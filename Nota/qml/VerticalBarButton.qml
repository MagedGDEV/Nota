import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Templates as T



T.Button {
    id: _control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                 implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    contentItem: RowLayout {
        spacing: 8
        Image {
            id: _icon
            source: _control.icon.source
            sourceSize.width: _control.icon.width
            sourceSize.height: _control.icon.height
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignVCenter
        }

        Text {
            id: _contentText
            text: _control.text
            color: Theme.primaryFontColor
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
        }
    }

    background: Rectangle {
        implicitHeight: _contentText.height + 10
        radius: 4
        color: _control.hovered ? Theme.secondaryBackgroundColor : Theme.primaryBackgroundColor
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: _control.hovered ? Qt.PointingHandCursor : Qt.ArrowCursor
        onClicked: _control.clicked()
    }
}
