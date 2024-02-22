#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "QTime"
#include "QTimer"
#include "statistics_table_widget.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

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
    return app.exec();
}
