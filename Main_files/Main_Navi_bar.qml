import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts

Item
{
    property var textVector:
    [
        "Мой профиль",
        "Рацион",
        "Рецепты",
        "Мои блюда",
        "Справка"
    ]

    property var imageVector:
    [
        "qrc:/ui/Image NaviBar/person.png",
        "qrc:/ui/Image NaviBar/schedule.jpg",
        "qrc:/ui/Image NaviBar/book.png",
        "qrc:/ui/Image NaviBar/food.png",
        "qrc:/ui/Image NaviBar/question.png"
    ]

    Rectangle
    {
        id: main_background
        anchors.fill: parent
        color: "#333333"

        ColumnLayout
        {
            width: parent.width
            height: parent.height*0.5
            anchors.left: parent.left
            anchors.top: parent.top
            spacing: 0
            Repeater
            {
                model: textVector.length
                Rectangle
                {
                    Layout.preferredHeight: parent.height*0.2
                    Layout.preferredWidth: parent.width
                    color: navi_buttons.pressed? "lightgray":"transparent"
                    RowLayout {
                        height: parent.height
                        width: parent.width / 1.5

                        Image {
                            id: image_bar
                            source: imageVector[index]
                            Layout.preferredHeight: parent.height * 0.4
                            Layout.preferredWidth: parent.width * 0.4
                            fillMode: Image.PreserveAspectFit
                        }

                            Text {
                                text: textVector[index]
                                font.pixelSize: parent.height * 0.3
                                color: "lightgray"
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                 Layout.fillWidth: true
                            }

                    }
                    Behavior on color {
                        ColorAnimation {
                                duration: 200
                            }
                        }
                    MouseArea
                    {
                        id: navi_buttons
                        anchors.fill: parent
                        onClicked:
                        {
                            if(index === 0)
                            {
                                account_temp.visible = true
                                schedule_temp.visible = false
                            }
                            else if(index === 1)
                            {
                                account_temp.visible = false
                                schedule_temp.visible = true
                            }
                            mainbar.currentIndex = 1;
                        }
                    }
                }
            }
        }

        Text
        {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: parent.height/100
            anchors.rightMargin: parent.width/100
            text: qsTr("created by VG .2024")
            font.pixelSize: parent.height/100
            color: "darkgray"
        }
    }
}
