#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QDebug>
#include <QJsonDocument>
#include <QVariantMap>
#include <QNetworkRequest>
#include <QJsonObject>
#include <QDate>

class Database: public QObject
{
    Q_OBJECT

public:
    explicit Database(QObject *parent = nullptr);
    ~Database();

    void setApiKey(const QString &apiKey);                                      //ключ
    void signUserUp(const QString & emailAddress, const QString & password);    //регистрация
    void signUserIn(const QString & emailAddress, const QString & password);    //авторизация

public slots:
    void networkReplyReadyRead();
    void selectAll();
    void add_db();
    //void get_data_food();
    // get_data_from_db();
    void get_vector_data(QVector<int> &data_int, QVector<QString> &data_string, QString m_path, QString m_data, bool temp_variable);
    int get_user_data_int(QString nameData) const;
    QString get_user_data_string(QString nameData) const;
    QVector<int> get_user_data_vector_int(QString nameData, QString pathData);
    QVector<QString> get_user_data_vector_string (QString nameData, QString pathData);
    QString get_email_info() {return m_email;}

    QMap<QString, QMap<QString, double>> get_data_table_food();

    void add_food_in_schedule(QString name, QString data, int index_schedule);
    bool get_data_day(QString nameData);
    void add_data_day(QString nameData);


signals:
    void userSignedIn();

private:
    void performPOST (const QString &url, const QJsonDocument & payload);
    QString m_apikey;
    QNetworkAccessManager * m_networkAccessManaager;
    QNetworkReply  * m_networkReply;
    QString m_idToken;
    QString m_localId;
    QString m_email;

};

#endif // DATABASE_H
