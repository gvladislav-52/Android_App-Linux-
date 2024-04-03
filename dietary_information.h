#ifndef DIETARY_INFORMATION_H
#define DIETARY_INFORMATION_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QDebug>
#include <QJsonDocument>
#include <QVariantMap>
#include <QNetworkRequest>
#include <QJsonObject>

class Dietary_information: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> note_string READ getNote_string WRITE setNote_string NOTIFY note_stringChanged FINAL)
    Q_PROPERTY(QVector<QString> food_schedule_string READ getFood_schedule_string WRITE setFood_schedule_string NOTIFY food_schedule_stringChanged FINAL)

    Q_PROPERTY(double Calories_day_temp READ getCalories_day_temp WRITE setCalories_day_temp NOTIFY Calories_day_tempChanged FINAL)
    Q_PROPERTY(double Protein_day_temp READ getProtein_day_temp WRITE setProtein_day_temp NOTIFY Protein_day_tempChanged FINAL)
    Q_PROPERTY(double Carb_day_temp READ getCarb_day_temp WRITE setCarb_day_temp NOTIFY Carb_day_tempChanged FINAL)
    Q_PROPERTY(double Fats_day_temp READ getFats_day_temp WRITE setFats_day_temp NOTIFY Fats_day_tempChanged FINAL)
    Q_PROPERTY(double Fiber_day_temp READ getFiber_day_temp WRITE setFiber_day_temp NOTIFY Fiber_day_tempChanged FINAL)

    Q_PROPERTY(QString Data_temp READ getData_temp WRITE setData_temp NOTIFY Data_tempChanged FINAL)
public:
    Dietary_information();
    QVector<QString> getNote_string() const;
    void setNote_string(const QVector<QString> &newNote_string);

    QVector<QString> getFood_schedule_string() const;
    void setFood_schedule_string(const QVector<QString> &newFood_schedule_string);

    double getCalories_day_temp() const;
    void setCalories_day_temp(double newCalories_day_temp);

    double getProtein_day_temp() const;
    void setProtein_day_temp(double newProtein_day_temp);

    double getCarb_day_temp() const;
    void setCarb_day_temp(double newCarb_day_temp);

    double getFats_day_temp() const;
    void setFats_day_temp(double newFats_day_temp);

    double getFiber_day_temp() const;
    void setFiber_day_temp(double newFiber_day_temp);

    void ConnectFunc(QString IdToken, QString IdLocal);

    QString getData_temp() const;
    void setData_temp(const QString &newData_temp);

signals:
    void note_stringChanged();

    void food_schedule_stringChanged();

    void Calories_day_tempChanged();

    void Protein_day_tempChanged();

    void Carb_day_tempChanged();

    void Fats_day_tempChanged();

    void Fiber_day_tempChanged();

    void Data_tempChanged();

private:
    QNetworkAccessManager * m_networkAccessManaager;
    QNetworkReply  * m_networkReply;
    QVector<QString> m_note_string;
    QVector<QString> m_food_schedule_string;

    double m_Calories_day_temp;

    double m_Protein_day_temp;

    double m_Carb_day_temp;

    double m_Fats_day_temp;

    double m_Fiber_day_temp;

    QString m_Data_temp;
    int m_Data_int;

    double m_SumCalories;
    double m_SumProtein;
    double m_SumCarb;
    double m_SumFats;
    double m_Fiber;

public slots:
    void add_note_string();
    void remove_food_schedule(int index);
    void add_food_string();
    bool plus_data();
    bool del_data();
    void set_adding_food_metrics(double calories, double protein, double carb, double fats, double fiber);
};

#endif // DIETARY_INFORMATION_H
