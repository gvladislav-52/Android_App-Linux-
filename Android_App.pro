QT       += core gui quickwidgets location network positioning qml quick xml sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    data_for_observation.cpp \
    database.cpp \
    dietary_information.cpp \
    main.cpp \
    my_food.cpp \
    recipe.cpp \
    setting_widget.cpp \
    table_foods.cpp \
    user.cpp

HEADERS += \
    data_for_observation.h \
    database.h \
    dietary_information.h \
    my_food.h \
    recipe.h \
    setting_widget.h \
    table_foods.h \
    user.h

FORMS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    res.qrc

DISTFILES +=

include(android_openssl/openssl.pri)
