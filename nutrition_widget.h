#ifndef NUTRITION_WIDGET_H
#define NUTRITION_WIDGET_H

#include <QObject>

class Nutrition_widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> meal_schedule_string READ getMeal_schedule_string WRITE setMeal_schedule_string NOTIFY meal_schedule_stringChanged FINAL)
    Q_PROPERTY(QVector<QString> note_string READ getNote_string WRITE setNote_string NOTIFY note_stringChanged FINAL)
    Q_PROPERTY(QVector<QString> food_schedule_string READ getFood_schedule_string WRITE setFood_schedule_string NOTIFY food_schedule_stringChanged FINAL)
public:
    Nutrition_widget();
    QVector<QString> getMeal_schedule_string() const;
    void setMeal_schedule_string(const QVector<QString> &newMeal_schedule_string);
    QVector<QString> getNote_string() const;
    void setNote_string(const QVector<QString> &newNote_string);

    QVector<QString> getFood_schedule_string() const;
    void setFood_schedule_string(const QVector<QString> &newFood_schedule_string);

signals:
    void meal_schedule_stringChanged();
    void note_stringChanged();

    void food_schedule_stringChanged();

private:
    QVector<QString> m_meal_schedule_string;
    QVector<QString> m_note_string;

    QVector<QString> m_food_schedule_string;

public slots:
    void add_note_string();
    void remove_food_schedule(int index);
    void add_food_string();
};

#endif // NUTRITION_WIDGET_H
