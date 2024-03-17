#ifndef DATA_FOR_OBSERVATION_H
#define DATA_FOR_OBSERVATION_H

#include <QObject>
#include <QDate>

class Data_for_observation: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<int> vector_weight READ getVector_weight WRITE setVector_weight NOTIFY vector_weightChanged FINAL)
    Q_PROPERTY(QVector<int> vector_height READ getVector_height WRITE setVector_height NOTIFY vector_heightChanged FINAL)

    Q_PROPERTY(QVector<QString> data_weight READ getData_weight WRITE setData_weight NOTIFY data_weightChanged FINAL)
    Q_PROPERTY(QVector<QString> data_height READ getData_height WRITE setData_height NOTIFY data_heightChanged FINAL)
public:
    Data_for_observation();
    QVector<int> getVector_weight() const;
    void setVector_weight(const QVector<int> &newVector_weight);
    QVector<int> getVector_height() const;
    void setVector_height(const QVector<int> &newVector_height);

    QVector<QString> getData_weight() const;
    void setData_weight(const QVector<QString> &newData_weight);

    QVector<QString> getData_height() const;
    void setData_height(const QVector<QString> &newData_height);

signals:
    void vector_weightChanged();
    void vector_heightChanged();

    void data_weightChanged();
    void data_heightChanged();

public slots:
    void add_weight(int weight);
    // void add_height(int height);

    void add_data_weight(QString weight = "");
    //void add_data_height();

    void remove_weight(int index);
    void remove_height(int index);

    void remove_data_weight(int index);
    void remove_data_height(int index);

private:
    QVector<int> m_vector_weight;
    QVector<int> m_vector_height;
    QVector<QString> m_data_weight;
    QVector<QString> m_data_height;
};

#endif // DATA_FOR_OBSERVATION_H
