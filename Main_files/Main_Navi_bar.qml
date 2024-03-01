import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts

Item
{
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
                model: Navi_temp.name_navi_bar.length
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
                            source: Navi_temp.path_icon[index]
                            Layout.preferredHeight: parent.height * 0.4
                            Layout.preferredWidth: parent.width * 0.4
                            fillMode: Image.PreserveAspectFit
                        }

                            Text {
                                text: Navi_temp.name_navi_bar[index]
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
