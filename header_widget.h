#ifndef HEADER_WIDGET_H
#define HEADER_WIDGET_H

#include <QObject>

class Header_widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool page_temp READ getPage_temp WRITE setPage_temp NOTIFY page_tempChanged FINAL)
public:
    explicit Header_widget(QObject *parent = nullptr);
    bool getPage_temp() const;
    void setPage_temp(bool newPage_temp);
signals:
    void page_tempChanged();
private:
    bool m_page_temp;
};

#endif // HEADER_WIDGET_H
