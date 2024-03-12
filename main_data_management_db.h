#ifndef MAIN_DATA_MANAGEMENT_DB_H
#define MAIN_DATA_MANAGEMENT_DB_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QDebug>
#include <QJsonDocument>
#include <QVariantMap>
#include <QNetworkRequest>
#include <QJsonObject>

#include "account_widget.h"

class Main_data_management_db : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(QString weight READ setWeight WRITE setWeight NOTIFY weightChanged FINAL)
    Q_PROPERTY(Account_widget* account_widget READ account_widget CONSTANT)
public:
    explicit Main_data_management_db(QObject *parent = nullptr);
    ~Main_data_management_db();
    void setApiKey(const QString & apiKey);                                     //берем ключ firebase
    void signUserUp(const QString & emailAddress, const QString & password);    //регистрация
    void signUserIn(const QString & emailAddress, const QString & password);    //авторизация
    QString setWeight() const;
    void setWeight(const QString &newWeight);

    Account_widget *account_widget() const;

public slots:
    void networkReplyReadyRead();
    void selectAll();
    void add_db();

signals:
    void userSignedIn();

    void weightChanged();

private:
    void performPOST(const QString &url, const QJsonDocument & payload);
    QString m_apiKey;
    QNetworkAccessManager * m_networkAccessManaager;
    QNetworkReply  * m_networkReply;
    QString idToken;
    QString m_localId;
    QString m_food;
    QString m_name;
    QString m_type;
    QString m_weight;
    Account_widget *m_account_widget = nullptr;
};

#endif // MAIN_DATA_MANAGEMENT_DB_H
