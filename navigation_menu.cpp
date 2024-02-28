#include "navigation_menu.h"

Navigation_menu::Navigation_menu()
{
    m_name_navi_bar.append("Мой профиль");
    m_name_navi_bar.append("Рацион");
    m_name_navi_bar.append("Рецепты");
    m_name_navi_bar.append("Мои блюда");
    m_name_navi_bar.append("Справка");

    m_path_icon.append("qrc:/ui/Image NaviBar/person.png");
    m_path_icon.append("qrc:/ui/Image NaviBar/schedule.jpg");
    m_path_icon.append("qrc:/ui/Image NaviBar/book.png");
    m_path_icon.append("qrc:/ui/Image NaviBar/food.png");
    m_path_icon.append("qrc:/ui/Image NaviBar/question.png");
}

QVector<QString> Navigation_menu::getName_navi_bar() const
{
    return m_name_navi_bar;
}

void Navigation_menu::setName_navi_bar(const QVector<QString> &newName_navi_bar)
{
    if (m_name_navi_bar == newName_navi_bar)
        return;
    m_name_navi_bar = newName_navi_bar;
    emit name_navi_barChanged();
}

QVector<QString> Navigation_menu::getPath_icon() const
{
    return m_path_icon;
}

void Navigation_menu::setPath_icon(const QVector<QString> &newPath_icon)
{
    if (m_path_icon == newPath_icon)
        return;
    m_path_icon = newPath_icon;
    emit path_iconChanged();
}
