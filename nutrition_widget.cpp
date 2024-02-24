#include "nutrition_widget.h"
#include "qdebug.h"

Nutrition_widget::Nutrition_widget()
{
    m_meal_schedule_string.append("ЗАВТРАК");
    m_meal_schedule_string.append("ВТОРОЙ ЗАВТРАК");
    m_meal_schedule_string.append("ОБЕД");
    m_meal_schedule_string.append("ПОЛДНИК");
    m_meal_schedule_string.append("УЖИН");
    m_meal_schedule_string.append("ВТОРОЙ УЖИН");
    m_meal_schedule_string.append("АКТИВНОСТЬ");

    m_food_schedule_string.append("ЗАВТРАК1");
    m_food_schedule_string.append("ВТОРОЙ ЗАВТРАК1");
    m_food_schedule_string.append("ОБЕД1");
    m_food_schedule_string.append("ПОЛДНИК1");
    m_food_schedule_string.append("УЖИН1");
    m_food_schedule_string.append("ВТОРОЙ УЖИН1");
    m_meal_schedule_string.append("АКТИВНОСТЬ1");
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

void Nutrition_widget::add_note_string()
{
    m_note_string.append("good");
}

void Nutrition_widget::remove_food_schedule(int index)
{
    if (index >= 0 && index < m_food_schedule_string.size())
    {
        m_food_schedule_string.remove(index);
    }
    for(int i = 0; i < m_food_schedule_string.size(); i++)
        qDebug() << m_food_schedule_string;
}

QVector<QString> Nutrition_widget::getNote_string() const
{
    return m_note_string;
}

void Nutrition_widget::setNote_string(const QVector<QString> &newNote_string)
{
    if (m_note_string == newNote_string)
        return;
    m_note_string = newNote_string;
    emit note_stringChanged();
}

QVector<QString> Nutrition_widget::getFood_schedule_string() const
{
    return m_food_schedule_string;
}

void Nutrition_widget::setFood_schedule_string(const QVector<QString> &newFood_schedule_string)
{
    if (m_food_schedule_string == newFood_schedule_string)
        return;
    m_food_schedule_string = newFood_schedule_string;
    emit food_schedule_stringChanged();
}
