#include "account_widget.h"

Account_widget::Account_widget()
{
    m_account_name_button.append("Твоя цель");
   // m_account_name_button.append("Собственные питательные вещества");
   // m_account_name_button.append("Регулярная деятельность");
    m_account_name_button.append("Данные для наблюдения");
    m_account_name_button.append("Мои блюда");
   // m_account_name_button.append("Настройка рациона");
    m_account_name_button.append("Изменить пароль");
   // m_account_name_button.append("Уведомления");
   // m_account_name_button.append("Присоединенные прмиложения");
    m_account_name_button.append("Удалить аккаунт");

    m_purpose_name_static.append("Цель");
    m_purpose_name_static.append("Дневной прием");
    m_purpose_name_static.append("Ожидаемый вес");
    m_purpose_name_static.append("Мой питьевой режим");
    m_purpose_name_static.append("Твой обмен веществ");

    m_purpose_index_dynamic.append("Набрать мышечную массу");
    m_purpose_index_dynamic.append("3433 ккал.");
    m_purpose_index_dynamic.append("77,0 кг");
    m_purpose_index_dynamic.append("2,88");
    m_purpose_index_dynamic.append("1809, 0 ккал");

    m_account_characters.append("Вес [кг]");
    m_account_characters.append("Рост");
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

QVector<QString> Account_widget::getPurpose_name_static() const
{
    return m_purpose_name_static;
}

void Account_widget::setPurpose_name_static(const QVector<QString> &newPurpose_name_static)
{
    if (m_purpose_name_static == newPurpose_name_static)
        return;
    m_purpose_name_static = newPurpose_name_static;
    emit purpose_name_staticChanged();
}

QVector<QString> Account_widget::getPurpose_index_dynamic() const
{
    return m_purpose_index_dynamic;
}

void Account_widget::setPurpose_index_dynamic(const QVector<QString> &newPurpose_index_dynamic)
{
    if (m_purpose_index_dynamic == newPurpose_index_dynamic)
        return;
    m_purpose_index_dynamic = newPurpose_index_dynamic;
    emit purpose_index_dynamicChanged();
}

QVector<QString> Account_widget::getAccount_characters() const
{
    return m_account_characters;
}

void Account_widget::setAccount_characters(const QVector<QString> &newAccount_characters)
{
    if (m_account_characters == newAccount_characters)
        return;
    m_account_characters = newAccount_characters;
    emit account_charactersChanged();
}
