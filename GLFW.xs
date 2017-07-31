#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "/cygdrive/c/Perl/local64/glfw/include/GLFW/glfw3.h"

#include <stdio.h>

// AV index values for callbacks which are stored as an *AV
// in the GLFW user pointer.  The first element of the array
// is used to hold the user pointer (a.k.a. perl user ref).
//
enum AVindex {
    userpointer = 0,
    charfun,
    charmodsfun,
    cursorenterfun,
    cursorposfun,
    dropfun,
    framebuffersizefun,
    keyfun,
    mousebuttonfun,
    scrollfun,
    windowclosefun,
    windowfocusfun,
    windowiconifyfun,
    windowposfun,
    windowrefreshfun,
    windowsizefun,
    AVlen
};

//----------------------------------------------------------------
// Global callbacks
//----------------------------------------------------------------
static SV * errorfunsv    = (SV*) NULL;
void errorfun_callback(int error, const char* description)
{
    dTHX;

    dSP;

    ENTER;
    SAVETMPS;
    PUSHMARK(SP);

    XPUSHs(sv_2mortal(newSViv(error)));
    XPUSHs(sv_2mortal(newSVpv(description, 0)));

    PUTBACK;

    if ( SvOK(errorfunsv) ) {
       call_sv(errorfunsv, G_VOID);
    }

    SPAGAIN;

    FREETMPS;
    LEAVE;

}

static SV * monitorfunsv  = (SV*) NULL;
void monitorfun_callback(GLFWmonitor* monitor, int event)
{
    dTHX;

    dSP;

    ENTER;
    SAVETMPS;
    PUSHMARK(SP);

    XPUSHs(sv_2mortal(newSViv(PTR2IV(monitor))));
    XPUSHs(sv_2mortal(newSViv(event)));

    PUTBACK;

    if ( SvOK(monitorfunsv) ) {
       call_sv(monitorfunsv, G_VOID);
    }

    SPAGAIN;

    FREETMPS;
    LEAVE;

}

static SV * joystickfunsv = (SV*) NULL;
void joystickfun_callback(int joy_id, int event)
{
    dTHX;

    dSP;

    ENTER;
    SAVETMPS;
    PUSHMARK(SP);

    XPUSHs(sv_2mortal(newSViv(joy_id)));
    XPUSHs(sv_2mortal(newSViv(event)));

    PUTBACK;

    if ( SvOK(joystickfunsv) ) {
       call_sv(joystickfunsv, G_VOID);
    }

    SPAGAIN;

    FREETMPS;
    LEAVE;

}

//----------------------------------------------------------------
// Per-window callbacks
//
// The per-window callbacks are stored in a perl array
// whose reference is kept in the User Pointer.
//----------------------------------------------------------------

// (* GLFWcharfun)(GLFWwindow*,unsigned int);
void charfun_callback (GLFWwindow* window, GLFWcharfun cbfun)
{ 
}

// (* GLFWcharmodsfun)(GLFWwindow*,unsigned int,int);
void charmodsfun_callback (GLFWwindow* window, GLFWcharmodsfun cbfun)
{ 
}

// (* GLFWcursorenterfun)(GLFWwindow*,int);
void cursorenterfun_callback (GLFWwindow* window, GLFWcursorenterfun cbfun)
{ 
}

// (* GLFWcursorposfun)(GLFWwindow*,double,double);
void cursorposfun_callback (GLFWwindow* window, GLFWcursorposfun cbfun)
{ 
}

// (* GLFWdropfun)(GLFWwindow*,int,const char**);
void dropfun_callback (GLFWwindow* window, GLFWdropfun cbfun)
{ 
}

// (* GLFWframebuffersizefun)(GLFWwindow*,int,int);
void framebuffersizefun_callback (GLFWwindow* window, GLFWframebuffersizefun cbfun)
{ 
}

