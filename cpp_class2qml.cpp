#include "cpp_class2qml.h"

CPP_CLASS2QML::CPP_CLASS2QML(QObject *parent) : QObject{parent} {}

int CPP_CLASS2QML::getValue() const { return m_val; }

void CPP_CLASS2QML::setValue(const int val) {
  m_val = val;
  Q_EMIT valueChanged(val);
}

void CPP_CLASS2QML::slide(Slippiness slippiness) { m_val = static_cast<int>(slippiness); }
