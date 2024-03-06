#include "main_data_management_db.h"

Main_data_management_db::Main_data_management_db()
{

    db = QSqlDatabase::addDatabase("QPSQL");
    db.setDatabaseName("app_android");
    db.setUserName("postgres");
    db.setPassword("12345");
    db.setHostName("127.0.0.1");
    if (!db.open())
        qDebug() << QSqlDatabase::drivers();
    else
        qDebug() << "HYU";
}

QVector<QString> Main_data_management_db::weight_db() const
{
    return m_weight_db;
}

void Main_data_management_db::setWeight_db(const QVector<QString> &newWeight_db)
{
    if (m_weight_db == newWeight_db)
        return;
    m_weight_db = newWeight_db;
    emit weight_dbChanged();
}
