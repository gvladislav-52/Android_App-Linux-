QT       += core gui quickwidgets location network positioning qml quick xml sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    account_widget.cpp \
    header_widget.cpp \
    main.cpp \
    navigation_menu.cpp \
    nutrition_widget.cpp \
    statistics_table_widget.cpp

HEADERS += \
    account_widget.h \
    header_widget.h \
    navigation_menu.h \
    nutrition_widget.h \
    statistics_table_widget.h

FORMS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    res.qrc

DISTFILES +=
