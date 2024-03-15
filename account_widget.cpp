#include "account_widget.h"

Account_widget::Account_widget()
{
    m_account_name_button.append("Твоя цель");
    m_account_name_button.append("Данные для наблюдения");
    m_account_name_button.append("Мои блюда");
    m_account_name_button.append("Изменить пароль");
    m_account_name_button.append("Удалить аккаунт");

    m_purpose_object = new Purpose_widget();
    m_data_observation = new Data_observation_widget();
    m_my_food_object = new My_food_widget();
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

Purpose_widget::Purpose_widget()
{
    m_purpose_name_static.append("Цель");
    m_purpose_name_static.append("Дневной прием");
    m_purpose_name_static.append("Ожидаемый вес");
    m_purpose_name_static.append("Мой питьевой режим");
    m_purpose_name_static.append("Твой обмен веществ");

    //m_purpose_temp = "Набрать мышечную массу";
    // m_afternoon = "3433 ккал.";
    // m_expected_weight = "77,0 кг";
    // m_drinking_regime = "2,88";
    // m_metabolism = "1809, 0 ккал";
}

QVector<QString> Purpose_widget::getPurpose_name_static() const
{
    return m_purpose_name_static;
}

void Purpose_widget::setPurpose_name_static(const QVector<QString> &newPurpose_name_static)
{
    if (m_purpose_name_static == newPurpose_name_static)
        return;
    m_purpose_name_static = newPurpose_name_static;
    emit purpose_name_staticChanged();
}

Data_observation_widget::Data_observation_widget()
{
    m_account_characters.append("Вес [кг]");
    m_account_characters.append("Рост");

    // m_account_vector_weight.append("73");
    // m_account_vector_weight.append("74");

    // m_account_vector_height.append("15");
    // m_account_vector_height.append("220");

    m_account_date_temp.append("08.02.2024");
    // m_account_date_temp.append("15.02.2024");
}

QVector<QString> Data_observation_widget::getAccount_characters() const
{
    return m_account_characters;
}

void Data_observation_widget::setAccount_characters(const QVector<QString> &newAccount_characters)
{
    if (m_account_characters == newAccount_characters)
        return;
    m_account_characters = newAccount_characters;
    emit account_charactersChanged();
}

Purpose_widget *Account_widget::purpose_object() const
{
    return m_purpose_object;
}

Data_observation_widget *Account_widget::data_observation() const
{
    return m_data_observation;
}

My_food_widget::My_food_widget()
{
    m_my_food_static.append("Макароны");
}

void My_food_widget::add_my_food(QString name_food)
{
    m_my_food_static.append(name_food);
}

void My_food_widget::redact_my_food(int index, QString name)
{
    m_my_food_static[index] = name;
    emit my_food_staticChanged();
}

QVector<QString> My_food_widget::getMy_food_static() const
{
    return m_my_food_static;
}

void My_food_widget::setMy_food_static(const QVector<QString> &newMy_food_static)
{
    if (m_my_food_static == newMy_food_static)
        return;
    m_my_food_static = newMy_food_static;
    emit my_food_staticChanged();
}

My_food_widget *Account_widget::my_food_object() const
{
    return m_my_food_object;
}

QVector<QString> Data_observation_widget::getAccount_vector_weight() const
{
    return m_account_vector_weight;
}

void Data_observation_widget::setAccount_vector_weight(const QVector<QString> &newAccount_vector_weight)
{
    if (m_account_vector_weight == newAccount_vector_weight)
        return;
    m_account_vector_weight = newAccount_vector_weight;
    emit account_vector_weightChanged();
}

void Data_observation_widget::add_weight(QString num)
{
    m_account_vector_weight.append(num);
    emit account_vector_weightChanged();
}

void Data_observation_widget::add_date()
{
    QDate currentDate = QDate::currentDate();
    m_account_date_temp.append(currentDate.toString("dd-MM-yyyy"));
    emit account_date_tempChanged();
}

void Data_observation_widget::add_height(QString height)
{
    m_account_vector_height.append(height);
    emit account_vector_heightChanged();
}

void Data_observation_widget::remove_item_schedule(int index)
{
    if (index >= 0 && index < m_account_vector_weight.size())
    {
        m_account_vector_weight.remove(index);
    }
    emit account_vector_weightChanged();
}

void Data_observation_widget::remove_item_height(int index)
{
    if (index >= 0 && index < m_account_vector_height.size())
    {
        m_account_vector_height.remove(index);
    }
    emit account_vector_heightChanged();
}

QVector<QString> Data_observation_widget::getAccount_date_temp() const
{
    return m_account_date_temp;
}

void Data_observation_widget::setAccount_date_temp(const QVector<QString> &newAccount_date_temp)
{
    if (m_account_date_temp == newAccount_date_temp)
        return;
    m_account_date_temp = newAccount_date_temp;
    emit account_date_tempChanged();
}

QVector<QString> Data_observation_widget::getAccount_vector_height() const
{
    return m_account_vector_height;
}

void Data_observation_widget::setAccount_vector_height(const QVector<QString> &newAccount_vector_height)
{
    if (m_account_vector_height == newAccount_vector_height)
        return;
    m_account_vector_height = newAccount_vector_height;
    emit account_vector_heightChanged();
}

QString Account_widget::getEmail_log() const
{
    return m_email_log;
}

void Account_widget::setEmail_log(const QString &newEmail_log)
{
    if (m_email_log == newEmail_log)
        return;
    m_email_log = newEmail_log;
    emit email_logChanged();
}

QString Purpose_widget::getPurpose_temp() const
{
    return m_purpose_temp;
}

void Purpose_widget::setPurpose_temp(const QString &newPurpose_temp)
{
    if (m_purpose_temp == newPurpose_temp)
        return;
    m_purpose_temp = newPurpose_temp;
    emit purpose_tempChanged();
}

QString Purpose_widget::getExpected_weight() const
{
    return m_expected_weight;
}

void Purpose_widget::setExpected_weight(const QString &newExpected_weight)
{
    if (m_expected_weight == newExpected_weight)
        return;
    m_expected_weight = newExpected_weight;
    emit expected_weightChanged();
}

double Purpose_widget::getDrinking_regime() const
{
    return m_drinking_regime;
}

void Purpose_widget::setDrinking_regime(const double &newDrinking_regime)
{
    if (m_drinking_regime == newDrinking_regime)
        return;
    m_drinking_regime = newDrinking_regime;
    emit drinking_regimeChanged();
}

int Purpose_widget::getMetabolism() const
{
    return m_metabolism;
}

void Purpose_widget::setMetabolism(const int &newMetabolism)
{
    if (m_metabolism == newMetabolism)
        return;
    m_metabolism = newMetabolism;
    emit metabolismChanged();
}

int Purpose_widget::getAfternoon() const
{
    return m_afternoon;
}

void Purpose_widget::setAfternoon(const int &newAfternoon)
{
    if (m_afternoon == newAfternoon)
        return;
    m_afternoon = newAfternoon;
    emit afternoonChanged();
}

void Purpose_widget::add_purpose(QString temp)
{
    m_purpose_temp = temp;
    qDebug() << m_purpose_temp;
    emit purpose_tempChanged();
}
