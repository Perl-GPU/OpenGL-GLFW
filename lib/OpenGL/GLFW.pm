package OpenGL::GLFW;

use 5.010001;
use strict;
use warnings;

do './glfw3_constants';

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use OpenGL::GLFW ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
        glfwCreateCursor
        glfwCreateStandardCursor
        glfwCreateWindow
        glfwDefaultWindowHints
        glfwDestroyCursor
        glfwDestroyWindow
        glfwExtensionSupported
        glfwFocusWindow
        glfwGetClipboardString
        glfwGetCurrentContext
        glfwGetCursorPos
        glfwGetFramebufferSize
        glfwGetGammaRamp
        glfwGetInputMode
        glfwGetJoystickAxes
        glfwGetJoystickButtons
        glfwGetJoystickName
        glfwGetKey
        glfwGetKeyName
        glfwGetMonitorName
        glfwGetMonitorPhysicalSize
        glfwGetMonitorPos
        glfwGetMonitors
        glfwGetMouseButton
        glfwGetPrimaryMonitor
        glfwGetRequiredInstanceExtensions
        glfwGetTime
        glfwGetTimerFrequency
        glfwGetTimerValue
        glfwGetVersion
        glfwGetVersionString
        glfwGetVideoMode
        glfwGetVideoModes
        glfwGetWindowAttrib
        glfwGetWindowFrameSize
        glfwGetWindowMonitor
        glfwGetWindowPos
        glfwGetWindowSize
        glfwGetWindowUserPointer
        glfwHideWindow
        glfwIconifyWindow
        glfwInit
        glfwJoystickPresent
        glfwMakeContextCurrent
        glfwMaximizeWindow
        glfwPollEvents
        glfwPostEmptyEvent
        glfwRestoreWindow
        glfwSetClipboardString
        glfwSetCursor
        glfwSetCursorPos
        glfwSetGamma
        glfwSetGammaRamp
        glfwSetInputMode
        glfwSetTime
        glfwSetWindowAspectRatio
        glfwSetWindowIcon
        glfwSetWindowMonitor
        glfwSetWindowPos
        glfwSetWindowShouldClose
        glfwSetWindowSize
        glfwSetWindowSizeLimits
        glfwSetWindowTitle
        glfwSetWindowUserPointer
        glfwShowWindow
        glfwSwapBuffers
        glfwSwapInterval
        glfwTerminate
        glfwVulkanSupported
        glfwWaitEvents
        glfwWaitEventsTimeout
        glfwWindowHint
        glfwWindowShouldClose
        ) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('OpenGL::GLFW', $VERSION);

# Preloaded methods go here.

1;
__END__

=head1 NAME

OpenGL::GLFW - Perl bindings for the GLFW library

=head1 SYNOPSIS

  use OpenGL::GLFW;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for OpenGL::GLFW, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Chris Marshall, E<lt>chm@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2017 by Chris Marshall, E<lt>chm@cpan.orgE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
