import QtQuick 2.15
import QtQuick.Layouts
Item {

        Rectangle
        {
            id: rectangle_header
            color: "#1e1e1e"
            width: parent.width
            height: parent.height * 0.075

            RowLayout
            {
                id: header_rowlayout

                anchors.top: rectangle_header.top
                anchors.left: rectangle_header.left
                anchors.right: rectangle_header.right
                anchors.bottom: rectangle_header.bottom
                anchors.horizontalCenter: rectangle_header.horizontalCenter


                Image
                {
                    id: menu_button
                    anchors.left: header_rowlayout.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/ui/Image Header/menu.png"
                    Layout.preferredWidth: rectangle_header.width*0.1
                    Layout.preferredHeight: rectangle_header.height *0.6
                    fillMode: Image.PreserveAspectFit

                    MouseArea
                    {
                        anchors.fill: menu_button
                        onClicked:
                        {
                            mainbar.currentIndex = 0
                        }
                    }
                }

                Text
                {
                        id: table_cal_text
                        text: "Мой профиль"
                        color: "#FFFFFF"
                        font.pixelSize: rectangle_header.height *0.4
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

        Item {
            anchors.top: rectangle_header.bottom
            height: parent.height-rectangle_header.height
            width: parent.width

            Rectangle
            {
                id: profile_rectangle
                anchors.top: parent.top
                anchors.topMargin: parent.height*0.02
                height: parent.height*0.2
                width: parent.width*0.975
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#1e1e1e"
                radius: 10
                border.color: "black"

                ColumnLayout
                {
                    width: parent.width*0.9
                    height: parent.height*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    RowLayout
                    {
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height*0.3
                        Text
                        {
                            anchors.left: parent.left
                            text: "Аккаунт: "
                            color: "gray"
                            font.pixelSize: parent.height*0.5
                        }

                        Text
                        {
                            anchors.right: parent.right
                            text: "vlad.grachev.9700@mail.ru"
                            color: "white"
                            font.pixelSize: parent.height*0.5
                        }
                    }

                    RowLayout
                    {
                        Layout.fillWidth: true
                        Layout.preferredHeight: parent.height*0.3
                        Text
                        {
                            anchors.left: parent.left
                            text: "Индекс массы тела: "
                            color: "gray"
                            font.pixelSize: parent.height*0.5
                        }

                        Text
                        {
                            anchors.right: parent.right
                            text: "22, 2"
                            color: "white"
                            font.pixelSize: parent.height*0.5
                        }
                    }

                    RowLayout
                    {
                        Layout.preferredWidth: parent.width
                        Layout.preferredHeight: parent.height*0.3
                        Text
                        {
                            id: data_text
                            anchors.left: parent.left
                            text: "Добавлено: "
                            color: "gray"
                            font.pixelSize: parent.height*0.5
                        }

                        Text
                        {
                            anchors.left: data_text.right
                            anchors.leftMargin: parent.width*0.05
                            text: "3 дней"
                            color: "white"
                            font.pixelSize: parent.height*0.5
                        }

                        Text
                        {
                            anchors.right: parent.right
                            text: "Выход"
                            color: "green"
                            font.pixelSize: parent.height*0.5
                        }
                    }
                }
            }

            ColumnLayout
            {
                anchors.top: profile_rectangle.bottom
                anchors.topMargin: parent.height*0.025
                height: (parent.height-profile_rectangle.height) *0.7
                width: parent.width *0.9
                anchors.horizontalCenter: parent.horizontalCenter

                Repeater
                {
                    model: Account_temp.account_name_button.length

                    Rectangle
                    {
                        Layout.preferredHeight: parent.height*0.1
                        Layout.preferredWidth: parent.width
                        color: profile_button_menu.pressed? "lightgray":"transparent"
                        Text
                        {
                            anchors.verticalCenter: parent.verticalCenter
                            text: Account_temp.account_name_button[index]
                            color: "lightgray"
                            font.pixelSize: parent.height*0.4
                        }

                        Rectangle
                        {
                            anchors.bottom: parent.bottom
                            height: parent.height*0.025
                            width: parent.width
                            color: "lightgray"
                        }

                        Behavior on color
                        {
                            ColorAnimation
                            {
                               duration: 200
                            }
                        }

                        MouseArea
                        {
                            id: profile_button_menu
                            anchors.fill: parent
                            onClicked: console.log("work button mennu")
                        }
                    }
                }
            }
        }
}
