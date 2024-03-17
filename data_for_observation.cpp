#include "data_for_observation.h"
#include "qdebug.h"

Data_for_observation::Data_for_observation()
{
    m_vector_height.append(1);
    m_vector_height.append(2);
    m_vector_height.append(3);

    m_data_height.append("18.03.24");
    m_data_height.append("19.03.24");
    m_data_height.append("20.03.24");
}

QVector<int> Data_for_observation::getVector_weight() const
{
    return m_vector_weight;
}

void Data_for_observation::setVector_weight(const QVector<int> &newVector_weight)
{
    if (m_vector_weight == newVector_weight)
        return;
    m_vector_weight = newVector_weight;
    emit vector_weightChanged();
}

QVector<int> Data_for_observation::getVector_height() const
{
    return m_vector_height;
}

void Data_for_observation::setVector_height(const QVector<int> &newVector_height)
{
    if (m_vector_height == newVector_height)
        return;
    m_vector_height = newVector_height;
    emit vector_heightChanged();
}

QVector<QString> Data_for_observation::getData_weight() const
{
    return m_data_weight;
}

void Data_for_observation::setData_weight(const QVector<QString> &newData_weight)
{
    if (m_data_weight == newData_weight)
        return;
    m_data_weight = newData_weight;
    emit data_weightChanged();
}

QVector<QString> Data_for_observation::getData_height() const
{
    return m_data_height;
}

void Data_for_observation::setData_height(const QVector<QString> &newData_height)
{
    if (m_data_height == newData_height)
        return;
    m_data_height = newData_height;
    emit data_heightChanged();
}

void Data_for_observation::add_weight(int weight)
{
    m_vector_weight.append(weight);
    emit vector_weightChanged();
}

void Data_for_observation::add_data_weight(QString weight)
{
    if(weight == "")
    {
        QDate currentDate = QDate::currentDate();
        m_data_weight.append(currentDate.toString("dd-MM-yyyy"));
        emit data_weightChanged();
    }
    else
        m_data_weight.append(weight);
        emit data_weightChanged();
}

void Data_for_observation::remove_weight(int index)
{
    if (index >= 0 && index < m_vector_weight.size())
    {
        m_vector_weight.remove(index);
    }
    emit vector_weightChanged();
}

void Data_for_observation::remove_height(int index)
{
    if (index >= 0 && index < m_vector_height.size())
    {
        m_vector_height.remove(index);
    }
    emit vector_heightChanged();
}

void Data_for_observation::remove_data_weight(int index)
{
    if (index >= 0 && index < m_data_weight.size())
    {
        m_data_weight.remove(index);
    }
    emit data_weightChanged();
}

void Data_for_observation::remove_data_height(int index)
{
    if (index >= 0 && index < m_data_height.size())
    {
        m_data_height.remove(index);
    }
    emit data_heightChanged();
}
