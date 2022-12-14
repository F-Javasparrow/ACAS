// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX  x
#define PREFIX      acas

#define MAJOR       1
#define MINOR       0
#define PATCHLVL    0
#define BUILD       0

#define VERSION     MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR  MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION      0.1.0.0
#define REQUIRED_CBA_VERSION  {3,8,0}

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME    QUOTE(ACAS - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME    QUOTE(ACAS - COMPONENT)
#endif
