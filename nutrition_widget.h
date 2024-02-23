#ifndef NUTRITION_WIDGET_H
#define NUTRITION_WIDGET_H

#include <QObject>

class Nutrition_widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> meal_schedule_string READ getMeal_schedule_string WRITE setMeal_schedule_string NOTIFY meal_schedule_stringChanged FINAL)
public:
    Nutrition_widget();
    QVector<QString> getMeal_schedule_string() const;
    void setMeal_schedule_string(const QVector<QString> &newMeal_schedule_string);
signals:
    void meal_schedule_stringChanged();
private:
    QVector<QString> m_meal_schedule_string;
public slots:
        void add_schedule_string();
};

#endif // NUTRITION_WIDGET_H
