import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import "../Main_Navi_files"
import "../Schedule_files"

Window {
    visible: true
    title: qsTr("Android App")

    property int repeater_index
    Rectangle
    {
        id: main_background
        color: "#121212"
        anchors.fill: parent
    }

    Schedule_field
    {
        id: schedule_temp
        anchors.fill: parent
    }

    VIew_composition_foods
    {
        id: view_composition_foods_
        visible: false
        enabled: false
    }

    Foods_menu
    {
        id: foods_menu
        visible: false
        enabled: false
    }

    View_foods_item
    {
        id: view_foods_item
        visible: false
        enabled: false
    }

    Account_field
    {
        id: account_temp
        anchors.fill: parent
        visible: false
    }

    SwipeView
    {
        id: mainbar
        enabled: false
        width: parent.width
        height: parent.height
        currentIndex: 1
        Item
        {
                Main_Navi_bar
                {
                    width: parent.width/1.5
                    height: parent.height
                }
        }

        Item
        {
            Rectangle
            {
                anchors.fill: parent
                color: "transparent"
            }
        }


        onCurrentIndexChanged:
        {
            if(currentIndex === 0)
            {
                schedule_temp.temp_swipe = false
                schedule_temp.temp_header = false
                mainbar.enabled = true
            }
            else
            {
                schedule_temp.temp_swipe = true
                schedule_temp.temp_header = true
                mainbar.enabled = false
            }
        }
    }
}
