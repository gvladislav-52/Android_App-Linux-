#include "my_food.h"

My_food::My_food()
{
    m_my_food_static.append("Макароны");
}

void My_food::add_my_food(QString name_food)
{
    m_my_food_static.append(name_food);
}

void My_food::redact_my_food(int index, QString name)
{
    m_my_food_static[index] = name;
    emit my_food_staticChanged();
}

QVector<QString> My_food::getMy_food_static() const
{
    return m_my_food_static;
}

void My_food::setMy_food_static(const QVector<QString> &newMy_food_static)
{
    if (m_my_food_static == newMy_food_static)
        return;
    m_my_food_static = newMy_food_static;
    emit my_food_staticChanged();
}
