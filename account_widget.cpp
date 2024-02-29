#include "account_widget.h"

Account_widget::Account_widget()
{
    m_account_name_button.append("Твоя цель");
    m_account_name_button.append("Собственные питательные вещества");
    m_account_name_button.append("Регулярная деятельность");
    m_account_name_button.append("Данные для наблюдения");
    m_account_name_button.append("Мои блюда");
    m_account_name_button.append("Настройка рациона");
    m_account_name_button.append("Изменить пароль");
    m_account_name_button.append("Уведомления");
    m_account_name_button.append("Присоединенные прмиложения");
    m_account_name_button.append("Удалить аккаунт");
}

QVector<QString> Account_widget::getAccount_name_button() const
{
    return m_account_name_button;
}

void Account_widget::setAccount_name_button(const QVector<QString> &newAccount_name_button)
{
    if (m_account_name_button == newAccount_name_button)
        return;
    m_account_name_button = newAccount_name_button;
    emit account_name_buttonChanged();
}
