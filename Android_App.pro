QT       += core gui quickwidgets location network positioning qml quick xml sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    account_widget.cpp \
    main.cpp \
    main_data_management_db.cpp \
    main_navi_bar.cpp \
    schedule_widget.cpp \
    user.cpp

HEADERS += \
    account_widget.h \
    main_data_management_db.h \
    main_navi_bar.h \
    schedule_widget.h \
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
