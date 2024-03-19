#include "setting_widget.h"

setting_widget::setting_widget(QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , m_startAngle(130)
    , m_alignAngle(360)
    , m_lowestRange(0)
    , m_highestRange(4000)
{
}

void setting_widget::setPen(QColor color,QPainter *painter,QPen pen,QRectF rect,double startAngle,double spanAngle)
{
    painter->save();
    pen.setWidth(m_arcWidth);
    pen.setColor(color);
    painter->setPen(pen);
    painter->drawArc(rect.adjusted(m_arcWidth,m_arcWidth,-m_arcWidth,-m_arcWidth),startAngle*16,spanAngle*16);
    painter->restore();
}


void setting_widget::paint(QPainter *painter)
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

qreal setting_widget::getStartAngle() const
{
    return m_startAngle;
}

void setting_widget::setStartAngle(qreal newStartAngle)
{
    if (qFuzzyCompare(m_startAngle, newStartAngle))
        return;
    m_startAngle = newStartAngle;
    emit startAngleChanged();
}

qreal setting_widget::getAlignAngle() const
{
    return m_alignAngle;
}

void setting_widget::setAlignAngle(qreal newAlignAngle)
{
    if (qFuzzyCompare(m_alignAngle, newAlignAngle))
        return;
    m_alignAngle = newAlignAngle;
    emit alignAngleChanged();
}

qreal setting_widget::getLowestRange() const
{
    return m_lowestRange;
}

void setting_widget::setLowestRange(qreal newLowestRange)
{
    if (qFuzzyCompare(m_lowestRange, newLowestRange))
        return;
    m_lowestRange = newLowestRange;
    emit lowestRangeChanged();
}

qreal setting_widget::getHighestRange() const
{
    return m_highestRange;
}

void setting_widget::setHighestRange(qreal newHighestRange)
{
    if (qFuzzyCompare(m_highestRange, newHighestRange))
        return;
    m_highestRange = newHighestRange;
    emit highestRangeChanged();
}

qreal setting_widget::getSpeed() const
{
    return m_speed;
}

void setting_widget::setSpeed(qreal newSpeed)
{
    if (qFuzzyCompare(m_speed, newSpeed))
        return;
    m_speed = newSpeed;
    update();
    emit speedChanged();
}

int setting_widget::getArcWidth() const
{
    return m_arcWidth;
}

void setting_widget::setArcWidth(int newArcWidth)
{
    if (m_arcWidth == newArcWidth)
        return;
    m_arcWidth = newArcWidth;
    emit arcWidthChanged();
}

QColor setting_widget::getOuterColor() const
{
    return m_outerColor;
}

void setting_widget::setOuterColor(const QColor &newOuterColor)
{
    if (m_outerColor == newOuterColor)
        return;
    m_outerColor = newOuterColor;
    emit outerColorChanged();
}

QColor setting_widget::getInnerColor() const
{
    return m_innerColor;
}

void setting_widget::setInnerColor(const QColor &newInnerColor)
{
    if (m_innerColor == newInnerColor)
        return;
    m_innerColor = newInnerColor;
    emit innerColorChanged();
}

