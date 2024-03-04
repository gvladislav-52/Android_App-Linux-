import QtQuick 2.15
import QtQuick.Layouts

Item {

    Rectangle
    {
        id: rectangle_header
        color: "#1e1e1e"
        width: parent.width
        height: parent.height * 0.075

            Image
            {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source: "qrc:/ui/Image Header/arrow.png"
                width: parent.width*0.1
                height:  parent.height*0.6
                fillMode: Image.PreserveAspectFit
                mirror: true

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        purpose_widget.visible = false
                        main_window_account.enabled = true
                    }
                }
            }

            Text
            {
                    text: "Собственная цель"
                    color: "#FFFFFF"
                    font.pixelSize: parent.height *0.4
                    anchors
                    {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
            }
        }

    Rectangle
    {
        anchors.top: rectangle_header.bottom
        height: parent.height-rectangle_header.height
        width: parent.width
        color: "#121212"

        ColumnLayout
        {
            height: parent.height * 0.4
            width: parent.width *0.9
            anchors.horizontalCenter: parent.horizontalCenter

            Repeater
            {
                model: Account_temp.purpose_object.purpose_name_static.length

                Rectangle
                {
                    Layout.preferredHeight: parent.height*0.2
                    Layout.preferredWidth: parent.width
                    color: "transparent"
                    Text
                    {
                        id: text_purpose
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        text: Account_temp.purpose_object.purpose_name_static[index]
                        color: "lightgray"
                        font.pixelSize: parent.height*0.3
                    }

                    Image
                    {
                        anchors.left: text_purpose.right
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/ui/Image Main/info.png"
                        width: parent.width * 0.1
                        height: parent.height * 0.3
                        fillMode: Image.PreserveAspectFit
                    }

                    Text
                    {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        text: Account_temp.purpose_object.purpose_index_dynamic[index]
                        color: index%2? "lightgray":"green"
                        font.pixelSize: parent.height*0.3
                    }

                    Rectangle
                    {
                        anchors.bottom: parent.bottom
                        height: parent.height*0.025
                        width: parent.width
                        color: "lightgray"
                    }
                }
            }
        }
    }
}
