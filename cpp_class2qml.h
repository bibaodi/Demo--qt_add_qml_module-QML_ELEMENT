#ifndef CPP_CLASS2QML_H
#define CPP_CLASS2QML_H

#include <QtCore/QObject>
#include <QtCore/qglobal.h>
#if QT_VERSION >= 0x050000
#include <QtQml/QQmlEngine>
#else
#endif

class CPP_CLASS2QML : public QObject {
  Q_OBJECT
  QML_ELEMENT
  Q_PROPERTY(int cppValue READ getValue WRITE setValue NOTIFY valueChanged FINAL)
public:
  explicit CPP_CLASS2QML(QObject *parent = nullptr);
  enum Slippiness { Dry, Wet, Icy };
  Q_ENUM(Slippiness)
  int getValue() const;
  void setValue(const int val);
  Q_INVOKABLE void slide(Slippiness slippiness);
signals:
  void valueChanged(const int);

private:
  int m_val;
};

#endif // CPP_CLASS2QML_H
