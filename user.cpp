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
    //setTarget_metabolism(0);
    m_networkAccessManaager = new QNetworkAccessManager(this);
    //connect(this, &User::userSignedIn,this,&User::add_db);
    //connect(this, &User::userSignedIn,this,&User::selectAll);
    connect(this, &User::userSignedIn, this, [=](){
        get_vector_data(m_Vector_weight, m_Vector_data_weight,"History_weight/Weight","History_weight/Date", true);
        get_vector_data(m_Vector_height, m_Vector_data_height,"History_height/Height","History_height/Date", false);
    });

    connect(this, &User::userSignedIn,this,&User::get_data_from_db);
    //connect(this, &User::userSignedIn,this,&User::get_vector_data);

    m_Protein = 212;
    m_Carb = 415;
    m_Fats = 96;
    m_Fiber = 28;
   // m_Target_metabolism = 2914;

    //setTarget_metabolism(2000);
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
        //qDebug() << m_vector_weight;
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
                                setTrain_option(jsonObject["Training"].toString());
                                gender = jsonObject["Gender"].toString();
                                setActual_weight(jsonObject["Actual_weight"].toInt());
                                setTarget_weight(jsonObject["Target_weight"].toInt());
                                age = jsonObject["Age"].toInt();
                                height = jsonObject["Height"].toInt();

                                double temp_drink = m_Actual_weight;
                                setDrinking_regime((temp_drink*30)/1000);

                                if(gender == "Male")
                                    setMetabolism(66.5+(13.75*m_Actual_weight)+(5.003*height)-(6.775-age));
                                else if (gender == "Female")
                                    setMetabolism(655.1+(9.563*m_Actual_weight)+(1.850*height)-(4.676-age));

                                setIndex_body((static_cast<double>(m_Actual_weight) / (static_cast<double>(height) * static_cast<double>(height)))*10000);
                                setTarget_metabolism(m_Metabolism*1.5);
                    }
                }

                networkReply->deleteLater();
    });
}

void User::get_vector_data(QVector<int> &data_int, QVector<QString> &data_string, QString m_path, QString m_data, bool temp_variable)
{
    QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/" + m_path + ".json?auth=" + m_idToken;
    QNetworkReply * networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));

    connect(networkReply, &QNetworkReply::finished, [=, &data_int]()
            {
                if(networkReply->error() == QNetworkReply::NoError)
                {
                    QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
                    if (!jsonResponse.isNull())
                    {
                        QJsonObject jsonObject = jsonResponse.object();
                        bool temp = false;
                        int num = data_int.size();
                        while (!temp)
                        {
                            if (jsonObject.contains("Data_" + QString::number(num+1)))
                            {
                                if(temp_variable)
                                    add_vector_weight(jsonObject["Data_" + QString::number(num+1)].toInt());
                                else
                                    add_vector_height(jsonObject["Data_" + QString::number(num+1)].toInt());
                                num++;
                            }
                            else
                            {
                                temp = true;
                            }
                        }
                    }
                }
                networkReply->deleteLater();
    });

    url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/" + m_data + ".json?auth=" + m_idToken;
    networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));

    connect(networkReply, &QNetworkReply::finished, [=, &data_string]()
            {
                if(networkReply->error() == QNetworkReply::NoError)
                {
                    QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
                    if (!jsonResponse.isNull())
                    {
                        QJsonObject jsonObject = jsonResponse.object();
                        bool temp = false;
                        int num = data_string.size();
                        while (!temp)
                        {
                            if (jsonObject.contains("Data_" + QString::number(num+1)))
                            {
                                if(temp_variable)
                                    add_data_weight(jsonObject["Data_" + QString::number(num+1)].toString());
                                else
                                    add_data_height(jsonObject["Data_" + QString::number(num+1)].toString());
                                num++;
                            }
                            else
                            {
                                temp = true;
                            }
                        }
                    }
                }
                networkReply->deleteLater();
            });
}

void User::add_vector_weight(int num)
{
    m_Vector_weight.append(num);
    emit Vector_weightChanged();
}

