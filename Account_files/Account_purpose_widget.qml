import QtQuick 2.15
import QtQuick.Layouts

Item {

    property var purpose_name:
    [
        "Цель",
        "Дневной прием",
        "Ожидаемый вес",
        "Мой питьевой режим",
        "Твой обмен веществ"
    ]
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

            // Repeater
            // {
            //     model: Account_temp.purpose_object.purpose_name_static.length

                Rectangle
                {
                    Layout.preferredHeight: parent.height*0.2
                    Layout.preferredWidth: parent.width
                    color: "transparent"
                    Text
                    {
                        id: purpose
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        text: purpose_name[0]
                        color: "lightgray"
                        font.pixelSize: parent.height*0.3
                    }

                    Image
                    {
                        anchors.left: purpose.right
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
                        text: Main_logic_temp.Train_option
                        color: "green"
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

                Rectangle
                {
                    Layout.preferredHeight: parent.height*0.2
                    Layout.preferredWidth: parent.width
                    color: "transparent"
                    Text
                    {
                        id: аfternoon_reception
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        text: purpose_name[1]
                        color: "lightgray"
                        font.pixelSize: parent.height*0.3
                    }

                    Image
                    {
                        anchors.left: аfternoon_reception.right
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
                        text: Main_logic_temp.Target_metabolism + " ккал."
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
                }

                Rectangle
                {
                    Layout.preferredHeight: parent.height*0.2
                    Layout.preferredWidth: parent.width
                    color: "transparent"
                    Text
                    {
                        id: expected_weight
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        text: purpose_name[2]
                        color: "lightgray"
                        font.pixelSize: parent.height*0.3
                    }

                    Image
                    {
                        anchors.left: expected_weight.right
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
                        text: Main_logic_temp.Target_weight
                        color: "green"
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

                Rectangle
                {
                    Layout.preferredHeight: parent.height*0.2
                    Layout.preferredWidth: parent.width
                    color: "transparent"
                    Text
                    {
                        id: drinking_regime
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        text: purpose_name[3]
                        color: "lightgray"
                        font.pixelSize: parent.height*0.3
                    }

                    Image
                    {
                        anchors.left: drinking_regime.right
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
                        text: Main_logic_temp.Drinking_regime + " л"
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
                }

                Rectangle
                {
                    Layout.preferredHeight: parent.height*0.2
                    Layout.preferredWidth: parent.width
                    color: "transparent"
                    Text
                    {
                        id: metabolism
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        text: purpose_name[4]
                        color: "lightgray"
                        font.pixelSize: parent.height*0.3
                    }

                    Image
                    {
                        anchors.left: metabolism.right
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
                        text: Main_logic_temp.Metabolism + " ккал."
                        color: "green"
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
            //}
        }
    }
}
