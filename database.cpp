#include "database.h"
#include <QEventLoop>

Database::Database(QObject *parent)
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
    //connect(this, &Database::userSignedIn,this,&Database::selectAll);
    // connect(this, &Database::userSignedIn, this, [=](){
    //     get_vector_data(m_Vector_weight, m_Vector_data_weight,"History_weight/Weight","History_weight/Date", true);
    //     get_vector_data(m_Vector_height, m_Vector_data_height,"History_height/Height","History_height/Date", false);
    // });

    //connect(this, &Database::userSignedIn,this,&Database::get_data_from_db);
    //connect(this, &User::userSignedIn,this,&User::get_vector_data);

    // m_Protein = 212;
    // m_Carb = 415;
    // m_Fats = 96;
    // m_Fiber = 28;
    // m_Target_metabolism = 2914;

    //setTarget_metabolism(2000);
}

Database::~Database()
{
    m_networkAccessManaager->deleteLater();
}

void Database::setApiKey(const QString &apiKey)
{
    m_apikey =apiKey;
}

void Database::signUserUp(const QString &emailAddress, const QString &password)
{
    QString signUpEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + m_apikey;
    QVariantMap variantPayload;
    variantPayload["email"] = emailAddress;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPayload = QJsonDocument::fromVariant(variantPayload);
    performPOST(signUpEndpoint,jsonPayload);
}

void Database::signUserIn(const QString &emailAddress, const QString &password)
{
    QString signInEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + m_apikey;
    QVariantMap variantPayload;
    variantPayload["email"] = emailAddress;
    variantPayload["password"] = password;
    variantPayload["returnSecureToken"] = true;

    QJsonDocument jsonPayload = QJsonDocument::fromVariant(variantPayload);
    performPOST(signInEndpoint,jsonPayload);

}

void Database::networkReplyReadyRead()
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
        m_email = jsonDocument.object().value("email").toString();
        //setEmail_log(jsonDocument.object().value("email").toString());

        //m_account_widget->setEmail_log(m_email);
        qDebug () << "Succesfull!";
        //qDebug () << m_Email_log;
        emit userSignedIn();
    }
    else
    {
        qDebug() << "The response was: " << response;
        //qDebug() << m_Train_option;
        //qDebug() << m_vector_weight;
        // qDebug() << m_email;
        //qDebug() << training_option;
    }
}

void Database::selectAll()
{
    QString catalog = m_localId;
    QString endPoint = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + catalog+ "/.json?auth=" + m_idToken;
    m_networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(endPoint)));

    connect(m_networkReply, &QNetworkReply::readyRead,this,&Database::networkReplyReadyRead);
}

void Database::add_db()
{
    // QString catalog = m_localId;
    // QVariantMap newPet;
    // newPet["Training"] = m_Train_option;
    // newPet["Gender"] = gender;
    // newPet["Activity"] = activity;
    // newPet["Age"] = age;
    // newPet["Height"] = height;
    // newPet["Actual_weight"] = m_Actual_weight;
    // newPet["Target_weight"] = m_Target_weight;
    // QJsonDocument jsonDoc = QJsonDocument::fromVariant(newPet);

    // QNetworkRequest newPetRequest(QUrl("https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/"+ catalog+ "/.json?auth=" + m_idToken));
    // newPetRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    // m_networkAccessManaager->put(newPetRequest, jsonDoc.toJson());
}

// void Database::get_data_food()
// {
//     QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/Date_Menu_Characters/" + m_localId + "/Day_1/AFTERNOON SNACK/.json?auth=" + m_idToken;
//     QNetworkReply * networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));

//     connect(networkReply, &QNetworkReply::finished, [=]()
//             {
//                 if(networkReply->error() == QNetworkReply::NoError)
//                 {
//                     QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
//                     if (!jsonResponse.isNull())
//                     {
//                         QJsonObject jsonObject = jsonResponse.object();
//                         qDebug() << (jsonObject["173"].toString());

//                     }
//                 }

//                 networkReply->deleteLater();
//             });
// }

// void Database::get_data_from_db()
// {
//     // QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/.json?auth=" + m_idToken;
//     // QNetworkReply * networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));

