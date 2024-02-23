#include "nutrition_widget.h"

Nutrition_widget::Nutrition_widget()
{
    for(int i = 0; i <7; i++)
        m_meal_schedule_string.append("-");
    m_meal_schedule_string[0] = "ЗАВТРАК";
    m_meal_schedule_string[1] = "ВТОРОЙ ЗАВТРАК";
    m_meal_schedule_string[2] = "ОБЕД";
    m_meal_schedule_string[3] = "ПОЛДНИК";
    m_meal_schedule_string[4] = "УЖИН";
    m_meal_schedule_string[5] = "ВТОРОЙ УЖИН";
    m_meal_schedule_string[6] = "АКТИВНОСТЬ";
}

QVector<QString> Nutrition_widget::getMeal_schedule_string() const
{
    return m_meal_schedule_string;
}

void Nutrition_widget::setMeal_schedule_string(const QVector<QString> &newMeal_schedule_string)
{
    if (m_meal_schedule_string == newMeal_schedule_string)
        return;
    m_meal_schedule_string = newMeal_schedule_string;
    emit meal_schedule_stringChanged();
}

void Nutrition_widget::add_schedule_string()
{
    m_meal_schedule_string.append("ok");
}
