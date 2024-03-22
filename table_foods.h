#ifndef TABLE_FOODS_H
#define TABLE_FOODS_H

#include <QObject>
#include <QMap>

class table_foods: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString Naming_food READ getNaming_food WRITE setNaming_food NOTIFY Naming_foodChanged FINAL)
    Q_PROPERTY(double Data_food READ getData_food WRITE setData_food NOTIFY Data_foodChanged FINAL)
public:
    table_foods();
    QString getNaming_food() const;
    void setNaming_food(const QString &newNaming_food);
    double getData_food() const;
    void setData_food(double newData_food);

signals:
    void Naming_foodChanged();
    void Data_foodChanged();
public slots:
    void set_data_food(QMap<QString, QMap<QString, double>> temp);


private:
    QString m_Naming_food;
    double m_Data_food;
    QMap<QString, QMap<QString, double>> m_full_data;
};

#endif // TABLE_FOODS_H
