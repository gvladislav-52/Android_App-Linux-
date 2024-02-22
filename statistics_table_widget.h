#ifndef STATISTICS_TABLE_WIDGET_H
#define STATISTICS_TABLE_WIDGET_H

#include <QObject>
#include <QQuickPaintedItem>

class statistics_table_widget : public QQuickPaintedItem
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
    statistics_table_widget(QQuickItem *parent = 0);
    void paint(QPainter *painter);
    void setPen(QColor color,QPainter *painter,QPen pen,QRectF rect,double startAngle,double spanAngle);

    qreal getStartAngle();
    qreal getAlignAngle();
    qreal getLowestRange();
    qreal getHighestRange();
    qreal getSpeed();
    int getArcWidth();
    QColor getOuterColor();
    QColor getInnerColor();

    void setStartAngle(qreal startAngle);
    void setAlignAngle(qreal angle);
    void setLowestRange(qreal lowestRange);
    void setHighestRange(qreal highestRange);
    void setSpeed(qreal speed);
    void setArcWidth(int arcWidth);
    void setOuterColor(QColor outerColor);
    void setInnerColor(QColor innerColor);

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
    qreal m_StartAngle;
    qreal m_AlignAngle;
    qreal m_LowestRange;
    qreal m_HighestRange;
    qreal m_Speed;
    int m_ArcWidth;
    QColor m_OuterColor;
    QColor m_InnerColor;
};

#endif // STATISTICS_TABLE_WIDGET_H
