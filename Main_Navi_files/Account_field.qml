import QtQuick 2.15
import QtQuick.Layouts
import "../Account_files"

Item {
    Item
    {
        id: main_window_account
        anchors.fill: parent
        Rectangle
        {
            id: rectangle_header
            color: "#1e1e1e"
            width: parent.width
            height: parent.height * 0.075

                Image
                {
                    id: menu_button
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    source: "qrc:/ui/Image Header/menu.png"
                    width: parent.width*0.1
                    height:  parent.height*0.6
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
                        anchors
                        {
                            horizontalCenter: parent.horizontalCenter
                            verticalCenter: parent.verticalCenter
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
                            Layout.alignment: Qt.AlignLeft
                            text: "Аккаунт: "
                            color: "gray"
                            font.pixelSize: parent.height*0.5
                        }

                        Text
                        {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillWidth: true
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
                            Layout.alignment: Qt.AlignLeft
                            text: "Индекс массы тела: "
                            color: "gray"
                            font.pixelSize: parent.height*0.5
                        }

                        Text
                        {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillWidth: true
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
                            text: "Добавлено: "
                            color: "gray"
                            font.pixelSize: parent.height*0.5
                        }

                        Text
                        {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillWidth: true
                            text: "3 дней"
                            color: "white"
                            font.pixelSize: parent.height*0.5
                        }

                        Text
                        {
                            Layout.alignment: Qt.AlignRight
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
                height: (parent.height-profile_rectangle.height) *0.5
                width: parent.width *0.9
                anchors.horizontalCenter: parent.horizontalCenter

                Repeater
                {
                    model: Account_temp.account_name_button.length

                    Rectangle
                    {
                        Layout.preferredHeight: parent.height*0.2
                        Layout.preferredWidth: parent.width
                        color: profile_button_menu.pressed? "lightgray":"transparent"
                        Text
                        {
                            anchors.verticalCenter: parent.verticalCenter
                            text: Account_temp.account_name_button[index]
                            color: "lightgray"
                            font.pixelSize: parent.height*0.3
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
                            onClicked:
                            {
                                if(index === 0)
                                {
                                purpose_widget.visible = true
                                main_window_account.enabled = false
                                }
                                else if (index === 1)
                                {
                                    data_observation_widget.visible = true
                                    main_window_account.enabled = false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
        Account_purpose_widget {
            id: purpose_widget
            visible: false
            anchors.fill: parent
        }

        Account_data_observation_widget {
            id: data_observation_widget
            visible: false
            anchors.fill: parent
        }
}
