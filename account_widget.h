#ifndef ACCOUNT_WIDGET_H
#define ACCOUNT_WIDGET_H

#include <QObject>

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

public:
    Account_widget();
    QVector<QString> getAccount_name_button() const;
    void setAccount_name_button(const QVector<QString> &newAccount_name_button);

    Purpose_widget *purpose_object() const;

    Data_observation_widget *data_observation() const;

    My_food_widget *my_food_object() const;

signals:
    void account_name_buttonChanged();

private:
    QVector<QString> m_account_name_button;
    Purpose_widget *m_purpose_object = nullptr;
    Data_observation_widget *m_data_observation = nullptr;
    My_food_widget *m_my_food_object = nullptr;
};

class Purpose_widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> purpose_name_static READ getPurpose_name_static WRITE setPurpose_name_static NOTIFY purpose_name_staticChanged FINAL)
    Q_PROPERTY(QVector<QString> purpose_index_dynamic READ getPurpose_index_dynamic WRITE setPurpose_index_dynamic NOTIFY purpose_index_dynamicChanged FINAL)


public:
    Purpose_widget();
    QVector<QString> getPurpose_name_static() const;
    void setPurpose_name_static(const QVector<QString> &newPurpose_name_static);

    QVector<QString> getPurpose_index_dynamic() const;
    void setPurpose_index_dynamic(const QVector<QString> &newPurpose_index_dynamic);

signals:
    void purpose_name_staticChanged();

    void purpose_index_dynamicChanged();

private:
    QVector<QString> m_purpose_name_static;
    QVector<QString> m_purpose_index_dynamic;
};

class Data_observation_widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> account_characters READ getAccount_characters WRITE setAccount_characters NOTIFY account_charactersChanged FINAL)
    Q_PROPERTY(QVector<QString> account_vector_weight READ getAccount_vector_weight WRITE setAccount_vector_weight NOTIFY account_vector_weightChanged FINAL)
public:
    Data_observation_widget();
    QVector<QString> getAccount_characters() const;
    void setAccount_characters(const QVector<QString> &newAccount_characters);

    QVector<QString> getAccount_vector_weight() const;
    void setAccount_vector_weight(const QVector<QString> &newAccount_vector_weight);

signals:
    void account_charactersChanged();

    void account_vector_weightChanged();

private:
    QVector<QString> m_account_characters;
    QVector<QString> m_account_vector_weight;

public slots:
    void add_weight(QString num);
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