//     // connect(networkReply, &QNetworkReply::finished, [=]()
//     //         {
//     //             if(networkReply->error() == QNetworkReply::NoError)
//     //             {
//     //                 QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
//     //                 if (!jsonResponse.isNull())
//     //                 {
//     //                     QJsonObject jsonObject = jsonResponse.object();
//     //                     setTrain_option(jsonObject["Training"].toString());
//     //                     gender = jsonObject["Gender"].toString();
//     //                     setActual_weight(jsonObject["Actual_weight"].toInt());
//     //                     setTarget_weight(jsonObject["Target_weight"].toInt());
//     //                     age = jsonObject["Age"].toInt();
//     //                     height = jsonObject["Height"].toInt();

//     //                     double temp_drink = m_Actual_weight;
//     //                     setDrinking_regime((temp_drink*30)/1000);

//     //                     if(gender == "Male")
//     //                         setMetabolism(66.5+(13.75*m_Actual_weight)+(5.003*height)-(6.775-age));
//     //                     else if (gender == "Female")
//     //                         setMetabolism(655.1+(9.563*m_Actual_weight)+(1.850*height)-(4.676-age));

//     //                     setIndex_body((static_cast<double>(m_Actual_weight) / (static_cast<double>(height) * static_cast<double>(height)))*10000);
//     //                     setTarget_metabolism(m_Metabolism*1.5);
//     //                 }
//     //             }

//     //             networkReply->deleteLater();
//     //         });
// }

void Database::get_vector_data(QVector<int> &data_int, QVector<QString> &data_string, QString m_path, QString m_data, bool temp_variable)
{
    // QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/" + m_path + ".json?auth=" + m_idToken;
    // QNetworkReply * networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));

    // connect(networkReply, &QNetworkReply::finished, [=, &data_int]()
    //         {
    //             if(networkReply->error() == QNetworkReply::NoError)
    //             {
    //                 QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
    //                 if (!jsonResponse.isNull())
    //                 {
    //                     QJsonObject jsonObject = jsonResponse.object();
    //                     bool temp = false;
    //                     int num = data_int.size();
    //                     while (!temp)
    //                     {
    //                         if (jsonObject.contains("Data_" + QString::number(num+1)))
    //                         {
    //                             if(temp_variable)
    //                                 add_vector_weight(jsonObject["Data_" + QString::number(num+1)].toInt());
    //                             else
    //                                 add_vector_height(jsonObject["Data_" + QString::number(num+1)].toInt());
    //                             num++;
    //                         }
    //                         else
    //                         {
    //                             temp = true;
    //                         }
    //                     }
    //                 }
    //             }
    //             networkReply->deleteLater();
    //         });

    // url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/" + m_data + ".json?auth=" + m_idToken;
    // networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));

    // connect(networkReply, &QNetworkReply::finished, [=, &data_string]()
    //         {
    //             if(networkReply->error() == QNetworkReply::NoError)
    //             {
    //                 QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
    //                 if (!jsonResponse.isNull())
    //                 {
    //                     QJsonObject jsonObject = jsonResponse.object();
    //                     bool temp = false;
    //                     int num = data_string.size();
    //                     while (!temp)
    //                     {
    //                         if (jsonObject.contains("Data_" + QString::number(num+1)))
    //                         {
    //                             if(temp_variable)
    //                                 add_data_weight(jsonObject["Data_" + QString::number(num+1)].toString());
    //                             else
    //                                 add_data_height(jsonObject["Data_" + QString::number(num+1)].toString());
    //                             num++;
    //                         }
    //                         else
    //                         {
    //                             temp = true;
    //                         }
    //                     }
    //                 }
    //             }
    //             networkReply->deleteLater();
    //         });
}

int Database::get_user_data_int(QString nameData) const
{
    QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/.json?auth=" + m_idToken;
    QNetworkReply *networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));
    int temp = 0;

    QEventLoop loop;
    connect(networkReply, &QNetworkReply::finished, [&]()
            {
                if (networkReply->error() == QNetworkReply::NoError)
                {
                    QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
                    if (!jsonResponse.isNull())
                    {
                        QJsonObject jsonObject = jsonResponse.object();
                        temp = jsonObject[nameData].toInt();
                    }
                }

                networkReply->deleteLater();
                loop.quit();
            });

    loop.exec();

    return temp;
}

