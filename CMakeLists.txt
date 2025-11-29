cmake_minimum_required(VERSION 3.20)

project(kpdfunlock VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# find required Qt and KDE packages
find_package(ECM 5.90.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(ECMSetupVersion)
include(FeatureSummary)

find_package(Qt6 REQUIRED COMPONENTS
    Core
    Widgets
    Quick
    Qml
    QuickControls2
)

find_package(KF6 REQUIRED COMPONENTS
    Kirigami
    I18n
    CoreAddons
)

# source files
set(kpdfunlock_SRCS
    src/main.cpp
    src/resources.qrc
)

# create executable
add_executable(kpdfunlock ${kpdfunlock_SRCS})

target_link_libraries(kpdfunlock
    Qt6::Core
    Qt6::Widgets
    Qt6::Quick
    Qt6::Qml
    Qt6::QuickControls2
    KF6::Kirigami
    KF6::I18n
    KF6::CoreAddons
)

# installation
install(TARGETS kpdfunlock ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES )




























