#include "table_foods.h"
#include "qdebug.h"

table_foods::table_foods() {}

QString table_foods::getNaming_food() const
{
    return m_Naming_food;
}

void table_foods::setNaming_food(const QString &newNaming_food)
{
    if (m_Naming_food == newNaming_food)
        return;
    m_Naming_food = newNaming_food;
    emit Naming_foodChanged();
}

double table_foods::getData_food() const
{
    return m_Data_food;
}

void table_foods::setData_food(double newData_food)
{
    if (qFuzzyCompare(m_Data_food, newData_food))
        return;
    m_Data_food = newData_food;
    emit Data_foodChanged();
}

void table_foods::set_data_food(QMap<QString, QMap<QString, double>> temp)
{
    m_full_data = temp;
    qDebug() << m_full_data;
}
