import QtQuick 2.15
import QtQuick.Controls

Window {
    visible: true
    title: qsTr("Android App")

    Rectangle
    {
        id: main_background
        color: Header_widget.page_temp ? "#121212": "blue"
        anchors.fill: parent
    }

    Header
    {
    anchors.fill: parent
    }
}
