#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "/cygdrive/c/Perl/local64/glfw/include/GLFW/glfw3.h"


MODULE = OpenGL::GLFW		PACKAGE = OpenGL::GLFW		

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
glfwGetMonitors(int &count);

const char*
glfwGetMonitorName(GLFWmonitor* monitor);

void
glfwGetMonitorPhysicalSize(GLFWmonitor* monitor, int &widthMM, int &heightMM);

void
glfwGetMonitorPos(GLFWmonitor* monitor, int &xpos, int &ypos);

void
glfwSetGamma(GLFWmonitor* monitor, float gamma);



const GLFWvidmode*
glfwGetVideoMode(GLFWmonitor* monitor);

const GLFWvidmode*
glfwGetVideoModes(GLFWmonitor* monitor, int &count);

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
glfwGetCursorPos(GLFWwindow* window, double &xpos, double &ypos);

void
glfwGetFramebufferSize(GLFWwindow* window, int &width, int &height);

void
glfwGetWindowFrameSize(GLFWwindow* window, int &left, int &top, int &right, int &bottom);

void
glfwGetWindowPos(GLFWwindow* window, int &xpos, int &ypos);

void
glfwGetWindowSize(GLFWwindow* window, int &width, int &height);

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
glfwGetVersion(int &major, int &minor, int &rev);

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
glfwGetRequiredInstanceExtensions(uint32_t &count);

const float*
glfwGetJoystickAxes(int joy, int &count);

const unsigned char*
glfwGetJoystickButtons(int joy, int &count);

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

