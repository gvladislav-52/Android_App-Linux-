#include "statistics_table_widget.h"
#include <QPainter>

statistics_table_widget::statistics_table_widget(QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , m_StartAngle(130)
    , m_AlignAngle(360)
    , m_LowestRange(0)
    , m_HighestRange(4000)
{}

void statistics_table_widget::setPen(QColor color,QPainter *painter,QPen pen,QRectF rect,double startAngle,double spanAngle)
{
    painter->save();
    pen.setWidth(m_ArcWidth);
    pen.setColor(color);
    painter->setPen(pen);
    painter->drawArc(rect.adjusted(m_ArcWidth,m_ArcWidth,-m_ArcWidth,-m_ArcWidth),startAngle*16,spanAngle*16);
    painter->restore();
}


void statistics_table_widget::paint(QPainter *painter)
{
    QRectF rect = this->boundingRect();
    painter->setRenderHint(QPainter::Antialiasing);
    QPen pen = painter->pen();
    pen.setCapStyle(Qt::FlatCap);

    double startAngle;
    double spanAngle;

    startAngle = m_StartAngle - 40;
    spanAngle = 0 - m_AlignAngle;

    setPen(m_InnerColor,painter,pen,rect,startAngle,spanAngle);
    qreal valueToAngle = ((m_Speed - m_LowestRange) / (m_HighestRange - m_LowestRange)) * spanAngle;
    setPen(m_OuterColor,painter,pen,rect,startAngle,valueToAngle);
}

qreal statistics_table_widget::getStartAngle()
{
    return m_StartAngle;
}

qreal statistics_table_widget::getAlignAngle()
{
    return m_AlignAngle;
}

qreal statistics_table_widget::getLowestRange()
{
    return m_LowestRange;
}

qreal statistics_table_widget::getHighestRange()
{
    return m_HighestRange;
}

qreal statistics_table_widget::getSpeed()
{
    return m_Speed;
}

int statistics_table_widget::getArcWidth()
{
    return m_ArcWidth;
}

QColor statistics_table_widget::getOuterColor()
{
    return m_OuterColor;
}

QColor statistics_table_widget::getInnerColor()
{
    return m_InnerColor;
}

void statistics_table_widget::setStartAngle(qreal startAngle)
{
    if (m_StartAngle == startAngle)
        return;

    m_StartAngle = startAngle;
    emit startAngleChanged();
}

void statistics_table_widget::setAlignAngle(qreal angle)
{
    if (m_StartAngle == angle)
        return;

    m_StartAngle = angle;
    emit alignAngleChanged();
}

void statistics_table_widget::setLowestRange(qreal lowestRange)
{
    if (m_LowestRange == lowestRange)
        return;

    m_LowestRange = lowestRange;
    emit lowestRangeChanged();
}

void statistics_table_widget::setHighestRange(qreal highestRange)
{
    if (m_HighestRange == highestRange)
        return;

    m_HighestRange = highestRange;
    emit highestRangeChanged();
}

void statistics_table_widget::setSpeed(qreal speed)
{
    if (m_Speed == speed)
        return;

    m_Speed = speed;
    update();
    emit speedChanged();
}

void statistics_table_widget::setArcWidth(int arcWidth)
{
    if (m_ArcWidth == arcWidth)
        return;

    m_ArcWidth = arcWidth;
    emit arcWidthChanged();
}

void statistics_table_widget::setOuterColor(QColor outerColor)
{
    if (m_OuterColor == outerColor)
        return;

    m_OuterColor = outerColor;
    emit outerColorChanged();
}

void statistics_table_widget::setInnerColor(QColor innerColor)
{
    if (m_InnerColor == innerColor)
        return;

    m_InnerColor = innerColor;
    emit innerColorChanged();
}
