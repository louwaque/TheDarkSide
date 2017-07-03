#include "include/installmodestage.h"
#include "include/installstage.h"
#include "include/configmodulesstage.h"

InstallModeStage::InstallModeStage(QObject *parent)
    : AbstractStage(parent),
      m_mode(Mode::Standard)
{}

AbstractStage::Stages InstallModeStage::stage() const
{
    return Stages::InstallMode;
}

InstallModeStage::Mode InstallModeStage::mode() const
{
    return m_mode;
}

void InstallModeStage::setMode(const Mode mode)
{
    if (m_mode != mode) {
        m_mode = mode;
        emit modeChanged();
    }
}

AbstractStage *InstallModeStage::next()
{
    switch (m_mode) {
    case Mode::Standard:
        return new InstallStage(this);
        break;
    case Mode::Customize:
        return new ConfigModulesStage(this);
        break;
    default:
        return nullptr;
        break;
    }
}
