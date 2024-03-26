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

void table_foods::set_afternoon(QString set)
{
    m_Afternoon.append(set);
    emit AfternoonChanged();
}

void table_foods::set_breakfast(QString set)
{
    m_Breakfast.append(set);
    emit BreakfastChanged();
}

void table_foods::set_dinner(QString set)
{
    m_Dinner.append(set);
    emit DinnerChanged();
}

void table_foods::set_lunch(QString set)
{
    m_Lunch.append(set);
    emit LunchChanged();
}

void table_foods::set_sec_breakfast(QString set)
{
    m_Second_breakfast.append(set);
    emit Second_breakfastChanged();
}

void table_foods::set_sec_dinner(QString set)
{
    m_Second_dinner.append(set);
    emit Second_dinnerChanged();
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

QVector<QString> table_foods::getAfternoon() const
{
    return m_Afternoon;
}

void table_foods::setAfternoon(const QVector<QString> &newAfternoon)
{
    if (m_Afternoon == newAfternoon)
        return;
    m_Afternoon = newAfternoon;
    emit AfternoonChanged();
}

QVector<QString> table_foods::getBreakfast() const
{
    return m_Breakfast;
}

void table_foods::setBreakfast(const QVector<QString> &newBreakfast)
{
    if (m_Breakfast == newBreakfast)
        return;
    m_Breakfast = newBreakfast;
    emit BreakfastChanged();
}

QVector<QString> table_foods::getDinner() const
{
    return m_Dinner;
}

void table_foods::setDinner(const QVector<QString> &newDinner)
{
    if (m_Dinner == newDinner)
        return;
    m_Dinner = newDinner;
    emit DinnerChanged();
}

QVector<QString> table_foods::getLunch() const
{
    return m_Lunch;
}

void table_foods::setLunch(const QVector<QString> &newLunch)
{
    if (m_Lunch == newLunch)
        return;
    m_Lunch = newLunch;
    emit LunchChanged();
}

QVector<QString> table_foods::getSecond_breakfast() const
{
    return m_Second_breakfast;
}

void table_foods::setSecond_breakfast(const QVector<QString> &newSecond_breakfast)
{
    if (m_Second_breakfast == newSecond_breakfast)
        return;
    m_Second_breakfast = newSecond_breakfast;
    emit Second_breakfastChanged();
}

QVector<QString> table_foods::getSecond_dinner() const
{
    return m_Second_dinner;
}

void table_foods::setSecond_dinner(const QVector<QString> &newSecond_dinner)
{
    if (m_Second_dinner == newSecond_dinner)
        return;
    m_Second_dinner = newSecond_dinner;
    emit Second_dinnerChanged();
}
