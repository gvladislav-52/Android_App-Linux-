#ifndef ACCOUNT_WIDGET_H
#define ACCOUNT_WIDGET_H

#include <QObject>

class Account_widget:public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> account_name_button READ getAccount_name_button WRITE setAccount_name_button NOTIFY account_name_buttonChanged FINAL)
public:
    Account_widget();
    QVector<QString> getAccount_name_button() const;
    void setAccount_name_button(const QVector<QString> &newAccount_name_button);
signals:
    void account_name_buttonChanged();
private:
    QVector<QString> m_account_name_button;
};

#endif // ACCOUNT_WIDGET_H
