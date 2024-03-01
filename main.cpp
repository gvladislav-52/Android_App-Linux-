#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "account_widget.h"
#include "schedule_widget.h"
#include "main_navi_bar.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Nutrition_widget nutrition_temp;
    Main_navi_bar navi_temp;
    Account_widget account_temp;
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
    engine.load(url);
    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("Nutriton_temp",&nutrition_temp);
    rootContext->setContextProperty("Navi_temp", &navi_temp);
    rootContext->setContextProperty("Account_temp",&account_temp);
    return app.exec();
}
