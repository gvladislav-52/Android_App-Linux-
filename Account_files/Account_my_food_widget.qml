import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Item {
    Item
    {
        anchors.fill: parent
        id: food_list
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
                        my_food_widget.visible = false
                        main_window_account.enabled = true
                    }
                }
            }

            Text
            {
                    text: "Моя еда"
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

        Item
        {
            id: main_scroll_item_food
            anchors.fill: parent
            ScrollView
            {
                anchors.fill: parent
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                contentHeight: list_my_food.height * 1.05

            ColumnLayout {
                id: list_my_food
                width: parent.width *0.9
                anchors
                {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
                }
                    Repeater {
                        id: my_food_repeater
                        model: My_food_temp.my_food_static.length

                        Item {
                            Layout.preferredHeight: main_scroll_item_food.height* 0.1
                            Layout.preferredWidth: parent.width

                            Image
                            {
                                anchors
                                {
                                    left:parent.left
                                    verticalCenter:parent.verticalCenter
                                }
                                source: "qrc:/ui/Image NaviBar/food.png"
                                width: parent.height
                                height: parent.height
                                fillMode: Image.PreserveAspectFit
                            }

                            Text
                            {
                                text: My_food_temp.my_food_static[index]
                                color: "gray"
                                font.pixelSize: parent.height * 0.3
                                anchors
                                {
                                    horizontalCenter: parent.horizontalCenter
                                    verticalCenter:parent.verticalCenter
                                }
                            }

                            Image
                            {
                                anchors
                                {
                                    right:parent.right
                                    rightMargin: parent.width * 0.03
                                    verticalCenter:parent.verticalCenter
                                }
                                source: "qrc:/ui/Image Main/cancel.jpg"
                                width: parent.height * 0.3
                                height: parent.height * 0.3
                            }

                            MouseArea
                            {
                                anchors.fill: parent
                                onClicked:
                                {
                                    view_my_food.static_index = index
                                    view_my_food.enabled = true
                                    view_my_food.visible = true
                                    add_my_food.enabled = false
                                    food_list.enabled = false
                                }
                            }
                        }
                    }
                    Item
                    {
                        Layout.preferredHeight: main_scroll_item_food.height* 0.1
                        Layout.preferredWidth: parent.width*0.6
                        Layout.alignment: Qt.AlignHCenter

                        Image
                        {
                            anchors
                            {
                            left: parent.left
                            verticalCenter: parent.verticalCenter
                            }
                            source: "qrc:/ui/Image Main/addfile.jpg"
                            height: parent.height * 0.4
                            width: parent.height * 0.4
                        }

                        Text
                        {
                            text: "Добавить еду"
                            anchors
                            {
                                horizontalCenter: parent.horizontalCenter
                                verticalCenter: parent.verticalCenter
                            }
                            color: "green"
                            font.pixelSize: parent.height * 0.3
                        }

                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                add_my_food.visible = true
                                add_my_food.enabled = true
                                food_list.enabled = false
                                view_my_food.enabled = false
                            }
                        }
                    }
                }
            }
        }
    }

    }

    Add_my_food
    {
        id: add_my_food
        visible: false
    }

    VIew_my_food
    {
        id: view_my_food
        visible: false
        static_index: 0
    }
}
