#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#include "setting_widget.h"
#include <QSslSocket>
#include "user.h"
//#include "data_for_observation.h"
#include "my_food.h"
#include "dietary_information.h"
#include "database.h"
#include "table_foods.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //Nutrition_widget nutrition_temp;
    //Main_navi_bar navi_temp;
    My_food my_food_temp;
    //Main_data_management_db db;
    User authHandler;
    //Data_for_observation data_observation;
    Dietary_information deitary;
    setting_widget sa;
    Database db;
    table_foods tab_food;
    //authHandler.setApiKey("AIzaSyAVTdtQ1yZqPUttmzLvDcvw3nAXWPAK7RI");
    //authHandler.signUserIn("start@email.com", "123123123");
    ///////////
    QEventLoop loop;
    db.setApiKey("AIzaSyAVTdtQ1yZqPUttmzLvDcvw3nAXWPAK7RI");
    db.signUserIn("start@email.com", "123123123");
    loop.quit();
    authHandler.use_data_all(db.get_user_data_string("Training"), db.get_user_data_string("Gender"), db.get_user_data_int("Actual_weight"),
                             db.get_user_data_int("Target_weight"), db.get_user_data_int("Age"), db.get_user_data_int("Height"), db.get_email_info(),
                             db.get_user_data_vector_int("Data_","History_weight/Weight"),db.get_user_data_vector_string("Data_","History_weight/Date"),
                             db.get_user_data_vector_int("Data_","History_height/Height"),db.get_user_data_vector_string("Data_","History_height/Date"));
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
    rootContext->setContextProperty("Table_food", &tab_food);
    rootContext->setContextProperty("db", &db);
    engine.load(url);
    //qDebug() << db.get_user_data_int("Actual_weight");
    // QTimer::singleShot(3000,[&db, &authHandler]() {
    //     authHandler.use_data_all(db.get_user_data_string("Training"), db.get_user_data_string("Gender"), db.get_user_data_int("Actual_weight"),
    //                              db.get_user_data_int("Target_weight"), db.get_user_data_int("Age"), db.get_user_data_int("Height"), db.get_email_info(),
    //                              db.get_user_data_vector_int("Data_","History_weight/Weight"),db.get_user_data_vector_string("Data_","History_weight/Date"),
    //                              db.get_user_data_vector_int("Data_","History_height/Height"),db.get_user_data_vector_string("Data_","History_height/Date"));

    //     // authHandler.setTrain_option(db.get_user_data_string("Training"));
    //     // QString gender = db.get_user_data_string("Gender");
    //     // authHandler.setActual_weight(db.get_user_data_int("Actual_weight"));
    //     // authHandler.setTarget_weight(db.get_user_data_int("Target_weight"));
    //     // int age = db.get_user_data_int("Age");
    //     // int height = db.get_user_data_int("Height");
    //     // authHandler.setDrinking_regime((authHandler.getActual_weight()*30)/1000);
    //     // if(gender == "Male")
    //     //         authHandler.setMetabolism(66.5+(13.75*authHandler.getActual_weight())+(5.003*height)-(6.775-age));
    //     //     else if (gender == "Female")
    //     //         authHandler.setMetabolism(655.1+(9.563*authHandler.getActual_weight())+(1.850*height)-(4.676-age));
    //     // authHandler.setIndex_body((static_cast<double>(authHandler.getActual_weight()) / (static_cast<double>(height) * static_cast<double>(height)))*10000);
    //     // authHandler.setTarget_metabolism(authHandler.getMetabolism()*1.5);

    //     // authHandler.setVector_weight(db.get_user_data_vector_int("Data_","History_weight/Weight"));
    //     // authHandler.setVector_data_weight(db.get_user_data_vector_string("Data_","History_weight/Date"));
    //     // authHandler.setVector_height(db.get_user_data_vector_int("Data_","History_height/Height"));
    //     // authHandler.setVector_data_height(db.get_user_data_vector_string("Data_","History_height/Date"));

    //     //authHandler.setEmail_log(db.get_email_info());
    // });
    //
    //db.get_data_table_food();
    //db.add_food_in_schedule("Amount","Day_1",1);
    //db.add_food_in_schedule("Morkov","Day_1",2);
    //db.add_food_in_schedule("Arbuz","Day_2",4);
    tab_food.set_data_food(db.get_data_table_food());
        //qDebug() << db.get_user_data_string("Training");
    tab_food.set_data_schedule(db.get_data_day("AFTERNOON SNACK","Day_1"),db.get_data_day("BREAKFAST","Day_1"),db.get_data_day("DINNER","Day_1"),db.get_data_day("LUNCH","Day_1"),db.get_data_day("SECOND BREAKFAST","Day_1"),db.get_data_day("SECOND DINNER","Day_1"));
    //tab_food.setAfternoon(db.get_data_day("AFTERNOON SNACK","2"));

    return app.exec();
}
