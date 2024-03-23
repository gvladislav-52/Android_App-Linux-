#ifndef TABLE_FOODS_H
#define TABLE_FOODS_H

#include <QObject>
#include <QMap>

class table_foods: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> Naming_food READ getNaming_food WRITE setNaming_food NOTIFY Naming_foodChanged FINAL)
    Q_PROPERTY(QVector<double> Data_food READ getData_food WRITE setData_food NOTIFY Data_foodChanged FINAL)
public:
    table_foods();

    QVector<QString> getNaming_food() const;
    void setNaming_food(const QVector<QString> &newNaming_food);


    QVector<double> getData_food() const;
    void setData_food(const QVector<double> &newData_food);

signals:

    void Naming_foodChanged();

    void Data_foodChanged();

public slots:
    void set_food_string(QString set);
    void set_food_data_double(double set);
    void set_data_food(QMap<QString, QMap<QString, double>> temp);
private:
    QMap<QString, QMap<QString, double>> m_full_data;
    QVector<QString> m_Naming_food;
    QVector<double> m_Data_food;
};

#endif // TABLE_FOODS_H
