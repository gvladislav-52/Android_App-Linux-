#include "user.h"

User::User(QObject *parent)
    : QObject(parent),
    m_apikey(QString())
{
    // gender = "Male";
    // activity = 1;
    // age = 21;
    // height = 180;
    // m_Actual_weight = 75;
    // m_Target_weight = 77;
    // m_Train_option = "Набор мышечной массы";

    m_networkAccessManaager = new QNetworkAccessManager(this);
    //connect(this, &User::userSignedIn,this,&User::add_db);
    //connect(this, &User::userSignedIn,this,&User::selectAll);
    connect(this, &User::userSignedIn,this,&User::get_data_from_db);
    //m_account_widget = new Account_widget();
    //m_schedule_widget = new Schedule_widget();
}

User::~User()
{
    m_networkAccessManaager->deleteLater();
}

void User::setApiKey(const QString &apiKey)
{
    m_apikey =apiKey;
}

void User::signUserUp(const QString &emailAddress, const QString &password)
{
    QString signUpEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + m_apikey;
    QVariantMap variantPayload;
    variantPayload["email"] = emailAddress;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPayload = QJsonDocument::fromVariant(variantPayload);
    performPOST(signUpEndpoint,jsonPayload);
}

void User::signUserIn(const QString &emailAddress, const QString &password)
{
    QString signInEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + m_apikey;
    QVariantMap variantPayload;
    variantPayload["email"] = emailAddress;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPayload = QJsonDocument::fromVariant(variantPayload);
    performPOST(signInEndpoint,jsonPayload);

}

void User::networkReplyReadyRead()
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
        m_idToken = jsonDocument.object().value("idToken").toString();
        m_localId = jsonDocument.object().value("localId").toString();
        setEmail_log(jsonDocument.object().value("email").toString());

        //m_account_widget->setEmail_log(m_email);
        qDebug () << "Succesfull!";
        qDebug () << m_Email_log;
        emit userSignedIn();
    }
    else
    {
        qDebug() << "The response was: " << response;
        qDebug() << m_Train_option;
        // qDebug() << m_height;
        // qDebug() << m_email;
        //qDebug() << training_option;
    }
}

void User::selectAll()
{
    QString catalog = m_localId;
    QString endPoint = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + catalog+ "/.json?auth=" + m_idToken;
    m_networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(endPoint)));

    connect(m_networkReply, &QNetworkReply::readyRead,this,&User::networkReplyReadyRead);
}

void User::add_db()
{
    QString catalog = m_localId;
    QVariantMap newPet;
    newPet["Training"] = m_Train_option;
    newPet["Gender"] = gender;
    newPet["Activity"] = activity;
    newPet["Age"] = age;
    newPet["Height"] = height;
    newPet["Actual_weight"] = m_Actual_weight;
    newPet["Target_weight"] = m_Target_weight;
    QJsonDocument jsonDoc = QJsonDocument::fromVariant(newPet);

    QNetworkRequest newPetRequest(QUrl("https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/"+ catalog+ "/.json?auth=" + m_idToken));
    newPetRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    m_networkAccessManaager->put(newPetRequest, jsonDoc.toJson());
}

void User::get_data_from_db()
{
    QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/.json?auth=" + m_idToken;
    QNetworkReply * networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));

    connect(networkReply, &QNetworkReply::finished, [=]()
            {
                if(networkReply->error() == QNetworkReply::NoError)
                {
                    QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
                    if (!jsonResponse.isNull())
                    {
                        QJsonObject jsonObject = jsonResponse.object();
                        for(int i = 0; i < 6; i++)
                        {
                            switch(i)
                            {
                            case 0:
                                setTrain_option(jsonObject["Training"].toString());
                                break;
                            case 1:
                                gender = jsonObject["Gender"].toString();
                                break;
                            case 2:
                                setActual_weight(jsonObject["Actual_weight"].toInt());
                                break;
                            case 3:
                                setTarget_weight(jsonObject["Target_weight"].toInt());
                                break;
                            case 4:
                                age = jsonObject["Age"].toInt();
                                break;
                            case 5:
                                height = jsonObject["Height"].toInt();
                                break;
                            }
                        }
                    }
                }
                double temp_drink = m_Actual_weight;
                setDrinking_regime((temp_drink*30)/1000);

                if(gender == "Male")
                    setMetabolism(66.5+(13.75*m_Actual_weight)+(5.003*height)-(6.775-age));
                else if (gender == "Female")
                    setMetabolism(655.1+(9.563*m_Actual_weight)+(1.850*height)-(4.676-age));

                setTarget_metabolism(m_Metabolism*1.5);

                //m_Train_option = "3433";
                // m_account_widget->purpose_object()->setAfternoon(m_afternoon);
                // m_drinking_regime = 2.92;
                // m_account_widget->purpose_object()->setDrinking_regime(m_drinking_regime);
                // m_schedule_widget->setDrinking_regime(m_drinking_regime);
                // m_metabolism = 1809;
                // m_account_widget->purpose_object()->setMetabolism(m_metabolism);
                networkReply->deleteLater();
            });
}


void User::performPOST(const QString &url, const QJsonDocument &payload)
{
    QNetworkRequest newRequest ((QUrl(url)));
    newRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    m_networkReply = m_networkAccessManaager->post(newRequest,payload.toJson());
    connect(m_networkReply, &QNetworkReply::readyRead,this,&User::networkReplyReadyRead);
}


QString User::getTrain_option() const
{
return m_Train_option;
}

void User::setTrain_option(const QString &newTrain_option)
{
if (m_Train_option == newTrain_option)
return;
m_Train_option = newTrain_option;
emit Train_optionChanged();
}

int User::getActual_weight() const
{
    return m_Actual_weight;
}

void User::setActual_weight(int newActual_weight)
{
    if (m_Actual_weight == newActual_weight)
        return;
    m_Actual_weight = newActual_weight;
    emit Actual_weightChanged();
}

int User::getTarget_weight() const
{
    return m_Target_weight;
}

void User::setTarget_weight(int newTarget_weight)
{
    if (m_Target_weight == newTarget_weight)
        return;
    m_Target_weight = newTarget_weight;
    emit Target_weightChanged();
}

double User::getDrinking_regime() const
{
    return m_Drinking_regime;
}

void User::setDrinking_regime(double newDrinking_regime)
{
    if (m_Drinking_regime == newDrinking_regime)
        return;
    m_Drinking_regime = newDrinking_regime;
    emit Drinking_regimeChanged();
}

int User::getMetabolism() const
{
    return m_Metabolism;
}

void User::setMetabolism(int newMetabolism)
{
    if (m_Metabolism == newMetabolism)
        return;
    m_Metabolism = newMetabolism;
    emit MetabolismChanged();
}

int User::getTarget_metabolism() const
{
    return m_Target_metabolism;
}

void User::setTarget_metabolism(int newTarget_metabolism)
{
    if (m_Target_metabolism == newTarget_metabolism)
        return;
    m_Target_metabolism = newTarget_metabolism;
    emit Target_metabolismChanged();
}

QString User::getEmail_log() const
{
    return m_Email_log;
}

void User::setEmail_log(const QString &newEmail_log)
{
    if (m_Email_log == newEmail_log)
        return;
    m_Email_log = newEmail_log;
    emit Email_logChanged();
}
