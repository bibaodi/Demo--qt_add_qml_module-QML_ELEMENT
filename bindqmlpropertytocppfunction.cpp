#include "bindqmlpropertytocppfunction.h"

BindQmlPropertyToCppFunction::BindQmlPropertyToCppFunction(QObject *parent) : QObject{parent} {
  changeMe = false;
  myTimer = new QTimer(this);
  myTimer->start(2000);
  connect(myTimer, SIGNAL(timeout()), this, SLOT(testSlot()));
}

QString BindQmlPropertyToCppFunction::getTheChange() {
  if (theValue == 0) {
    return "000The text changed";
  }
  if (theValue == 1) {
    return "111New text change";
  }
  return "nothing has happened yet";
}

void BindQmlPropertyToCppFunction::someFunction(int i) {
  theValue = i;
  emit changeOfStatus(i);
}

void BindQmlPropertyToCppFunction::testSlot() {
  if (changeMe) {
    someFunction(0);
  } else {
    someFunction(1);
  }
  changeMe = !changeMe;
}
