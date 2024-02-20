#include "header_widget.h"

Header_widget::Header_widget(QObject *parent) : QObject(parent)
{
    m_page_temp = true;
}

bool Header_widget::getPage_temp() const
{
    return m_page_temp;
}

void Header_widget::setPage_temp(bool newPage_temp)
{
    if (m_page_temp == newPage_temp)
        return;
    m_page_temp = newPage_temp;
    emit page_tempChanged();
}
