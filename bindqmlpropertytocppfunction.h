#ifndef BINDQMLPROPERTYTOCPPFUNCTION_H
#define BINDQMLPROPERTYTOCPPFUNCTION_H

#include <QTimer>
#include <QtCore/QObject>
#include <QtCore/qglobal.h>
#include <QtQml/QQmlEngine>
/*
https://wiki.qt.io/How_to_Bind_a_QML_Property_to_a_C%2B%2B_Function#:~:text=In%20this%20article%20we%20will%20show%20how%20to
*/
class BindQmlPropertyToCppFunction : public QObject {
  Q_OBJECT
  QML_ELEMENT
  Q_PROPERTY(QString theChange READ getTheChange NOTIFY changeOfStatus)
public:
  explicit BindQmlPropertyToCppFunction(QObject *parent = nullptr);
  QString getTheChange();
  Q_INVOKABLE void someFunction(int i);

public slots:
  void testSlot();

private:
  bool changeMe;
  int theValue;
  QTimer *myTimer;
signals:
  void changeOfStatus(int i);
};

#endif // BINDQMLPROPERTYTOCPPFUNCTION_H
