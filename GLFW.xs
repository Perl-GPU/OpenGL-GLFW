#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "/cygdrive/c/Perl/local64/glfw/include/GLFW/glfw3.h"

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

static SV * errorfunsv    = (SV*)0;
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

    call_sv(errorfunsv, G_VOID);

    SPAGAIN;

    FREETMPS;
    LEAVE;

}

static SV * monitorfunsv  = (SV*)0;
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

    call_sv(monitorfunsv, G_VOID);

    SPAGAIN;

    FREETMPS;
    LEAVE;

}

static SV * joystickfunsv = (SV*)0;
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

    call_sv(joystickfunsv, G_VOID);

    SPAGAIN;

    FREETMPS;
    LEAVE;

}

MODULE = OpenGL::GLFW           PACKAGE = OpenGL::GLFW

SV*
glfwSetErrorCallback(cbfun)
     SV * cbfun
   CODE:
     // Need to add wrapper cb that calls the perl CV
     RETVAL = errorfunsv;
     if (errorfunsv == (SV*)0) {
     	errorfunsv = newSVsv(cbfun);
     } else {
        SvSetSV(errorfunsv, cbfun);
     }
     // Enable the C wrapper errorfun callback
     glfwSetErrorCallback(errorfun_callback);
   OUTPUT:
     RETVAL

SV*
glfwSetMonitorCallback(cbfun)
     SV * cbfun
   CODE:
     // Need to add wrapper cb that calls the perl CV
     RETVAL = monitorfunsv;
     if (monitorfunsv == (SV*)0) {
     	monitorfunsv = newSVsv(cbfun);
     } else {
        SvSetSV(monitorfunsv, cbfun);
     }
     // Enable the C wrapper errorfun callback
     glfwSetMonitorCallback(monitorfun_callback);
   OUTPUT:
     RETVAL

SV*
glfwSetJoystickCallback(cbfun)
     SV * cbfun
   CODE:
     // Need to add wrapper cb that calls the perl CV
     RETVAL = joystickfunsv;
     if (joystickfunsv == (SV*)0) {
     	joystickfunsv = newSVsv(cbfun);
     } else {
        SvSetSV(joystickfunsv, cbfun);
     }
     // Enable the C wrapper errorfun callback
     glfwSetJoystickCallback(joystickfun_callback);
   OUTPUT:
     RETVAL

void
glfwSetWindowIcon(GLFWwindow* window, int count, const GLFWimage* images);

## /* GLFWcursor routines */
GLFWcursor*
glfwCreateCursor(const GLFWimage* image, int xhot, int yhot);

GLFWcursor*
glfwCreateStandardCursor(int shape);

void
glfwDestroyCursor(GLFWcursor* cursor);

void
glfwSetCursor(GLFWwindow* window, GLFWcursor* cursor);

## /* GLFWmonitor routines */
GLFWmonitor*
glfwGetPrimaryMonitor();

GLFWmonitor**
glfwGetMonitors(count)
        int &count = NO_INIT
    OUTPUT:
        count

const char*
glfwGetMonitorName(GLFWmonitor* monitor);

void
glfwGetMonitorPhysicalSize(monitor, widthMM, heightMM)
        GLFWmonitor* monitor
        int &widthMM = NO_INIT
        int &heightMM = NO_INIT
    OUTPUT:
        widthMM
        heightMM

void
glfwGetMonitorPos(monitor, xpos, ypos)
        GLFWmonitor* monitor
        int &xpos = NO_INIT
        int &ypos = NO_INIT
    OUTPUT:
        xpos
        ypos

void
glfwSetGamma(GLFWmonitor* monitor, float gamma);



const GLFWvidmode*
glfwGetVideoMode(GLFWmonitor* monitor);

const GLFWvidmode*
glfwGetVideoModes(monitor, count)
        GLFWmonitor* monitor
        int &count = NO_INIT
    OUTPUT:
        count

## /* GLFWmonitor with GLFWwindow routines */
GLFWmonitor*
glfwGetWindowMonitor(GLFWwindow* window);

GLFWwindow*
glfwCreateWindow(int width, int height, const char* title, GLFWmonitor* monitor, GLFWwindow* share);

void
glfwSetWindowMonitor(GLFWwindow* window, GLFWmonitor* monitor, int xpos, int ypos, int width, int height, int refreshRate);

## /* GLFWwindow routines */
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
glfwGetCursorPos(window, xpos, ypos)
     GLFWwindow* window
     double &xpos = NO_INIT
     double &ypos = NO_INIT
   OUTPUT:
     xpos
     ypos

void
glfwGetFramebufferSize(window, width, height)
     GLFWwindow* window
     int &width = NO_INIT
     int &height = NO_INIT
   OUTPUT:
     width
     height

void
glfwGetWindowFrameSize(window, left, top, right, bottom)
     GLFWwindow* window
     int &left = NO_INIT
     int &top = NO_INIT
     int &right = NO_INIT
     int &bottom = NO_INIT
   OUTPUT:
     left
     top
     right
     bottom

void
glfwGetWindowPos(window, xpos, ypos)
     GLFWwindow* window
     int &xpos = NO_INIT
     int &ypos = NO_INIT
   OUTPUT:
     xpos
     ypos

void
glfwGetWindowSize(window, width, height)
     GLFWwindow* window
     int &width = NO_INIT
     int &height = NO_INIT
   OUTPUT:
     width
     height

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

## /* Standard types routines */
void
glfwDefaultWindowHints();

void
glfwGetVersion(major, minor, rev)
     int &major = NO_INIT
     int &minor = NO_INIT
     int &rev   = NO_INIT
   OUTPUT:
     major
     minor
     rev

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

const char**
glfwGetRequiredInstanceExtensions(count)
     uint32_t &count = NO_INIT
   OUTPUT:
     count

const float*
glfwGetJoystickAxes(joy, count)
     int joy
     int &count = NO_INIT
   OUTPUT:
     count

const unsigned char*
glfwGetJoystickButtons(joy, count)
     int joy
     int &count = NO_INIT
   OUTPUT:
     count

int
glfwExtensionSupported(const char* extension);

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

## /* Return false until someone with Vulkan can implement */
int
glfwVulkanSupported();

const GLFWgammaramp*
glfwGetGammaRamp(GLFWmonitor* monitor);

void
glfwSetGammaRamp(GLFWmonitor* monitor, const GLFWgammaramp* ramp);

