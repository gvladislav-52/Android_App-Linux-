#ifndef SCHEDULE_WIDGET_H
#define SCHEDULE_WIDGET_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QPainter>

class Schedule_widget: public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(qreal startAngle READ getStartAngle WRITE setStartAngle NOTIFY startAngleChanged FINAL)
    Q_PROPERTY(qreal alignAngle READ getAlignAngle WRITE setAlignAngle NOTIFY alignAngleChanged FINAL)
    Q_PROPERTY(
        qreal lowestRange READ getLowestRange WRITE setLowestRange NOTIFY lowestRangeChanged FINAL)
    Q_PROPERTY(qreal highestRange READ getHighestRange WRITE setHighestRange NOTIFY
                   highestRangeChanged FINAL)
    Q_PROPERTY(qreal speed READ getSpeed WRITE setSpeed NOTIFY speedChanged FINAL)
    Q_PROPERTY(int arcWidth READ getArcWidth WRITE setArcWidth NOTIFY arcWidthChanged FINAL)
    Q_PROPERTY(
        QColor outerColor READ getOuterColor WRITE setOuterColor NOTIFY outerColorChanged FINAL)
    Q_PROPERTY(
        QColor innerColor READ getInnerColor WRITE setInnerColor NOTIFY innerColorChanged FINAL)
public:
    Schedule_widget(QQuickItem *parent = 0);
    void paint(QPainter *painter);
    void setPen(QColor color,QPainter *painter,QPen pen,QRectF rect,double startAngle,double spanAngle);

    qreal getStartAngle() const;
    void setStartAngle(qreal newStartAngle);
    qreal getAlignAngle() const;
    void setAlignAngle(qreal newAlignAngle);

    qreal getLowestRange() const;
    void setLowestRange(qreal newLowestRange);

    qreal getHighestRange() const;
    void setHighestRange(qreal newHighestRange);

    qreal getSpeed() const;
    void setSpeed(qreal newSpeed);

    int getArcWidth() const;
    void setArcWidth(int newArcWidth);

    QColor getOuterColor() const;
    void setOuterColor(const QColor &newOuterColor);

    QColor getInnerColor() const;
    void setInnerColor(const QColor &newInnerColor);

signals:
    void startAngleChanged();
    void alignAngleChanged();

    void lowestRangeChanged();

    void highestRangeChanged();

    void speedChanged();

    void arcWidthChanged();

    void outerColorChanged();

    void innerColorChanged();

private:
    qreal m_startAngle;
    qreal m_alignAngle;
    qreal m_lowestRange;
    qreal m_highestRange;
    qreal m_speed;
    int m_arcWidth;
    QColor m_outerColor;
    QColor m_innerColor;
};

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

#endif // SCHEDULE_WIDGET_H
