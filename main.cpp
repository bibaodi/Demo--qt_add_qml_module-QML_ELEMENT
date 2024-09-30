#include <QtCore/qglobal.h>
#if QT_VERSION >= 0x050000
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#else
#endif
#include <QLoggingCategory>
#include <QtLogging>

#include "bindqmlpropertytocppfunction.h"
#include <QQmlContext>
#include <QtGui>

// if a class derived from QObject define above, then add this `#include "main.moc"`

void insertCppObjToCtx(QQmlApplicationEngine &engine) {
  BindQmlPropertyToCppFunction *myObj = new BindQmlPropertyToCppFunction();
  QQmlContext *ctxt = engine.rootContext();
  ctxt->setContextProperty("BindQmlPropertyToCppFunctionItem", (QObject *)myObj);
}

void setQtLog() {
  QLoggingCategory::setFilterRules(QStringLiteral("qt.qml.binding.removal.info=true"));
  QString msgPattern{"%{if-debug}D%{endif}%{if-info}I%{endif}%{if-warning}W%{endif}"};
  msgPattern.append("%{if-critical}C%{endif}%{if-fatal}F%{endif}QT");
  msgPattern.append("%{time yyMMdd hh:mm:ss.zzzzzz} %{threadid}-%{category}");
  msgPattern.append("[%{file}:%{line}] ");
  msgPattern.append("%{message} ");
  msgPattern.append("<<%{backtrace[depth = 3]}>>");
  qSetMessagePattern(msgPattern);
}

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  insertCppObjToCtx(engine);

  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreationFailed, &app, []() { QCoreApplication::exit(-1); },
      Qt::QueuedConnection);
  engine.loadFromModule("com.mycompany.qmlcomponents", "Main");

  setQtLog();

  return app.exec();
}