QString Database::get_user_data_string(QString nameData) const
{
    QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/.json?auth=" + m_idToken;
    QNetworkReply *networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));
    QString temp = 0;

    QEventLoop loop;
    connect(networkReply, &QNetworkReply::finished, [&]()
            {
                if (networkReply->error() == QNetworkReply::NoError)
                {
                    QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
                    if (!jsonResponse.isNull())
                    {
                        QJsonObject jsonObject = jsonResponse.object();
                        temp = jsonObject[nameData].toString();
                    }
                }

                networkReply->deleteLater();
                loop.quit();
            });

    loop.exec();

    return temp;
}

QVector<int> Database::get_user_data_vector_int(QString nameData, QString pathData)
{
        QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/" + pathData + ".json?auth=" + m_idToken;
        QNetworkReply * networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));
        QVector<int> data_int;

        QEventLoop loop;
        connect(networkReply, &QNetworkReply::finished, [&]()
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
                                if (jsonObject.contains(nameData + QString::number(num+1)))
                                {
                                        data_int.append(jsonObject[nameData + QString::number(num+1)].toInt());
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
                    loop.quit();
        });

        loop.exec();
        return data_int;
}

QVector<QString> Database::get_user_data_vector_string(QString nameData, QString pathData)
{
    QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/User_characters/" + m_localId + "/" + pathData + ".json?auth=" + m_idToken;
    QNetworkReply * networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));
    QVector<QString> data_string;

    QEventLoop loop;
    connect(networkReply, &QNetworkReply::finished, [&]()
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
                            if (jsonObject.contains(nameData + QString::number(num+1)))
                            {
                                data_string.append(jsonObject[nameData + QString::number(num+1)].toString());
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
                loop.quit();
            });

    loop.exec();
    return data_string;
}

QMap<QString, QMap<QString, double>> Database::get_data_table_food()
{
    QString url = "https://qtfirebaseintegrationexa-c5807-default-rtdb.firebaseio.com/Food_Table/.json?auth=" + m_idToken;
    QNetworkReply *networkReply = m_networkAccessManaager->get(QNetworkRequest(QUrl(url)));
    QMap<QString, QMap<QString, double>> items_food;

    QEventLoop loop;
    connect(networkReply, &QNetworkReply::finished, [&]()
            {
                if (networkReply->error() == QNetworkReply::NoError)
                {
                    QJsonDocument jsonResponse = QJsonDocument::fromJson(networkReply->readAll());
                    if (!jsonResponse.isNull())
                    {
                        QJsonObject jsonObject = jsonResponse.object();
                        for (const QString& key : jsonObject.keys())
                        {
                            QJsonObject foodItem = jsonObject.value(key).toObject();
                            QMap<QString, double> temp;
                            for (const QString& foodKey : foodItem.keys())
                            {
                                temp.insert(foodKey, foodItem.value(foodKey).toDouble());
                            }
                            items_food.insert(key, temp);
                        }
                    }
                }

                networkReply->deleteLater();
                loop.quit();
            });

    loop.exec();

    // for (auto it = items_food.begin(); it != items_food.end(); ++it)
    // {
    //     qDebug() << it.key();
    //     QMap<QString, double> foodMap = it.value();
    //     for (auto subIt = foodMap.begin(); subIt != foodMap.end(); ++subIt)
    //     {
    //         qDebug() << "           " << subIt.key() << ": " << subIt.value();
    //     }
    // }

    return items_food;
}

void Database::performPOST(const QString &url, const QJsonDocument &payload)
{
    QNetworkRequest newRequest ((QUrl(url)));
    newRequest.setHeader(QNetworkRequest::ContentTypeHeader, QString("application/json"));
    m_networkReply = m_networkAccessManaager->post(newRequest,payload.toJson());
    connect(m_networkReply, &QNetworkReply::readyRead,this,&Database::networkReplyReadyRead);
}

