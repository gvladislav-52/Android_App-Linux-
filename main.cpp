#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "statistics_table_widget.h"
#include "nutrition_widget.h"
#include "navigation_menu.h"
#include "account_widget.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Nutrition_widget nutrition_temp;
    Navigation_menu navi_temp;
    Account_widget account_temp;
    qmlRegisterType<statistics_table_widget>("my_statistic_table_qml", 1, 0, "Statistic_object");
    const QUrl url(u"qrc:/main.qml"_qs);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);
    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("Nutriton_temp",&nutrition_temp);
    rootContext->setContextProperty("Navi_temp", &navi_temp);
    rootContext->setContextProperty("Account_temp",&account_temp);
    return app.exec();
}
