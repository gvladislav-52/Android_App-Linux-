import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

Item
{
    id: track
    anchors.fill: parent
    ScrollView
    {
        anchors.fill: parent
        clip: true
        ScrollBar.vertical.policy: ScrollBar.AlwaysOff
        contentHeight: lol.height * 1.05

    ColumnLayout {
        id: lol
        width: parent.width *0.9
        //height: parent.height
        anchors
        {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        }
        //spacing: 10
            Repeater {
                model: 7

                Rectangle {
                    id: rectangle_schedule
                    Layout.preferredHeight: track.height* 0.07
                    Layout.preferredWidth: parent.width

                    color: "#1e1e1e"
                    radius: 10
                    RowLayout {
                        anchors.fill: parent
                        Text
                        {
                            text: Nutriton_temp.meal_schedule_string[index]
                            font.pixelSize: parent.height * 0.4
                            color: "gray"
                            anchors
                            {
                                verticalCenter:parent.verticalCenter
                                left: parent.left
                                leftMargin: parent.width*0.03
                            }
                        }

                        Text
                        {
                            text: "2232 ккал."
                            font.pixelSize: parent.height*0.3
                            color: "gray"
                            anchors
                            {
                                verticalCenter:parent.verticalCenter
                                right: dot_image.left
                                rightMargin: parent.width * 0.03
                            }
                        }

                        Image
                        {
                            id: dot_image
                            source: "qrc:/ui/Image Main/dot.png"
                            Layout.preferredHeight: parent.height * 0.6
                            Layout.preferredWidth: parent.height * 0.6
                            smooth: true
                            fillMode: Image.PreserveAspectFit
                            anchors
                            {
                                verticalCenter: parent.verticalCenter
                                right: plus_image.left
                                rightMargin: parent.width * 0.03
                            }
                        }

                        Image
                        {
                            id: plus_image
                            source: "qrc:/ui/Image Main/plus.png"
                            Layout.preferredHeight: parent.height * 0.6
                            Layout.preferredWidth: parent.height * 0.6
                            smooth: true
                            fillMode: Image.PreserveAspectFit
                            anchors
                            {
                                verticalCenter: parent.verticalCenter
                                right: parent.right
                                rightMargin: parent.width * 0.02
                            }
                        }
                    }
                    border.color: "black"
                }
            }

            Repeater {
                id: test
                model: 0

                RowLayout {
                    Layout.preferredHeight: track.height* 0.07
                    Layout.preferredWidth: parent.width

                    Text
                    {
                        text: Nutriton_temp.meal_schedule_string[index]
                        color: "gray"
                        font.pixelSize: parent.height * 0.3
                        anchors
                        {
                            verticalCenter:parent.verticalCenter
                            left: parent.left
                            leftMargin: parent.width*0.03
                        }
                    }

                    Image
                    {
                        anchors
                        {
                            right: parent.right
                            rightMargin: parent.width*0.03
                        }
                        source: "qrc:/ui/Image Main/cancel.jpg"
                        Layout.preferredHeight: parent.height * 0.4
                        Layout.preferredWidth: parent.height * 0.4
                    }
                }
            }
            RowLayout
            {
                Layout.preferredHeight: track.height* 0.1
                Layout.preferredWidth: parent.width
                anchors.horizontalCenter:parent.horizontalCenter

                Image
                {
                    anchors
                    {
                        right: add_button.left
                        rightMargin: parent.width*0.03
                    }
                    source: "qrc:/ui/Image Main/addfile.jpg"
                    Layout.preferredHeight: parent.height * 0.4
                    Layout.preferredWidth: parent.height * 0.4
                }

                Text
                {
                    id: add_button
                    text: "Добавить заметку"
                    anchors
                    {
                        verticalCenter:parent.verticalCenter
                        horizontalCenter:parent.horizontalCenter
                    }
                    color: "gray"
                    font.pixelSize: parent.height * 0.3
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        Nutriton_temp.add_schedule_string()
                        test.model = test.model+1
                    }
                }
            }
        }
    }
}
