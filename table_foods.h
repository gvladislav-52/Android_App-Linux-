#ifndef TABLE_FOODS_H
#define TABLE_FOODS_H

#include <QObject>
#include <QMap>

class table_foods: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> Naming_food READ getNaming_food WRITE setNaming_food NOTIFY Naming_foodChanged FINAL)
    Q_PROPERTY(QVector<double> Data_food READ getData_food WRITE setData_food NOTIFY Data_foodChanged FINAL)

    Q_PROPERTY(QVector<QString> Afternoon READ getAfternoon WRITE setAfternoon NOTIFY AfternoonChanged FINAL)
    Q_PROPERTY(QVector<QString> Breakfast READ getBreakfast WRITE setBreakfast NOTIFY BreakfastChanged FINAL)
    Q_PROPERTY(QVector<QString> Dinner READ getDinner WRITE setDinner NOTIFY DinnerChanged FINAL)
    Q_PROPERTY(QVector<QString> Lunch READ getLunch WRITE setLunch NOTIFY LunchChanged FINAL)
    Q_PROPERTY(QVector<QString> Second_breakfast READ getSecond_breakfast WRITE setSecond_breakfast NOTIFY Second_breakfastChanged FINAL)
    Q_PROPERTY(QVector<QString> Second_dinner READ getSecond_dinner WRITE setSecond_dinner NOTIFY Second_dinnerChanged FINAL)
public:
    table_foods();

    QVector<QString> getNaming_food() const;
    void setNaming_food(const QVector<QString> &newNaming_food);


    QVector<double> getData_food() const;
    void setData_food(const QVector<double> &newData_food);

    QVector<QString> getAfternoon() const;
    void setAfternoon(const QVector<QString> &newAfternoon);

    QVector<QString> getBreakfast() const;
    void setBreakfast(const QVector<QString> &newBreakfast);

    QVector<QString> getDinner() const;
    void setDinner(const QVector<QString> &newDinner);

    QVector<QString> getLunch() const;
    void setLunch(const QVector<QString> &newLunch);

    QVector<QString> getSecond_breakfast() const;
    void setSecond_breakfast(const QVector<QString> &newSecond_breakfast);

    QVector<QString> getSecond_dinner() const;
    void setSecond_dinner(const QVector<QString> &newSecond_dinner);

signals:

    void Naming_foodChanged();

    void Data_foodChanged();

    void AfternoonChanged();

    void BreakfastChanged();

    void DinnerChanged();

    void LunchChanged();

    void Second_breakfastChanged();

    void Second_dinnerChanged();

public slots:
    void set_food_string(QString set);
    void set_food_data_double(double set);
    void set_data_food(QMap<QString, QMap<QString, double>> temp);
    void set_afternoon(QString set);
    void set_breakfast(QString set);
    void set_dinner(QString set);
    void set_lunch(QString set);
    void set_sec_breakfast(QString set);
    void set_sec_dinner(QString set);

    void set_data_schedule(QVector<QString> afternoon,QVector<QString> breakfast,QVector<QString> dinner,QVector<QString> lunch,QVector<QString> sec_breakfast, QVector<QString> sec_dinner);
private:
    QMap<QString, QMap<QString, double>> m_full_data;
    QVector<QString> m_Naming_food;
    QVector<double> m_Data_food;
    QVector<QString> m_Afternoon;
    QVector<QString> m_Breakfast;
    QVector<QString> m_Dinner;
    QVector<QString> m_Lunch;
    QVector<QString> m_Second_breakfast;
    QVector<QString> m_Second_dinner;
};

#endif // TABLE_FOODS_H
