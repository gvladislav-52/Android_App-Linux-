import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

Item {

    Rectangle
    {
        id: rectangle_header
        color: "#1e1e1e"
        width: parent.width
        height: parent.height * 0.15

        Item
        {
            id: header_rowlayout
            anchors.top: rectangle_header.top
            anchors.topMargin: parent.height * 0.1
            width: parent.width
            height: parent.height * 0.3
            anchors.horizontalCenter: rectangle_header.horizontalCenter

            Image
            {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/ui/Image Header/arrow.png"
                width: rectangle_header.width*0.1
                height: rectangle_header.height *0.3
                fillMode: Image.PreserveAspectFit
                mirror: true

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        data_observation_widget.visible = false
                        main_window_account.enabled = true
                    }
                }
            }

            Text
            {
                    id: table_cal_text
                    text: "Твоя Информация"
                    color: "#FFFFFF"
                    font.pixelSize: header_rowlayout.height * 0.7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
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
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: rectangle_header.width/2
                Layout.preferredHeight: rectangle_header.height/2
                background: Rectangle
                {
                    id: backgroundRect
                    color: review_button.pressed ? "lightgray" : "transparent"
                    Text
                    {
                        text: "ВНЕСТИ"
                        color: !swipeView_information.currentIndex?"#FFFFFF":"gray"
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
                    swipeView_information.currentIndex = 0
                }


            }

            ToolButton
            {
                id: nutrition_button
                Layout.alignment: Qt.AlignRight
                Layout.preferredWidth: rectangle_header.width/2
                Layout.preferredHeight: rectangle_header.height/2
                background: Rectangle
                {
                    color: nutrition_button.pressed ? "lightgray" : "transparent"
                    Text
                    {
                        text: "ПОСМОТРЕТЬ"
                        color: swipeView_information.currentIndex?"#FFFFFF":"gray"
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
                    swipeView_information.currentIndex = 1
                }
            }
        }
    }

    Rectangle
    {
        visible: !swipeView_information.currentIndex
        anchors
        {
            bottom: rectangle_header.bottom
            left: rectangle_header.left
        }
        width: rectangle_header.width/2
        height: rectangle_header.height *0.05
        color: "#FFFFFF"
    }

    Rectangle
    {
        visible: swipeView_information.currentIndex
        anchors
        {
            bottom: rectangle_header.bottom
            right: rectangle_header.right
        }
        width: rectangle_header.width/2
        height: rectangle_header.height *0.05
        color: "#FFFFFF"
    }

        SwipeView
        {
            id: swipeView_information
            anchors.top: rectangle_header.bottom
            height: parent.height-rectangle_header.height
            width: parent.width
            Item
            {
                Rectangle
                {
                    anchors.fill: parent
                    color: "#121212"
                    ColumnLayout
                    {
                        width: parent.width
                        height: parent.height * 0.2
                        Repeater
                        {
                            model: Account_temp.account_characters.length
                            Item
                            {
                                Layout.preferredHeight: parent.height * 0.3
                                Layout.preferredWidth: parent.width * 0.9
                                Layout.alignment: Qt.AlignHCenter

                                Text
                                {
                                    anchors.left: parent.left
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: Account_temp.account_characters[index]
                                    color: "#FFFFFF"
                                    font.pixelSize: parent.height *0.5
                                }
                                Rectangle
                                {
                                    anchors.right: parent.right
                                    width: parent.width * 0.2
                                    height: parent.height
                                    color: "#1e1e1e"
                                    radius: 5
                                    border.color: "black"

                                    Text {
                                        anchors.right: parent.right
                                        anchors.rightMargin: parent.width * 0.1
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: "73,0"
                                        color: "#FFFFFF"
                                        font.pixelSize: parent.height *0.5
                                    }
                                }
                                Rectangle
                                {
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: -parent.height * 0.2
                                    width: parent.width
                                    height: parent.height * 0.025
                                    color: "#FFFFFF"
                                }
                            }
                        }
                    }
                }
            }

            Item
            {
                Rectangle
                {
                    anchors.fill: parent
                    color: "#121212"
                    ColumnLayout
                    {
                        width: parent.width
                        height: parent.height * 0.2
                        Repeater
                        {
                            model: Account_temp.account_characters.length
                            Item
                            {
                                Layout.preferredHeight: parent.height * 0.3
                                Layout.preferredWidth: parent.width * 0.9
                                Layout.alignment: Qt.AlignHCenter

                                Text
                                {
                                    anchors.left: parent.left
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: Account_temp.account_characters[index]
                                    color: "#FFFFFF"
                                    font.pixelSize: parent.height *0.5
                                }

                                Rectangle
                                {
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: -parent.height * 0.2
                                    width: parent.width
                                    height: parent.height * 0.025
                                    color: "#FFFFFF"
                                }
                            }
                        }
                    }
                }
            }
        }


}