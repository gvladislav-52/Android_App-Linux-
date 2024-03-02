#ifndef ACCOUNT_WIDGET_H
#define ACCOUNT_WIDGET_H

#include <QObject>

class Account_widget:public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> account_name_button READ getAccount_name_button WRITE setAccount_name_button NOTIFY account_name_buttonChanged FINAL)
    Q_PROPERTY(QVector<QString> purpose_name_static READ getPurpose_name_static WRITE setPurpose_name_static NOTIFY purpose_name_staticChanged FINAL)
    Q_PROPERTY(QVector<QString> purpose_index_dynamic READ getPurpose_index_dynamic WRITE setPurpose_index_dynamic NOTIFY purpose_index_dynamicChanged FINAL)
    Q_PROPERTY(QVector<QString> account_characters READ getAccount_characters WRITE setAccount_characters NOTIFY account_charactersChanged FINAL)
public:
    Account_widget();
    QVector<QString> getAccount_name_button() const;
    void setAccount_name_button(const QVector<QString> &newAccount_name_button);
    QVector<QString> getPurpose_name_static() const;
    void setPurpose_name_static(const QVector<QString> &newPurpose_name_static);

    QVector<QString> getPurpose_index_dynamic() const;
    void setPurpose_index_dynamic(const QVector<QString> &newPurpose_index_dynamic);

    QVector<QString> getAccount_characters() const;
    void setAccount_characters(const QVector<QString> &newAccount_characters);

signals:
    void account_name_buttonChanged();
    void purpose_name_staticChanged();

    void purpose_index_dynamicChanged();

    void account_charactersChanged();

private:
    QVector<QString> m_account_name_button;
    QVector<QString> m_purpose_name_static;
    QVector<QString> m_purpose_index_dynamic;
    QVector<QString> m_account_characters;
};

#endif // ACCOUNT_WIDGET_H
