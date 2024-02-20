import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    title: qsTr("Android App")

    Rectangle
    {
        id: main_background
        color: "#121212"
        anchors.fill: parent
    }

    ColumnLayout
    {
        anchors.fill: parent
        spacing: 0
        Header
        {
            id: main_header
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height*0.15
        }

        RowLayout
        {
            id: calendar_rowlayout
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height*0.1

            Image
            {
                id: calendar_left_button
                source: "qrc:/ui/Image Calendar/arrow.png"
                anchors.left: parent.left
                Layout.preferredHeight: parent.height*0.4
                Layout.preferredWidth: parent.width *0.1
                fillMode: Image.PreserveAspectFit
                mirror: true
            }

            RowLayout
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                Image
                {
                    id: calendar_image
                    source: "qrc:/ui/Image Calendar/calendar.png"
                    Layout.fillHeight: true
                    Layout.maximumWidth: parent.width*0.2
                    fillMode: Image.PreserveAspectFit
                    anchors.left: parent.left
                }

                Text
                {
                    id: calendar_text_data
                    anchors.right: parent.right
                    font.pixelSize: parent.height*0.3
                    text: qsTr("20.02.2024")
                    color: "#FFFFFF"
                }
            }

            Image
            {
                id: calendar_right_button
                source: "qrc:/ui/Image Calendar/arrow.png"
                anchors.right: parent.right
                Layout.preferredHeight: parent.height*0.4
                Layout.preferredWidth: parent.width *0.1
                fillMode: Image.PreserveAspectFit
            }
        }

        Item
        {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height*0.75
            Review_field
            {
                visible: Header_widget.page_temp
                anchors.fill: parent
            }

            Nutrition_field
            {
                visible: !Header_widget.page_temp
                anchors.fill: parent
            }
        }
    }
}
