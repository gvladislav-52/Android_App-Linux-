#ifndef ACCOUNT_WIDGET_H
#define ACCOUNT_WIDGET_H

#include <QObject>
#include <QDate>

class Purpose_widget;
class Data_observation_widget;
class My_food_widget;

class Account_widget:public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> account_name_button READ getAccount_name_button WRITE setAccount_name_button NOTIFY account_name_buttonChanged FINAL)
    Q_PROPERTY(Purpose_widget* purpose_object READ purpose_object CONSTANT)
    Q_PROPERTY(Data_observation_widget* data_observation READ data_observation CONSTANT)
    Q_PROPERTY(My_food_widget* my_food_object READ my_food_object CONSTANT)
    Q_PROPERTY(QString email_log READ getEmail_log WRITE setEmail_log NOTIFY email_logChanged FINAL)

public:
    Account_widget();
    QVector<QString> getAccount_name_button() const;
    void setAccount_name_button(const QVector<QString> &newAccount_name_button);

    Purpose_widget *purpose_object() const;

    Data_observation_widget *data_observation() const;

    My_food_widget *my_food_object() const;

    QString getEmail_log() const;
    void setEmail_log(const QString &newEmail_log);

signals:
    void account_name_buttonChanged();

    void email_logChanged();

private:
    QVector<QString> m_account_name_button;
    Purpose_widget *m_purpose_object = nullptr;
    Data_observation_widget *m_data_observation = nullptr;
    My_food_widget *m_my_food_object = nullptr;
    QString m_email_log;
};

class Purpose_widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> purpose_name_static READ getPurpose_name_static WRITE setPurpose_name_static NOTIFY purpose_name_staticChanged FINAL)
    Q_PROPERTY(QString purpose_temp READ getPurpose_temp WRITE setPurpose_temp NOTIFY purpose_tempChanged FINAL)
    Q_PROPERTY(int afternoon READ getAfternoon WRITE setAfternoon NOTIFY afternoonChanged FINAL)
    Q_PROPERTY(QString expected_weight READ getExpected_weight WRITE setExpected_weight NOTIFY expected_weightChanged FINAL)
    Q_PROPERTY(double drinking_regime READ getDrinking_regime WRITE setDrinking_regime NOTIFY drinking_regimeChanged FINAL)
    Q_PROPERTY(int metabolism READ getMetabolism WRITE setMetabolism NOTIFY metabolismChanged FINAL)

public:
    Purpose_widget();
    QVector<QString> getPurpose_name_static() const;
    void setPurpose_name_static(const QVector<QString> &newPurpose_name_static);

    QString getPurpose_temp() const;
    void setPurpose_temp(const QString &newPurpose_temp);

    QString getExpected_weight() const;
    void setExpected_weight(const QString &newExpected_weight);

    double getDrinking_regime() const;
    void setDrinking_regime(const double &newDrinking_regime);

    int getMetabolism() const;
    void setMetabolism(const int &newMetabolism);

    int getAfternoon() const;
    void setAfternoon(const int &newAfternoon);

signals:
    void purpose_name_staticChanged();

    void purpose_tempChanged();

    void expected_weightChanged();

    void drinking_regimeChanged();

    void metabolismChanged();

    void afternoonChanged();
public slots:
    void add_purpose(QString temp);

private:
    QVector<QString> m_purpose_name_static;

    QString m_purpose_temp;
    QString m_expected_weight;
    double m_drinking_regime;
    int m_metabolism;
    int m_afternoon;

    QString purpose;
};

class Data_observation_widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> account_characters READ getAccount_characters WRITE setAccount_characters NOTIFY account_charactersChanged FINAL)
    Q_PROPERTY(QVector<QString> account_vector_weight READ getAccount_vector_weight WRITE setAccount_vector_weight NOTIFY account_vector_weightChanged FINAL)
    Q_PROPERTY(QVector<QString> account_date_temp READ getAccount_date_temp WRITE setAccount_date_temp NOTIFY account_date_tempChanged FINAL)
    Q_PROPERTY(QVector<QString> account_vector_height READ getAccount_vector_height WRITE setAccount_vector_height NOTIFY account_vector_heightChanged FINAL)
public:
    Data_observation_widget();
    QVector<QString> getAccount_characters() const;
    void setAccount_characters(const QVector<QString> &newAccount_characters);

    QVector<QString> getAccount_vector_weight() const;
    void setAccount_vector_weight(const QVector<QString> &newAccount_vector_weight);

    QVector<QString> getAccount_date_temp() const;
    void setAccount_date_temp(const QVector<QString> &newAccount_date_temp);

    QVector<QString> getAccount_vector_height() const;
    void setAccount_vector_height(const QVector<QString> &newAccount_vector_height);

signals:
    void account_charactersChanged();

    void account_vector_weightChanged();

    void account_date_tempChanged();

    void account_vector_heightChanged();

private:
    QVector<QString> m_account_characters;
    QVector<QString> m_account_vector_weight;
    QVector<QString> m_account_date_temp;

    QVector<QString> m_account_vector_height;

public slots:
    void add_weight(QString num);
    void add_date();
    void add_height(QString height);
    void remove_item_schedule(int index);
    void remove_item_height(int index);
};

class My_food_widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> my_food_static READ getMy_food_static WRITE setMy_food_static NOTIFY my_food_staticChanged FINAL)

public:
    My_food_widget();
    QVector<QString> getMy_food_static() const;
    void setMy_food_static(const QVector<QString> &newMy_food_static);

signals:
    void my_food_staticChanged();

private:
    QVector<QString> m_my_food_static;
public slots:
    void add_my_food(QString name_food);
    void redact_my_food(int index, QString name);
};

#endif // ACCOUNT_WIDGET_H
