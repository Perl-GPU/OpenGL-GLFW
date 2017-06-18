/* This file is the standard, glfw3.h include from the
 * GLFW 3.2.1 distribution with the Doxygen documentation
 * stripped out for brevity and clarity
 */

typedef struct GLFWmonitor GLFWmonitor;  /* opaque */
typedef struct GLFWwindow GLFWwindow;    /* opaque */
typedef struct GLFWcursor GLFWcursor;    /* opaque */

/* Use GLEW for now instead of these */
typedef void (*GLFWglproc)(void);
typedef void (*GLFWvkproc)(void); /* Vulkan not supported at this time */

/* These are global callbacks, only need one instance */
typedef void (* GLFWerrorfun)(int,const char*);
typedef void (* GLFWjoystickfun)(int,int);
typedef void (* GLFWmonitorfun)(GLFWmonitor*,int);

/* Per-window callbacks (use AV in user pointer */
typedef void (* GLFWwindowclosefun)(GLFWwindow*);
typedef void (* GLFWwindowrefreshfun)(GLFWwindow*);
typedef void (* GLFWwindowfocusfun)(GLFWwindow*,int);
typedef void (* GLFWwindowiconifyfun)(GLFWwindow*,int);
typedef void (* GLFWcursorenterfun)(GLFWwindow*,int);
typedef void (* GLFWcharfun)(GLFWwindow*,unsigned int);
typedef void (* GLFWwindowposfun)(GLFWwindow*,int,int);
typedef void (* GLFWwindowsizefun)(GLFWwindow*,int,int);
typedef void (* GLFWframebuffersizefun)(GLFWwindow*,int,int);
typedef void (* GLFWdropfun)(GLFWwindow*,int,const char**);
typedef void (* GLFWcharmodsfun)(GLFWwindow*,unsigned int,int);
typedef void (* GLFWcursorposfun)(GLFWwindow*,double,double);
typedef void (* GLFWscrollfun)(GLFWwindow*,double,double);
typedef void (* GLFWmousebuttonfun)(GLFWwindow*,int,int,int);
typedef void (* GLFWkeyfun)(GLFWwindow*,int,int,int,int);

/* How to implement, use GLEW and OpenGL::Modern for now*/
GLFWglproc glfwGetProcAddress(const char* procname);

/* Global callbacks */
GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun cbfun);
GLFWjoystickfun glfwSetJoystickCallback(GLFWjoystickfun cbfun);
GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun cbfun);

/* Window input event callbacks */
GLFWcharfun glfwSetCharCallback(GLFWwindow* window, GLFWcharfun cbfun);
GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow* window, GLFWcharmodsfun cbfun);
GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow* window, GLFWcursorenterfun cbfun);
GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow* window, GLFWcursorposfun cbfun);
GLFWdropfun glfwSetDropCallback(GLFWwindow* window, GLFWdropfun cbfun);
GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* window, GLFWframebuffersizefun cbfun);
GLFWkeyfun glfwSetKeyCallback(GLFWwindow* window, GLFWkeyfun cbfun);
GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow* window, GLFWmousebuttonfun cbfun);
GLFWscrollfun glfwSetScrollCallback(GLFWwindow* window, GLFWscrollfun cbfun);
GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* window, GLFWwindowclosefun cbfun);
GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* window, GLFWwindowfocusfun cbfun);
GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* window, GLFWwindowiconifyfun cbfun);
GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* window, GLFWwindowposfun cbfun);
GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* window, GLFWwindowrefreshfun cbfun);
GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* window, GLFWwindowsizefun cbfun);

/* GLFWimage struct and routines */
typedef struct GLFWimage
{
    int width;
    int height;
    unsigned char* pixels;
} GLFWimage;

void
glfwSetWindowIcon(GLFWwindow* window, int count, const GLFWimage* images);

/* GLFWcursor routines */
GLFWcursor*
glfwCreateCursor(const GLFWimage* image, int xhot, int yhot);

GLFWcursor*
glfwCreateStandardCursor(int shape);

void
glfwDestroyCursor(GLFWcursor* cursor);

void
glfwSetCursor(GLFWwindow* window, GLFWcursor* cursor);