// void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods)
void keyfun_callback(GLFWwindow* window, int key, int scancode, int action, int mods)
{ 
    dTHX;

    dSP;

    AV* winav;
    enum AVindex cvind = keyfun;
    SV** fetch;
    SV* keyfunsv;

    if (winav == (AV*) NULL)
       croak("keyfun_callback: winav is NULL");

    fetch = av_fetch(winav, cvind, 0);

    if (! fetch)
       croak("keyfun_callback: winav[keyfun] is NULL");

    keyfunsv = *fetch;

    ENTER;
    SAVETMPS;
    PUSHMARK(SP);

    XPUSHs(sv_2mortal(newSViv(PTR2IV(window))));
    XPUSHs(sv_2mortal(newSViv(key)));
    XPUSHs(sv_2mortal(newSViv(scancode)));
    XPUSHs(sv_2mortal(newSViv(action)));
    XPUSHs(sv_2mortal(newSViv(mods)));

    PUTBACK;

    call_sv(keyfunsv, G_VOID);

    SPAGAIN;

    FREETMPS;
    LEAVE;
}

// (* GLFWmousebuttonfun)(GLFWwindow*,int,int,int);
void mousebuttonfun_callback (GLFWwindow* window, GLFWmousebuttonfun cbfun)
{ 
}

// (* GLFWscrollfun)(GLFWwindow*,double,double);
void scrollfun_callback (GLFWwindow* window, GLFWscrollfun cbfun)
{ 
}

// (* GLFWwindowclosefun)(GLFWwindow*);
void windowclosefun_callback (GLFWwindow* window, GLFWwindowclosefun cbfun)
{ 
}

// (* GLFWwindowfocusfun)(GLFWwindow*,int);
void windowfocusfun_callback (GLFWwindow* window, GLFWwindowfocusfun cbfun)
{ 
}

// (* GLFWwindowiconifyfun)(GLFWwindow*,int);
void windowiconifyfun_callback (GLFWwindow* window, GLFWwindowiconifyfun cbfun)
{ 
}

// (* GLFWwindowposfun)(GLFWwindow*,int,int);
void windowposfun_callback (GLFWwindow* window, GLFWwindowposfun cbfun)
{ 
}

// (* GLFWwindowrefreshfun)(GLFWwindow*);
void windowrefreshfun_callback (GLFWwindow* window, GLFWwindowrefreshfun cbfun)
{ 
}

// (* GLFWwindowsizefun)(GLFWwindow*,int,int);
void windowsizefun_callback (GLFWwindow* window, GLFWwindowsizefun cbfun)
{ 
}


MODULE = OpenGL::GLFW           PACKAGE = OpenGL::GLFW


#//----------------------------------------------------
#// Set Per-window callbacks
#//----------------------------------------------------

#// SV*
#// glfwSetWindowPosCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun


#// SV*
#// glfwSetWindowSizeCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetWindowCloseCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetWindowRefreshCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetWindowFocusCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetWindowIconifyCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetFramebufferSizeCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// want SV*
void
glfwSetKeyCallback(window, cbfun);
      GLFWwindow* window
      SV * cbfun
   CODE:
     // Get user pointer
     // Allocate AV if NULL
     // Populate with NULL SV*s
     //
     // If AV exists, fetch element keyfun
     // If keyfun is NULL, then save cbfun there
     // Otherwise set the SV there to the new cbfun
     // 
     if (errorfunsv == (SV*) NULL) {
        errorfunsv = newSVsv(cbfun);
     } else {
        SvSetSV(errorfunsv, cbfun);
     }
     // Enable the C wrapper keyfun callback
     glfwSetKeyCallback(window, keyfun_callback);


#// SV*
#// glfwSetCharCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetCharModsCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetMouseButtonCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetCursorPosCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetCursorEnterCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetScrollCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun

#// SV*
#// glfwSetDropCallback(window, cbfun);
#//       GLFWwindow* window
#//       SV * cbfun


#//----------------------------------------------------
#// Set Global callbacks
#//----------------------------------------------------

#// want to return SV*
void
glfwSetErrorCallback(cbfun)
     SV * cbfun
   CODE:
     // Need to fix return of previous CV
     // which was causing a segfault in re.pl
     //
     if (errorfunsv == (SV*) NULL) {
        errorfunsv = newSVsv(cbfun);
     } else {
        SvSetSV(errorfunsv, cbfun);
     }
     // Enable the C wrapper errorfun callback
     glfwSetErrorCallback(errorfun_callback);

