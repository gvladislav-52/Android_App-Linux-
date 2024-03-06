#ifndef MAIN_DATA_MANAGEMENT_DB_H
#define MAIN_DATA_MANAGEMENT_DB_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QtSql>

class Main_data_management_db: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> weight_db READ weight_db WRITE setWeight_db NOTIFY weight_dbChanged FINAL)

public:
    Main_data_management_db();
    QVector<QString> weight_db() const;
    void setWeight_db(const QVector<QString> &newWeight_db);
signals:
    void weight_dbChanged();
private:
    QSqlDatabase db;

    QVector<QString> m_weight_db;
};

#endif // MAIN_DATA_MANAGEMENT_DB_H
