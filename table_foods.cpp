#include "table_foods.h"
#include "qdebug.h"

table_foods::table_foods() {}

void table_foods::set_data_food(QMap<QString, QMap<QString, double>> temp)
{
    //m_full_data = temp;

    for (auto it = temp.begin(); it != temp.end(); ++it) {
        set_food_string(it.key());                    //запись имени еды в string

        QMap<QString, double> inner_map = it.value();
        for(auto inner_it = inner_map.begin(); inner_it != inner_map.end(); ++inner_it){
            set_food_data_double(inner_it.value());        //запись данные еды double
        }
    }

    qDebug() << "Keys Vector: " << m_Naming_food;
    qDebug() << "Values Vector: " << m_Data_food;
}

QVector<QString> table_foods::getNaming_food() const
{
    return m_Naming_food;
}

void table_foods::setNaming_food(const QVector<QString> &newNaming_food)
{
    if (m_Naming_food == newNaming_food)
        return;
    m_Naming_food = newNaming_food;
    emit Naming_foodChanged();
}


QVector<double> table_foods::getData_food() const
{
    return m_Data_food;
}

void table_foods::setData_food(const QVector<double> &newData_food)
{
    if (m_Data_food == newData_food)
        return;
    m_Data_food = newData_food;
    emit Data_foodChanged();
}

void table_foods::set_food_string(QString set)
{
    m_Naming_food.append(set);
    emit Naming_foodChanged();
}

void table_foods::set_food_data_double(double set)
{
    m_Data_food.append(set);
    emit Data_foodChanged();
}
