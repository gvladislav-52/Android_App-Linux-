import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
Item {
    id: header_bar

    Rectangle
    {
        id: rectangle_header
        color: "#1e1e1e"
        width: parent.width
        height: parent.height

        RowLayout
        {
            id: header_rowlayout

            anchors.top: rectangle_header.top
            anchors.left: rectangle_header.left
            anchors.right: rectangle_header.right
            anchors.horizontalCenter: rectangle_header.horizontalCenter


            Image
            {
                id: menu_button
                anchors.left: header_rowlayout.left
                source: "qrc:/ui/Image Header/menu.png"
                Layout.preferredWidth: rectangle_header.width*0.1
                Layout.preferredHeight: rectangle_header.height *0.3
                fillMode: Image.PreserveAspectFit

                MouseArea
                {
                    anchors.fill: menu_button
                    onClicked: console.log("start menu")
                }
            }

            Text
            {
                    id: table_cal_text
                    text: "Таблица Калорийности"
                    color: "#FFFFFF"
                    font.pixelSize: header_rowlayout.height * 0.7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
            }

            Image
            {
                id: search_button
                anchors.right: header_rowlayout.right
                source: "qrc:/ui/Image Header/search.png"
                Layout.preferredWidth: rectangle_header.width*0.1
                Layout.preferredHeight: rectangle_header.height *0.3
                fillMode: Image.PreserveAspectFit

                MouseArea
                {
                    anchors.fill: search_button
                    onClicked: console.log("start search")
                }
            }
        }

        RowLayout
        {
            id: page_rowlayout

            anchors
            {
                top: header_rowlayout.bottom
                bottom: rectangle_header.bottom
                horizontalCenter: rectangle_header.horizontalCenter
            }


            ToolButton
            {
                id: review_button
                anchors.left: page_rowlayout.left
                Layout.preferredWidth: rectangle_header.width/2
                Layout.preferredHeight: rectangle_header.height/2
                background: Rectangle
                {
                    id: backgroundRect
                    color: review_button.pressed ? "lightgray" : "transparent"
                    Text
                    {
                        text: "ОБЗОР"
                        color: Header_widget.page_temp?"#FFFFFF":"gray"
                        font.pixelSize: page_rowlayout.height * 0.2
                        anchors
                        {
                            horizontalCenter: parent.horizontalCenter
                            verticalCenter: parent.verticalCenter
                        }
                    }
                    Behavior on color {
                                ColorAnimation {
                                    duration: 200
                                }
                            }
                }

                onClicked:
                {
                    Header_widget.page_temp = true
                }


            }

            ToolButton
            {
                id: nutrition_button
                anchors.right: page_rowlayout.right
                Layout.preferredWidth: rectangle_header.width/2
                Layout.preferredHeight: rectangle_header.height/2
                background: Rectangle
                {
                    color: nutrition_button.pressed ? "lightgray" : "transparent"
                    Text
                    {
                        text: "ПИТАНИЕ"
                        color: !Header_widget.page_temp?"#FFFFFF":"gray"
                        font.pixelSize: page_rowlayout.height * 0.2
                        anchors
                        {
                            horizontalCenter: parent.horizontalCenter
                            verticalCenter: parent.verticalCenter
                        }
                    }
                    Behavior on color {
                                ColorAnimation {
                                    duration: 200
                                }
                            }
                }

                onClicked:
                {
                    Header_widget.page_temp = false
                }
            }
        }
    }

    Rectangle
    {
        visible: Header_widget.page_temp
        anchors
        {
            bottom: rectangle_header.bottom
            left: rectangle_header.left
            horizontalCenter: review_button.horizontalCenter
        }
        width: rectangle_header.width/2
        height: rectangle_header.height *0.05
        color: "#FFFFFF"
    }

    Rectangle
    {
        visible: !Header_widget.page_temp
        anchors
        {
            bottom: rectangle_header.bottom
            right: rectangle_header.right
            horizontalCenter: nutrition_button.horizontalCenter
        }
        width: rectangle_header.width/2
        height: rectangle_header.height *0.05
        color: "#FFFFFF"
    }
}
