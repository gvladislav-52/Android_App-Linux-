#include "schedule_widget.h"

Schedule_widget::Schedule_widget(QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , m_startAngle(130)
    , m_alignAngle(360)
    , m_lowestRange(0)
    , m_highestRange(4000)
{}

void Schedule_widget::setPen(QColor color,QPainter *painter,QPen pen,QRectF rect,double startAngle,double spanAngle)
{
    painter->save();
    pen.setWidth(m_arcWidth);
    pen.setColor(color);
    painter->setPen(pen);
    painter->drawArc(rect.adjusted(m_arcWidth,m_arcWidth,-m_arcWidth,-m_arcWidth),startAngle*16,spanAngle*16);
    painter->restore();
}


void Schedule_widget::paint(QPainter *painter)
{
    QRectF rect = this->boundingRect();
    painter->setRenderHint(QPainter::Antialiasing);
    QPen pen = painter->pen();
    pen.setCapStyle(Qt::FlatCap);

    double startAngle;
    double spanAngle;

    startAngle = m_startAngle - 40;
    spanAngle = 0 - m_alignAngle;

    setPen(m_innerColor,painter,pen,rect,startAngle,spanAngle);
    qreal valueToAngle = ((m_speed - m_lowestRange) / (m_highestRange - m_lowestRange)) * spanAngle;
    setPen(m_outerColor,painter,pen,rect,startAngle,valueToAngle);
}

qreal Schedule_widget::getStartAngle() const
{
    return m_startAngle;
}

void Schedule_widget::setStartAngle(qreal newStartAngle)
{
    if (qFuzzyCompare(m_startAngle, newStartAngle))
        return;
    m_startAngle = newStartAngle;
    emit startAngleChanged();
}

qreal Schedule_widget::getAlignAngle() const
{
    return m_alignAngle;
}

void Schedule_widget::setAlignAngle(qreal newAlignAngle)
{
    if (qFuzzyCompare(m_alignAngle, newAlignAngle))
        return;
    m_alignAngle = newAlignAngle;
    emit alignAngleChanged();
}

qreal Schedule_widget::getLowestRange() const
{
    return m_lowestRange;
}

void Schedule_widget::setLowestRange(qreal newLowestRange)
{
    if (qFuzzyCompare(m_lowestRange, newLowestRange))
        return;
    m_lowestRange = newLowestRange;
    emit lowestRangeChanged();
}

qreal Schedule_widget::getHighestRange() const
{
    return m_highestRange;
}

void Schedule_widget::setHighestRange(qreal newHighestRange)
{
    if (qFuzzyCompare(m_highestRange, newHighestRange))
        return;
    m_highestRange = newHighestRange;
    emit highestRangeChanged();
}

qreal Schedule_widget::getSpeed() const
{
    return m_speed;
}

void Schedule_widget::setSpeed(qreal newSpeed)
{
    if (qFuzzyCompare(m_speed, newSpeed))
        return;
    m_speed = newSpeed;
    emit speedChanged();
}

int Schedule_widget::getArcWidth() const
{
    return m_arcWidth;
}

void Schedule_widget::setArcWidth(int newArcWidth)
{
    if (m_arcWidth == newArcWidth)
        return;
    m_arcWidth = newArcWidth;
    emit arcWidthChanged();
}

QColor Schedule_widget::getOuterColor() const
{
    return m_outerColor;
}

void Schedule_widget::setOuterColor(const QColor &newOuterColor)
{
    if (m_outerColor == newOuterColor)
        return;
    m_outerColor = newOuterColor;
    emit outerColorChanged();
}

QColor Schedule_widget::getInnerColor() const
{
    return m_innerColor;
}

void Schedule_widget::setInnerColor(const QColor &newInnerColor)
{
    if (m_innerColor == newInnerColor)
        return;
    m_innerColor = newInnerColor;
    emit innerColorChanged();
}

Nutrition_widget::Nutrition_widget()
{
    m_meal_schedule_string.append("ЗАВТРАК");
    m_meal_schedule_string.append("ВТОРОЙ ЗАВТРАК");
    m_meal_schedule_string.append("ОБЕД");
    m_meal_schedule_string.append("ПОЛДНИК");
    m_meal_schedule_string.append("УЖИН");
    m_meal_schedule_string.append("ВТОРОЙ УЖИН");
    m_meal_schedule_string.append("АКТИВНОСТЬ");
}

QVector<QString> Nutrition_widget::getMeal_schedule_string() const
{
    return m_meal_schedule_string;
}

void Nutrition_widget::setMeal_schedule_string(const QVector<QString> &newMeal_schedule_string)
{
    if (m_meal_schedule_string == newMeal_schedule_string)
        return;
    m_meal_schedule_string = newMeal_schedule_string;
    emit meal_schedule_stringChanged();
}

void Nutrition_widget::add_food_string()
{
    m_food_schedule_string.append("food" + QString::number(m_food_schedule_string.size()));
}

void Nutrition_widget::add_note_string()
{
    m_note_string.append("good" + QString::number(m_note_string.size()));
}

void Nutrition_widget::remove_food_schedule(int index)
{
    if (index >= 0 && index < m_food_schedule_string.size())
    {
        m_food_schedule_string.remove(index);
    }
}

QVector<QString> Nutrition_widget::getNote_string() const
{
    return m_note_string;
}

void Nutrition_widget::setNote_string(const QVector<QString> &newNote_string)
{
    if (m_note_string == newNote_string)
        return;
    m_note_string = newNote_string;
    emit note_stringChanged();
}

QVector<QString> Nutrition_widget::getFood_schedule_string() const
{
    return m_food_schedule_string;
}

void Nutrition_widget::setFood_schedule_string(const QVector<QString> &newFood_schedule_string)
{
    if (m_food_schedule_string == newFood_schedule_string)
        return;
    m_food_schedule_string = newFood_schedule_string;
    emit food_schedule_stringChanged();
}