#// want to return SV*
void
glfwSetMonitorCallback(cbfun)
     SV * cbfun
   CODE:
     // Need to fix return of previous CV
     // which was causing a segfault in re.pl
     //
     if (monitorfunsv == (SV*) NULL) {
        monitorfunsv = newSVsv(cbfun);
     } else {
        SvSetSV(monitorfunsv, cbfun);
     }
     // Enable the C wrapper errorfun callback
     glfwSetMonitorCallback(monitorfun_callback);

#// want to return SV*
void
glfwSetJoystickCallback(cbfun)
     SV * cbfun
   CODE:
     // Need to fix return of previous CV
     // which was causing a segfault in re.pl
     //
     if (joystickfunsv == (SV*) NULL) {
        joystickfunsv = newSVsv(cbfun);
     } else {
        SvSetSV(joystickfunsv, cbfun);
     }
     // Enable the C wrapper errorfun callback
     glfwSetJoystickCallback(joystickfun_callback);


#//-------------------------------------------------------------------
#// Uses GLFWimage
#//-------------------------------------------------------------------
void
glfwSetWindowIcon(GLFWwindow* window, int count, const GLFWimage* images);

#//-------------------------------------------------------------------
#// GLFWcursor routines
#//-------------------------------------------------------------------
GLFWcursor*
glfwCreateCursor(const GLFWimage* image, int xhot, int yhot);

GLFWcursor*
glfwCreateStandardCursor(int shape);

void
glfwDestroyCursor(GLFWcursor* cursor);

void
glfwSetCursor(GLFWwindow* window, GLFWcursor* cursor);

#//-------------------------------------------------------------------
#// GLFWmonitor routines
#//-------------------------------------------------------------------
GLFWmonitor*
glfwGetPrimaryMonitor();

GLFWmonitor**
glfwGetMonitors(OUTLIST int count);

const char*
glfwGetMonitorName(GLFWmonitor* monitor);

void
glfwGetMonitorPhysicalSize(GLFWmonitor* monitor, OUTLIST int widthMM, OUTLIST int heightMM);

void
glfwGetMonitorPos(GLFWmonitor* monitor, OUTLIST int xpos, OUTLIST int ypos);


void
glfwSetGamma(GLFWmonitor* monitor, float gamma);

const GLFWgammaramp*
glfwGetGammaRamp(GLFWmonitor* monitor);

void
glfwSetGammaRamp(GLFWmonitor* monitor, const GLFWgammaramp* ramp);


const GLFWvidmode*
glfwGetVideoMode(GLFWmonitor* monitor);

const GLFWvidmode*
glfwGetVideoModes(GLFWmonitor* monitor, OUTLIST int count);

#//-------------------------------------------------------------------
#// GLFWmonitor with GLFWwindow routines
#//-------------------------------------------------------------------
GLFWmonitor*
glfwGetWindowMonitor(GLFWwindow* window);

GLFWwindow*
glfwCreateWindow(int width, int height, const char* title, GLFWmonitor* monitor, GLFWwindow* share);

void
glfwSetWindowMonitor(GLFWwindow* window, GLFWmonitor* monitor, int xpos, int ypos, int width, int height, int refreshRate);

#//-------------------------------------------------------------------
#// GLFWwindow routines
#//-------------------------------------------------------------------
GLFWwindow*
glfwGetCurrentContext();

int
glfwGetInputMode(GLFWwindow* window, int mode);

int
glfwGetKey(GLFWwindow* window, int key);

int
glfwGetMouseButton(GLFWwindow* window, int button);

int
glfwGetWindowAttrib(GLFWwindow* window, int attrib);

int
glfwWindowShouldClose(GLFWwindow* window);

void
glfwDestroyWindow(GLFWwindow* window);

void
glfwFocusWindow(GLFWwindow* window);

const char*
glfwGetClipboardString(GLFWwindow* window);

void
glfwGetCursorPos(GLFWwindow* window, OUTLIST double xpos, OUTLIST double ypos);

