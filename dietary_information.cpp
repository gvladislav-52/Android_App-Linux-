#include "dietary_information.h"
#include <QTimer>

Dietary_information::Dietary_information():m_Calories_time_domain(0) {
    QTimer::singleShot(5000, this, [this]() {
        setCalories_time_domain(300);
    });
}

void Dietary_information::add_food_string()
{
    m_food_schedule_string.append("food" + QString::number(m_food_schedule_string.size()));
}

void Dietary_information::add_note_string()
{
    m_note_string.append("good" + QString::number(m_note_string.size()));
}

void Dietary_information::remove_food_schedule(int index)
{
    if (index >= 0 && index < m_food_schedule_string.size())
    {
        m_food_schedule_string.remove(index);
    }
}

QVector<QString> Dietary_information::getNote_string() const
{
    return m_note_string;
}

void Dietary_information::setNote_string(const QVector<QString> &newNote_string)
{
    if (m_note_string == newNote_string)
        return;
    m_note_string = newNote_string;
    emit note_stringChanged();
}

QVector<QString> Dietary_information::getFood_schedule_string() const
{
    return m_food_schedule_string;
}

void Dietary_information::setFood_schedule_string(const QVector<QString> &newFood_schedule_string)
{
    if (m_food_schedule_string == newFood_schedule_string)
        return;
    m_food_schedule_string = newFood_schedule_string;
    emit food_schedule_stringChanged();
}

int Dietary_information::getCalories_time_domain() const
{
    return m_Calories_time_domain;
}

void Dietary_information::setCalories_time_domain(int newCalories_time_domain)
{
    if (m_Calories_time_domain == newCalories_time_domain)
        return;
    m_Calories_time_domain = newCalories_time_domain;
    emit Calories_time_domainChanged();
}
