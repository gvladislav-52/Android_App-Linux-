#ifndef MAIN_NAVI_BAR_H
#define MAIN_NAVI_BAR_H

#include <QObject>

class Main_navi_bar: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> name_navi_bar READ getName_navi_bar WRITE setName_navi_bar NOTIFY name_navi_barChanged FINAL)
    Q_PROPERTY(QVector<QString> path_icon READ getPath_icon WRITE setPath_icon NOTIFY path_iconChanged FINAL)
public:
    Main_navi_bar();
    QVector<QString> getName_navi_bar() const;
    void setName_navi_bar(const QVector<QString> &newName_navi_bar);
    QVector<QString> getPath_icon() const;
    void setPath_icon(const QVector<QString> &newPath_icon);

signals:
    void name_navi_barChanged();
    void path_iconChanged();

private:
    QVector<QString> m_name_navi_bar;
    QVector<QString> m_path_icon;
};

#endif // MAIN_NAVI_BAR_H