void
glfwGetFramebufferSize(GLFWwindow* window, OUTLIST int width, OUTLIST int height);

void
glfwGetWindowFrameSize(GLFWwindow* window, OUTLIST int left, OUTLIST int top, OUTLIST int right, OUTLIST int bottom);

void
glfwGetWindowPos(GLFWwindow* window, OUTLIST int xpos, OUTLIST int ypos);

void
glfwGetWindowSize(GLFWwindow* window, OUTLIST int width, OUTLIST int height);

void
glfwHideWindow(GLFWwindow* window);

void
glfwIconifyWindow(GLFWwindow* window);

void
glfwMakeContextCurrent(GLFWwindow* window);

void
glfwMaximizeWindow(GLFWwindow* window);

void
glfwRestoreWindow(GLFWwindow* window);

void
glfwSetClipboardString(GLFWwindow* window, const char* string);

void
glfwSetCursorPos(GLFWwindow* window, double xpos, double ypos);

void
glfwSetInputMode(GLFWwindow* window, int mode, int value);

void
glfwSetWindowAspectRatio(GLFWwindow* window, int numer, int denom);

void
glfwSetWindowPos(GLFWwindow* window, int xpos, int ypos);

void
glfwSetWindowShouldClose(GLFWwindow* window, int value);

void
glfwSetWindowSize(GLFWwindow* window, int width, int height);

void
glfwSetWindowSizeLimits(GLFWwindow* window, int minwidth, int minheight, int maxwidth, int maxheight);

void
glfwSetWindowTitle(GLFWwindow* window, const char* title);

void
glfwSetWindowUserPointer(GLFWwindow* window, void* pointer);

void
glfwShowWindow(GLFWwindow* window);

void
glfwSwapBuffers(GLFWwindow* window);

void*
glfwGetWindowUserPointer(GLFWwindow* window);

#//-------------------------------------------------------------------
#// Standard types routines
#//-------------------------------------------------------------------
void
glfwDefaultWindowHints();

void
glfwGetVersion(OUTLIST int major, OUTLIST int minor, OUTLIST int rev);

void
glfwPollEvents();

void
glfwPostEmptyEvent();

void
glfwSetTime(double time);

void
glfwSwapInterval(int interval);

void
glfwTerminate();

void
glfwWaitEvents();

void
glfwWaitEventsTimeout(double timeout);

void
glfwWindowHint(int hint, int value);

const char*
glfwGetJoystickName(int joy);

const char*
glfwGetKeyName(int key, int scancode);

const char*
glfwGetVersionString();

const float*
glfwGetJoystickAxes(int joy, OUTLIST int count);

const unsigned char*
glfwGetJoystickButtons(int joy, OUTLIST int count);

int
glfwInit();

int
glfwJoystickPresent(int joy);

double
glfwGetTime();

uint64_t
glfwGetTimerFrequency();

uint64_t
glfwGetTimerValue();

#//-------------------------------------------------------------------
#// OpenGL not supported (use GLEW)
#//-------------------------------------------------------------------
int
glfwExtensionSupported(const char* extension);
   CODE:
     croak("glfwExtensionSupported not implemented (use glewIsSupported)");

void
glfwGetProcAddress(const char* procname);
   CODE:
     croak("glfwGetProcAddress not implemented (use GLEW)");

#//-------------------------------------------------------------------
#// Vulkan not supported
#//-------------------------------------------------------------------
int
glfwVulkanSupported();
   CODE:
     RETVAL = 0;
   OUTPUT:
     RETVAL

void
glfwGetRequiredInstanceExtensions(...)
   CODE:
     croak("No Vulkan Support: glfwGetRequiredInstanceExtensions not implemented!");

void
glfwGetInstanceProcAddress(...)
   CODE:
     croak("No Vulkan Support: glfwGetInstanceProcAddress not implemented!");

void
glfwGetPhysicalDevicePresentationSupport(...)
   CODE:
     croak("No Vulkan Support: glfwGetPhysicalDevicePresentationSupport not implemented!");

void
glfwCreateWindowSurface(...)
   CODE:
     croak("No Vulkan Support: glfwCreateWindowSurface not implemented!");
