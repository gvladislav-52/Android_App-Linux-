#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#include "setting_widget.h"
#include <QSslSocket>
#include "user.h"
#include "data_for_observation.h"
#include "my_food.h"
#include "dietary_information.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //Nutrition_widget nutrition_temp;
    //Main_navi_bar navi_temp;
    My_food my_food_temp;
    //Main_data_management_db db;
    User authHandler;
    Data_for_observation data_observation;
    Dietary_information deitary;
    setting_widget sa;
    authHandler.setApiKey("AIzaSyAVTdtQ1yZqPUttmzLvDcvw3nAXWPAK7RI");
    authHandler.signUserIn("start@email.com", "123123123");
    qmlRegisterType<setting_widget>("my_statistic_table_qml", 1, 0, "Statistic_object");
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
    rootContext->setContextProperty("sasa", &sa);
    rootContext->setContextProperty("Deitary_temp", &deitary);
    rootContext->setContextProperty("My_food_temp", &my_food_temp);
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
