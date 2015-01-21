'''Autogenerated by xml_generate script, do not edit!'''
from OpenGL import platform as _p, arrays
# Code generation uses this
from OpenGL.raw.GLX import _types as _cs
# End users want this...
from OpenGL.raw.GLX._types import *
from OpenGL.raw.GLX import _errors
from OpenGL.constant import Constant as _C

import ctypes
_EXTENSION_NAME = 'GLX_SUN_get_transparent_index'
def _f( function ):
    return _p.createFunction( function,_p.PLATFORM.GLX,'GLX_SUN_get_transparent_index',error_checker=_errors._error_checker)

@_f
@_p.types(_cs.Status,ctypes.POINTER(_cs.Display),_cs.Window,_cs.Window,ctypes.POINTER(_cs.long))
def glXGetTransparentIndexSUN(dpy,overlay,underlay,pTransparentIndex):pass