void User::add_data_weight(QString data)
{
    if(data == "")
    {
        QDate currentDate = QDate::currentDate();
        m_Vector_data_weight.append(currentDate.toString("dd-MM-yyyy"));
        emit Vector_data_weightChanged();
    }
    else
    {
        m_Vector_data_weight.append(data);
        emit Vector_data_weightChanged();
    }
}

void User::add_vector_height(int num)
{
    m_Vector_height.append(num);
    emit Vector_heightChanged();
}

void User::add_data_height(QString data)
{
    if(data == "")
    {
        QDate currentDate = QDate::currentDate();
        m_Vector_data_height.append(currentDate.toString("dd-MM-yyyy"));
        emit Vector_data_heightChanged();
    }
    else
    {
        m_Vector_data_height.append(data);
    emit Vector_data_heightChanged();
    }
}

void User::remove_weight(int index)
{
    if (index >= 0 && index < m_Vector_weight.size())
    {
        m_Vector_weight.remove(index);
    }
    emit Vector_weightChanged();
}

void User::remove_height(int index)
{
    if (index >= 0 && index < m_Vector_height.size())
    {
        m_Vector_height.remove(index);
    }
    emit Vector_heightChanged();
}

void User::remove_data_weight(int index)
{
    if (index >= 0 && index < m_Vector_data_weight.size())
    {
        m_Vector_data_weight.remove(index);
    }
    emit Vector_data_weightChanged();
}

void User::remove_data_height(int index)
{
    if (index >= 0 && index < m_Vector_data_height.size())
    {
        m_Vector_data_height.remove(index);
    }
    emit Vector_data_heightChanged();
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

QVector<int> User::getVector_weight() const
{
    return m_Vector_weight;
}

void User::setVector_weight(const QVector<int> &newVector_weight)
{
    if (m_Vector_weight == newVector_weight)
        return;
    m_Vector_weight = newVector_weight;
    emit Vector_weightChanged();
}


QVector<QString> User::getVector_data_weight() const
{
    return m_Vector_data_weight;
}

void User::setVector_data_weight(const QVector<QString> &newVector_data_weight)
{
    if (m_Vector_data_weight == newVector_data_weight)
        return;
    m_Vector_data_weight = newVector_data_weight;
    emit Vector_data_weightChanged();
}

QVector<int> User::getVector_height() const
{
    return m_Vector_height;
}

void User::setVector_height(const QVector<int> &newVector_height)
{
    if (m_Vector_height == newVector_height)
        return;
    m_Vector_height = newVector_height;
    emit Vector_heightChanged();
}

QVector<QString> User::getVector_data_height() const
{
    return m_Vector_data_height;
}

void User::setVector_data_height(const QVector<QString> &newVector_data_height)
{
    if (m_Vector_data_height == newVector_data_height)
        return;
    m_Vector_data_height = newVector_data_height;
    emit Vector_data_heightChanged();
}

float User::getIndex_body() const
{
    return m_Index_body;
}

void User::setIndex_body(float newIndex_body)
{
    if (qFuzzyCompare(m_Index_body, newIndex_body))
        return;
    m_Index_body = newIndex_body;
    emit Index_bodyChanged();
}

int User::getProtein() const
{
    return m_Protein;
}

void User::setProtein(int newProtein)
{
    if (m_Protein == newProtein)
        return;
    m_Protein = newProtein;
    emit ProteinChanged();
}

int User::getCarb() const
{
    return m_Carb;
}

void User::setCarb(int newCarb)
{
    if (m_Carb == newCarb)
        return;
    m_Carb = newCarb;
    emit CarbChanged();
}

int User::getFats() const
{
    return m_Fats;
}

void User::setFats(int newFats)
{
    if (m_Fats == newFats)
        return;
    m_Fats = newFats;
    emit FatsChanged();
}

int User::getFiber() const
{
    return m_Fiber;
}

void User::setFiber(int newFiber)
{
    if (m_Fiber == newFiber)
        return;
    m_Fiber = newFiber;
    emit FiberChanged();
}
