#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "account_widget.h"
#include "schedule_widget.h"
#include "main_navi_bar.h"
#include "main_data_management_db.h"
#include <QSslSocket>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Nutrition_widget nutrition_temp;
    Main_navi_bar navi_temp;
    Account_widget account_temp;
    Main_data_management_db db;
    Main_data_management_db authHandler;

    authHandler.setApiKey("AIzaSyAVTdtQ1yZqPUttmzLvDcvw3nAXWPAK7RI");
    authHandler.signUserIn("start@email.com", "123123123");
    qmlRegisterType<Schedule_widget>("my_statistic_table_qml", 1, 0, "Statistic_object");
    const QUrl url(u"qrc:/Main_files/Main.qml"_qs);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("Nutriton_temp",&nutrition_temp);
    rootContext->setContextProperty("Navi_temp", &navi_temp);
    rootContext->setContextProperty("Account_temp",&account_temp);
    rootContext->setContextProperty("Main_logic_temp",& authHandler);
    engine.load(url);

    qDebug() << "My build Version String is - "
             << QSslSocket::sslLibraryBuildVersionString()
             << "  "
                " and version string is  "
             << QSslSocket::sslLibraryVersionString();
    qDebug() << "Device supports OpenSSL: " << QSslSocket::supportsSsl();
    return app.exec();
}
