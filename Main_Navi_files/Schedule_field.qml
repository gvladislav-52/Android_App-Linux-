import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../Schedule_files"
Item {
    property var  temp_swipe: true
    property var  temp_header: true
    ColumnLayout
    {
        anchors.fill: parent
        spacing: 0
        Header
        {
            id: main_header
            enabled: temp_header
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
                //anchors.left: parent.left
                Layout.alignment: Qt.AlignLeft
                Layout.preferredHeight: parent.height*0.4
                Layout.preferredWidth: parent.width *0.1
                fillMode: Image.PreserveAspectFit
                mirror: true
            }

            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Image
                {
                    id: calendar_image
                    source: "qrc:/ui/Image Calendar/calendar.png"
                    Layout.fillHeight: true
                    Layout.maximumWidth: parent.width*0.2
                    fillMode: Image.PreserveAspectFit
                    Layout.alignment: Qt.AlignLeft
                }

                Text
                {
                    id: calendar_text_data
                    Layout.alignment: Qt.AlignRight
                    font.pixelSize: parent.height*0.3
                    text: qsTr("20.02.2024")
                    color: "gray"
                }
            }

            Image
            {
                id: calendar_right_button
                source: "qrc:/ui/Image Calendar/arrow.png"
                Layout.alignment: Qt.AlignRight
                Layout.preferredHeight: parent.height*0.4
                Layout.preferredWidth: parent.width *0.1
                fillMode: Image.PreserveAspectFit
            }
        }

        SwipeView {
                id: swipeView
                enabled: temp_swipe
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height*0.75

                Item {
                    Review_field
                        {
                            anchors.fill: parent
                        }
                }

                Item {
                    Nutrition_field
                        {
                            anchors.fill: parent
                        }
                }
            }
    }
}