/* GLFWmonitor routines */
GLFWmonitor*
glfwGetPrimaryMonitor(void);

GLFWmonitor**
glfwGetMonitors(int* count);

const char*
glfwGetMonitorName(GLFWmonitor* monitor);

void
glfwGetMonitorPhysicalSize(GLFWmonitor* monitor, int* widthMM, int* heightMM);

void
glfwGetMonitorPos(GLFWmonitor* monitor, int* xpos, int* ypos);

void
glfwSetGamma(GLFWmonitor* monitor, float gamma);

/* GLFWmonitor with GLFWgammaramp routines */
typedef struct GLFWgammaramp
{
    unsigned short* red;
    unsigned short* green;
    unsigned short* blue;
    unsigned int size;
} GLFWgammaramp;

const GLFWgammaramp*
glfwGetGammaRamp(GLFWmonitor* monitor);

void
glfwSetGammaRamp(GLFWmonitor* monitor, const GLFWgammaramp* ramp);

/* GLFWmonitor with GLFWvidmode routines */
typedef struct GLFWvidmode
{
    int width;
    int height;
    int redBits;
    int greenBits;
    int blueBits;
    int refreshRate;
} GLFWvidmode;

const GLFWvidmode*
glfwGetVideoMode(GLFWmonitor* monitor);

const GLFWvidmode*
glfwGetVideoModes(GLFWmonitor* monitor, int* count);

/* GLFWmonitor with GLFWwindow routines */
GLFWmonitor*
glfwGetWindowMonitor(GLFWwindow* window);

GLFWwindow*
glfwCreateWindow(int width, int height, const char* title, GLFWmonitor* monitor, GLFWwindow* share);

void
glfwSetWindowMonitor(GLFWwindow* window, GLFWmonitor* monitor, int xpos, int ypos, int width, int height, int refreshRate);

/* GLFWwindow routines */
GLFWwindow*
glfwGetCurrentContext(void);

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
glfwGetCursorPos(GLFWwindow* window, double* xpos, double* ypos);

void
glfwGetFramebufferSize(GLFWwindow* window, int* width, int* height);

void
glfwGetWindowFrameSize(GLFWwindow* window, int* left, int* top, int* right, int* bottom);

void
glfwGetWindowPos(GLFWwindow* window, int* xpos, int* ypos);

void
glfwGetWindowSize(GLFWwindow* window, int* width, int* height);

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

/* Standard types routines */
void
glfwDefaultWindowHints(void);

void
glfwGetVersion(int* major, int* minor, int* rev);

void
glfwPollEvents(void);

void
glfwPostEmptyEvent(void);

void
glfwSetTime(double time);

void
glfwSwapInterval(int interval);

void
glfwTerminate(void);

void
glfwWaitEvents(void);

void
glfwWaitEventsTimeout(double timeout);

void
glfwWindowHint(int hint, int value);

const char*
glfwGetJoystickName(int joy);

const char*
glfwGetKeyName(int key, int scancode);

const char*
glfwGetVersionString(void);

const char**
glfwGetRequiredInstanceExtensions(uint32_t* count);

const float*
glfwGetJoystickAxes(int joy, int* count);

const unsigned char*
glfwGetJoystickButtons(int joy, int* count);

int
glfwExtensionSupported(const char* extension);

int
glfwInit(void);

int
glfwJoystickPresent(int joy);

double
glfwGetTime(void);

uint64_t
glfwGetTimerFrequency(void);

uint64_t
glfwGetTimerValue(void);

/* Return false until someone with Vulkan can implement */
int
glfwVulkanSupported(void);

/*
 * #if defined(VK_VERSION_1_0) 
 * GLFWAPI GLFWvkproc glfwGetInstanceProcAddress(VkInstance instance, const char* procname);
 * GLFWAPI int glfwGetPhysicalDevicePresentationSupport(VkInstance instance, VkPhysicalDevice device, uint32_t queuefamily);
 * GLFWAPI VkResult glfwCreateWindowSurface(VkInstance instance, GLFWwindow* window, const VkAllocationCallbacks* allocator, VkSurfaceKHR* surface);
 * #endif
 */
