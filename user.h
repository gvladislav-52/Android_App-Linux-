#ifndef USER_H
#define USER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QDebug>
#include <QJsonDocument>
#include <QVariantMap>
#include <QNetworkRequest>
#include <QJsonObject>

class User: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString Email_log READ getEmail_log WRITE setEmail_log NOTIFY Email_logChanged FINAL)
    Q_PROPERTY(QString Train_option READ getTrain_option WRITE setTrain_option NOTIFY Train_optionChanged FINAL)
    Q_PROPERTY(int Actual_weight READ getActual_weight WRITE setActual_weight NOTIFY Actual_weightChanged FINAL)
    Q_PROPERTY(int Target_weight READ getTarget_weight WRITE setTarget_weight NOTIFY Target_weightChanged FINAL)
    Q_PROPERTY(double Drinking_regime READ getDrinking_regime WRITE setDrinking_regime NOTIFY Drinking_regimeChanged FINAL)
    Q_PROPERTY(int Metabolism READ getMetabolism WRITE setMetabolism NOTIFY MetabolismChanged FINAL)
    Q_PROPERTY(int Target_metabolism READ getTarget_metabolism WRITE setTarget_metabolism NOTIFY Target_metabolismChanged FINAL)

public:
    explicit User(QObject *parent = nullptr);
    ~User();

    void setApiKey(const QString &apiKey);                                      //ключ
    void signUserUp(const QString & emailAddress, const QString & password);    //регистрация
    void signUserIn(const QString & emailAddress, const QString & password);    //авторизация

    QString getTrain_option() const;
    void setTrain_option(const QString &newTrain_option);

    int getActual_weight() const;
    void setActual_weight(int newActual_weight);

    int getTarget_weight() const;
    void setTarget_weight(int newTarget_weight);

    double getDrinking_regime() const;
    void setDrinking_regime(double newDrinking_regime);

    int getMetabolism() const;
    void setMetabolism(int newMetabolism);

    int getTarget_metabolism() const;
    void setTarget_metabolism(int newTarget_metabolism);

    QString getEmail_log() const;
    void setEmail_log(const QString &newEmail_log);

public slots:
    void networkReplyReadyRead();
    void selectAll();
    void add_db();
    void get_data_from_db();

signals:
    void userSignedIn();

    void Train_optionChanged();

    void Actual_weightChanged();

    void Target_weightChanged();

    void Drinking_regimeChanged();

    void MetabolismChanged();

    void Target_metabolismChanged();

    void Email_logChanged();

private:
    void performPOST (const QString &url, const QJsonDocument & payload);
    QString m_apikey;
    QNetworkAccessManager * m_networkAccessManaager;
    QNetworkReply  * m_networkReply;
    QString m_idToken;
    QString m_localId;

    QString gender;
    int activity;
    int age;
    int height;
    QString m_Train_option;
    int m_Actual_weight;
    int m_Target_weight;
    double m_Drinking_regime;
    int m_Metabolism;
    int m_Target_metabolism;
    QString m_Email_log;
};

#endif // USER_H
