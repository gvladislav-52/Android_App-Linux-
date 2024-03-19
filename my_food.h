#ifndef MY_FOOD_H
#define MY_FOOD_H

#include <QObject>
#include <QDate>

class My_food: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> my_food_static READ getMy_food_static WRITE setMy_food_static NOTIFY my_food_staticChanged FINAL)

public:
    My_food();
    QVector<QString> getMy_food_static() const;
    void setMy_food_static(const QVector<QString> &newMy_food_static);

signals:
    void my_food_staticChanged();

private:
    QVector<QString> m_my_food_static;
public slots:
    void add_my_food(QString name_food);
    void redact_my_food(int index, QString name);
};

#endif // MY_FOOD_H
