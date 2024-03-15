#include "main_data_management_db.h"

Main_data_management_db::Main_data_management_db(QObject *parent)
    : QObject(parent),
    m_apiKey(QString())
{
    // m_weight = "100";
    // m_food = "Chicken";
    // m_type = "Meat";
    // m_name = "pavlov";
    // m_height = "180";
    m_networkAccessManaager = new QNetworkAccessManager(this);
    //connect(this, &Main_data_management_db::userSignedIn,this,&Main_data_management_db::add_db);
    connect(this, &Main_data_management_db::userSignedIn,this,&Main_data_management_db::selectAll);
    connect(this, &Main_data_management_db::userSignedIn,this,&Main_data_management_db::get_data_from_db);
    m_account_widget = new Account_widget();
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
        qDebug() << m_food;
        qDebug() << m_name;
        qDebug() << m_type;
        qDebug() << m_weight;
        qDebug() << m_height;
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
    newPet["Weight"] = m_weight;
    newPet["Height"] = m_height;
    QJsonDocument jsonDoc = QJsonDocument::fromVariant(newPet);

    QNetworkRequest newPetRequest(QUrl("https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/"+ catalog+ "/.json?auth=" + idToken));
    newPetRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    m_networkAccessManaager->put(newPetRequest, jsonDoc.toJson());
}

void Main_data_management_db::get_data_from_db()
{
    QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/.json?auth=" + idToken;
    QNetworkReply * networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));

    connect(networkReply, &QNetworkReply::finished, [=]()
            {
                if(networkReply->error() == QNetworkReply::NoError)
                {
                    QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
                    if (!jsonResponse.isNull())
                    {
                        QJsonObject jsonObject = jsonResponse.object();

                        for(int i = 0; i < 5; i++)
                        {
                            switch(i)
                            {
                            case 0:
                                m_food = jsonObject["Food"].toString();
                                break;
                            case 1:
                                m_name = jsonObject["Name"].toString();
                                break;
                            case 2:
                                m_type = jsonObject["Type"].toString();
                                break;
                            case 3:
                                m_weight = jsonObject["Weight"].toString();
                                m_account_widget->data_observation()->add_weight(m_weight);
                                break;
                            case 4:
                                m_height = jsonObject["Height"].toString();
                                m_account_widget->data_observation()->add_height(m_height);
                            }
                        }
                    }
                }

                networkReply->deleteLater();
            });
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
