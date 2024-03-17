#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#include "account_widget.h"
#include "schedule_widget.h"
#include "main_navi_bar.h"
#include "main_data_management_db.h"
#include <QSslSocket>
#include "user.h"
#include "data_for_observation.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Nutrition_widget nutrition_temp;
    Main_navi_bar navi_temp;
    Account_widget account_temp;
    //Main_data_management_db db;
    User authHandler;
    Data_for_observation data_observation;

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
    rootContext->setContextProperty("Nutriton_temp", &nutrition_temp);
    rootContext->setContextProperty("Navi_temp", &navi_temp);
    rootContext->setContextProperty("Account_temp", &account_temp);
    rootContext->setContextProperty("Main_logic_temp", &authHandler);
    rootContext->setContextProperty("Data_temp", &data_observation);
    engine.load(url);

    QTimer::singleShot(1000, [&]() {
        for(int i = 0; i < 3; i++)
        {
            data_observation.add_weight(authHandler.getActual_weight());
            data_observation.add_data_weight();
        }
    });

    return app.exec();
}
