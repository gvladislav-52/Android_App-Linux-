#include "dietary_information.h"
#include "qdebug.h"
#include <QTimer>
#include <QDateTime>

Dietary_information::Dietary_information()
    :m_Calories_day_temp(0),
    m_Protein_day_temp(0),
    m_Carb_day_temp(0),
    m_Fats_day_temp(0),
    m_Fiber_day_temp(0)
{
    QTimer::singleShot(3000, this, [this]() {
        setCalories_day_temp(1000.23);
        setProtein_day_temp(100);
        setCarb_day_temp(400);
        setFats_day_temp(24);
        setFiber_day_temp(8);
    });

    QDateTime currentDateTime = QDateTime::currentDateTime();
    m_Data_temp = currentDateTime.toString("dd-MM-yyyy");
    m_Data_int = 0;
}

void Dietary_information::add_food_string()
{
    m_food_schedule_string.append("food" + QString::number(m_food_schedule_string.size()));
}

bool Dietary_information::plus_data()
{
    m_Data_int++;
    QDateTime currentDateTime = QDateTime::currentDateTime();
    currentDateTime = currentDateTime.addDays(m_Data_int);
    setData_temp(currentDateTime.toString("dd-MM-yyyy"));
    return true;
}

bool Dietary_information::del_data()
{
    m_Data_int--;
    QDateTime currentDateTime = QDateTime::currentDateTime();
    currentDateTime = currentDateTime.addDays(m_Data_int);
    setData_temp(currentDateTime.toString("dd-MM-yyyy"));
    return true;
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

double Dietary_information::getCalories_day_temp() const
{
    return m_Calories_day_temp;
}

void Dietary_information::setCalories_day_temp(double newCalories_day_temp)
{
    if (m_Calories_day_temp == newCalories_day_temp)
        return;
    m_Calories_day_temp = newCalories_day_temp;
    emit Calories_day_tempChanged();
}

double Dietary_information::getProtein_day_temp() const
{
    return m_Protein_day_temp;
}

void Dietary_information::setProtein_day_temp(double newProtein_day_temp)
{
    if (m_Protein_day_temp == newProtein_day_temp)
        return;
    m_Protein_day_temp = newProtein_day_temp;
    emit Protein_day_tempChanged();
}

double Dietary_information::getCarb_day_temp() const
{
    return m_Carb_day_temp;
}

void Dietary_information::setCarb_day_temp(double newCarb_day_temp)
{
    if (m_Carb_day_temp == newCarb_day_temp)
        return;
    m_Carb_day_temp = newCarb_day_temp;
    emit Carb_day_tempChanged();
}

double Dietary_information::getFats_day_temp() const
{
    return m_Fats_day_temp;
}

void Dietary_information::setFats_day_temp(double newFats_day_temp)
{
    if (m_Fats_day_temp == newFats_day_temp)
        return;
    m_Fats_day_temp = newFats_day_temp;
    emit Fats_day_tempChanged();
}

double Dietary_information::getFiber_day_temp() const
{
    return m_Fiber_day_temp;
}

void Dietary_information::setFiber_day_temp(double newFiber_day_temp)
{
    if (m_Fiber_day_temp == newFiber_day_temp)
        return;
    m_Fiber_day_temp = newFiber_day_temp;
    emit Fiber_day_tempChanged();
}

void Dietary_information::ConnectFunc(QString IdToken, QString IdLocal)
{
    qDebug() << IdToken << " " << IdLocal;
}

QString Dietary_information::getData_temp() const
{
    return m_Data_temp;
}

void Dietary_information::setData_temp(const QString &newData_temp)
{
    if (m_Data_temp == newData_temp)
        return;
    m_Data_temp = newData_temp;
    emit Data_tempChanged();
}
