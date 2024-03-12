#include "main_data_management_db.h"

Main_data_management_db::Main_data_management_db(QObject *parent)
    : QObject(parent),
    m_apiKey(QString())
{
    m_networkAccessManaager = new QNetworkAccessManager(this);
    connect(this, &Main_data_management_db::userSignedIn,this,&Main_data_management_db::add_db);
    connect(this, &Main_data_management_db::userSignedIn,this,&Main_data_management_db::selectAll);
    m_account_widget = new Account_widget();
    m_food = "Hava";
    m_name = "lol";
    m_type = "nucl";
}

Main_data_management_db::~Main_data_management_db()
{
    m_networkAccessManaager->deleteLater();
}

void Main_data_management_db::setApiKey(const QString &apiKey)
{
    m_apiKey =apiKey;
}

void Main_data_management_db::signUserUp(const QString &emailAddress, const QString &password)
{
    QString signUpEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + m_apiKey;
    QVariantMap variantPayload;
    variantPayload["email"] = emailAddress;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPayload = QJsonDocument::fromVariant(variantPayload);
    performPOST(signUpEndpoint,jsonPayload);
}

void Main_data_management_db::signUserIn(const QString &emailAddress, const QString &password)
{
    QString signInEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + m_apiKey;
    QVariantMap variantPayload;
    variantPayload["email"] = emailAddress;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPayload = QJsonDocument::fromVariant(variantPayload);
    performPOST(signInEndpoint,jsonPayload);

}

void Main_data_management_db::networkReplyReadyRead()
{
    QByteArray response = m_networkReply->readAll();
    m_networkReply->deleteLater();

    QJsonDocument jsonDocument = QJsonDocument::fromJson(response);
    if (jsonDocument.object().contains("error"))
    {
        qDebug () << "Error occured!" << response;
    }
    else if (jsonDocument.object().contains("kind"))
    {
        idToken = jsonDocument.object().value("idToken").toString();
        m_localId = jsonDocument.object().value("localId").toString();
        qDebug () << "Succesfull!";
        emit userSignedIn();
    }
    else
    {
        qDebug() << "The response was: " << response;
    }
}

void Main_data_management_db::selectAll()
{
    QString catalog = m_localId;
    QString endPoint = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + catalog+ "/.json?auth=" + idToken;
    m_networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(endPoint)));

    connect(m_networkReply, &QNetworkReply::readyRead,this,&Main_data_management_db::networkReplyReadyRead);
}

void Main_data_management_db::add_db()
{
    QString catalog = m_localId;
    QVariantMap newPet;
    newPet["Type"] = m_type;
    newPet["Name"] = m_name;
    newPet["Food"] = m_food;
    QJsonDocument jsonDoc = QJsonDocument::fromVariant(newPet);

    QNetworkRequest newPetRequest(QUrl("https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/"+ catalog+ "/.json?auth=" + idToken));
    newPetRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    m_networkAccessManaager->put(newPetRequest, jsonDoc.toJson());
}

void Main_data_management_db::performPOST(const QString &url, const QJsonDocument &payload)
{
    QNetworkRequest newRequest ((QUrl(url)));
    newRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    m_networkReply = m_networkAccessManaager->post(newRequest,payload.toJson());
    connect(m_networkReply, &QNetworkReply::readyRead,this,&Main_data_management_db::networkReplyReadyRead);
}


QString Main_data_management_db::setWeight() const
{
    return m_weight;
}

void Main_data_management_db::setWeight(const QString &newWeight)
{
    if (m_weight == newWeight)
        return;
    m_weight = newWeight;
    emit weightChanged();
}

Account_widget *Main_data_management_db::account_widget() const
{
    return m_account_widget;
}
