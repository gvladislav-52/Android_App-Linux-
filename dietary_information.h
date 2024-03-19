#ifndef DIETARY_INFORMATION_H
#define DIETARY_INFORMATION_H

#include <QObject>

class Dietary_information: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> note_string READ getNote_string WRITE setNote_string NOTIFY note_stringChanged FINAL)
    Q_PROPERTY(QVector<QString> food_schedule_string READ getFood_schedule_string WRITE setFood_schedule_string NOTIFY food_schedule_stringChanged FINAL)
    Q_PROPERTY(int Calories_time_domain READ getCalories_time_domain WRITE setCalories_time_domain NOTIFY Calories_time_domainChanged FINAL)
public:
    Dietary_information();
    QVector<QString> getNote_string() const;
    void setNote_string(const QVector<QString> &newNote_string);

    QVector<QString> getFood_schedule_string() const;
    void setFood_schedule_string(const QVector<QString> &newFood_schedule_string);

    int getCalories_time_domain() const;
    void setCalories_time_domain(int newCalories_time_domain);

signals:
    void note_stringChanged();

    void food_schedule_stringChanged();

    void Calories_time_domainChanged();

private:
    QVector<QString> m_note_string;
    QVector<QString> m_food_schedule_string;

    int m_Calories_time_domain;

public slots:
    void add_note_string();
    void remove_food_schedule(int index);
    void add_food_string();
};

#endif // DIETARY_INFORMATION_H
