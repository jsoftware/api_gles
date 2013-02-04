coclass 'jgles'

3 : 0''
if. UNAME-:'Win' do.
  libgles=: <'opengl32.dll'
  OBJ_BITMAP=: 7
  SRCCOPY=: 16bcc0020
  SIZEBITMAP=: 24
  DIB_RGB_COLORS=: 0

  BitBlt=: 'gdi32 BitBlt i x i i i i x i i i'&(15!:0)
  ChoosePixelFormat=: 'gdi32 ChoosePixelFormat > i x *c'&(15!:0)
  CreateCompatibleBitmap=: 'gdi32 CreateCompatibleBitmap > x x i i'&(15!:0)
  CreateCompatibleDC=: 'gdi32 CreateCompatibleDC > x x'&(15!:0)
  CreateDIBSection=: 'gdi32 CreateDIBSection x x *c i *x x i'&(15!:0)
  CreateFont=: 'gdi32 CreateFontA x i i i i i i i i i i i i i *c'&(15!:0)
  DeleteDC=: 'gdi32 DeleteDC > i x'&(15!:0)
  ResetDC=: 'gdi32 ResetDC > i x'&(15!:0)
  DeleteObject=: 'gdi32 DeleteObject > i x'&(15!:0)
  GetCurrentObject=: 'gdi32 GetCurrentObject > x x i'&(15!:0)
  GetObject=: 'gdi32 GetObjectW > i x i x'&(15!:0)
  GetDC=: 'user32 GetDC > x x'&(15!:0)
  ReleaseDC=: 'user32 ReleaseDC > i x x'&(15!:0)
  SelectObject=: 'gdi32 SelectObject > x x x'&(15!:0)
  SetPixelFormat=: 'gdi32 SetPixelFormat > i x i *c'&(15!:0)
  SwapBuffers=: 'gdi32 SwapBuffers > i x'&(15!:0)

  wglCreateContext=: 'opengl32.dll wglCreateContext > x x'&(15!:0)
  wglDeleteContext=: 'opengl32.dll wglDeleteContext > i x'&(15!:0)
  wglGetCurrentContext=: 'opengl32.dll wglGetCurrentContext > x'&(15!:0)
  wglGetCurrentDC=: 'opengl32.dll wglGetCurrentDC > x'&(15!:0)
  wglMakeCurrent=: 'opengl32.dll wglMakeCurrent > i x x'&(15!:0)
  wglSwapBuffers=: 'opengl32.dll wglSwapBuffers > i x'&(15!:0)
  wglUseFontBitmapsA=: 'opengl32.dll wglUseFontBitmapsA i x i i i'&(15!:0)
  wglUseFontOutlinesA=: 'opengl32.dll wglUseFontOutlinesA i x i i i f f i *f'&(15!:0)

  wglGetProcAddress=: 'opengl32.dll wglGetProcAddress > x *c'&(15!:0)
elseif. UNAME-:'Linux' do.
  libgles=: <'libGLESv2.so.2'
  libgles=: <'libGL.so.1 '
elseif. UNAME-:'Android' do.
  libgles=: <'libGLESv2.so'
elseif. UNAME-:'Darwin' do.
  libgles=: <'/System/Library/Frameworks/OpenGL.framework/Libraries/libGL.dylib'
end.
''
)
cddefgl=: 4 : 0
y=. dtb (y i. ':'){.y
if. 0=#y do. '' return. end.
n=. y i. ' '
f=. n {. y
d=. (_2 * (<_2{.f) e. '_1';'_2';'_3') }. f
p=. n }. y
(f)=: (x,' ',d,p)&(15!:0)
''
)
cddefgl2=: 3 : 0
y=. dtb (y i. ':'){.y
if. 0=#y do. '' return. end.
n=. y i. ' '
f=. n {. y
d=. (_2 * (<_2{.f) e. '_1';'_2';'_3') }. f
p=. n }. y
(f)=: ('0 ',(":".d,'ARB_jgles_'), p)&(15!:0)
''
)
wglARB=: 3 : 0
if. -.IFWIN do. '' return. end.
libgles cddefgl_jgles_ &.> GLES_FUNC
(p,&.><'ARB_jgles_')=: wglGetProcAddress "0 p=. ({.~ i.&' ')&.> GLES_FUNC
f=. 0~: ". &> (p,&.><'ARB_jgles_')
cddefgl2_jgles_ &.> f#GLES_FUNC
''
)
libgles cddefgl &.> GLES_FUNC=: <;._2 [ 0 : 0
glActiveTexture > n i
glAttachShader > n i i
glBindAttribLocation > n i i *c
glBindBuffer > n i i
glBindFramebuffer > n i i
glBindRenderbuffer > n i i
glBindTexture > n i i
glBlendColor > n f f f f
glBlendEquation > n i
glBlendEquationSeparate > n i i
glBlendFunc > n i i
glBlendFuncSeparate > n i i i i
glBufferData > n i i x i
glBufferSubData > n i i *i x
glCheckFramebufferStatus > i i
glClear > n i
glClearColor > n f f f f
glClearDepthf > n f
glClearStencil > n i
glColorMask > n i i i i
glCompileShader > n i
glCompressedTexImage2D > n i i i i i i i x
glCompressedTexSubImage2D > n i i i i i i i i x
glCopyTexImage2D > n i i i i i i i i
glCopyTexSubImage2D > n i i i i i i i i
glCreateProgram > i
glCreateShader > i i
glCullFace > n i
glDeleteBuffers > n i *i
glDeleteFramebuffers > n i *i
glDeleteProgram > n i
glDeleteRenderbuffers > n i *i
glDeleteShader > n i
glDeleteTextures > n i *i
glDepthFunc > n i
glDepthMask > n i
glDepthRangef > n f f
glDetachShader > n i i
glDisable > n i
glDisableVertexAttribArray > n i
glDrawArrays > n i i i
glDrawElements > n i i i x
glEnable > n i
glEnableVertexAttribArray > n i
glFinish > n
glFlush > n
glFramebufferRenderbuffer > n i i i i
glFramebufferTexture2D > n i i i i i
glFrontFace > n i
glGenBuffers > n i *i
glGenerateMipmap > n i
glGenFramebuffers > n i *i
glGenRenderbuffers > n i *i
glGenTextures > n i *i
glGetActiveAttrib > n i i i *i *i *i *c
glGetActiveUniform > n i i i *i *i *i *c
glGetAttachedShaders > n i i *i *i
glGetAttribLocation > i i *c
glGetBooleanv > n i *c
glGetBufferParameteriv > n i i *i
glGetError > i
glGetFloatv > n i *f
glGetFramebufferAttachmentParameteriv > n i i i *i
glGetIntegerv > n i *i
glGetProgramiv > n i i *i
glGetProgramInfoLog > n i i *i *c
glGetRenderbufferParameteriv > n i i *i
glGetShaderiv > n i i *i
glGetShaderInfoLog > n i i *i *c
glGetShaderPrecisionFormat > n i i *i *i
glGetShaderSource > n i i *i *c
glGetString > x i
glGetTexParameterfv > n i i *f
glGetTexParameteriv > n i i *i
glGetUniformfv > n i i *f
glGetUniformiv > n i i *i
glGetUniformLocation > i i *c
glGetVertexAttribfv > n i i *f
glGetVertexAttribiv > n i i *i
glGetVertexAttribPointerv > n i i x*
glHint > n i i
glIsBuffer > i i
glIsEnabled > i i
glIsFramebuffer > i i
glIsProgram > i i
glIsRenderbuffer > i i
glIsShader > i i
glIsTexture > i i
glLineWidth > n f
glLinkProgram > n i
glPixelStorei > n i i
glPolygonOffset > n f f
glReadPixels > n i i i i i i x
glReleaseShaderCompiler > n
glRenderbufferStorage > n i i i i
glSampleCoverage > n f i
glScissor > n i i i i
glShaderBinary > n i *i i x i
glShaderSource > n i i *x *i
glStencilFunc > n i i i
glStencilFuncSeparate > n i i i i
glStencilMask > n i
glStencilMaskSeparate > n i i
glStencilOp > n i i i
glStencilOpSeparate > n i i i i
glTexImage2D > n i i i i i i i i x
glTexParameterf > n i i f
glTexParameterfv > n i i *f
glTexParameteri > n i i i
glTexParameteriv > n i i *i
glTexSubImage2D > n i i i i i i i i x
glUniform1f > n i f
glUniform1fv > n i i *f
glUniform1i > n i i
glUniform1iv > n i i *i
glUniform2f > n i f f
glUniform2fv > n i i *f
glUniform2i > n i i i
glUniform2iv > n i i *i
glUniform3f > n i f f f
glUniform3fv > n i i *f
glUniform3i > n i i i i
glUniform3iv > n i i *i
glUniform4f > n i f f f f
glUniform4fv > n i i *f
glUniform4i > n i i i i i
glUniform4iv > n i i *i
glUniformMatrix2fv > n i i i *f
glUniformMatrix3fv > n i i i *f
glUniformMatrix4fv > n i i i *f
glUseProgram > n i
glValidateProgram > n i
glVertexAttrib1f > n i f
glVertexAttrib1fv > n i *f
glVertexAttrib2f > n i f f
glVertexAttrib2fv > n i *f
glVertexAttrib3f > n i f f f
glVertexAttrib3fv > n i *f
glVertexAttrib4f > n i f f f f
glVertexAttrib4fv > n i *f
glVertexAttribPointer > n i i i s i x
glViewport > n i i i i
)

GL_DEPTH_BUFFER_BIT=: 16b00000100
GL_STENCIL_BUFFER_BIT=: 16b00000400
GL_COLOR_BUFFER_BIT=: 16b00004000
GL_FALSE=: 0
GL_TRUE=: 1
GL_POINTS=: 16b0000
GL_LINES=: 16b0001
GL_LINE_LOOP=: 16b0002
GL_LINE_STRIP=: 16b0003
GL_TRIANGLES=: 16b0004
GL_TRIANGLE_STRIP=: 16b0005
GL_TRIANGLE_FAN=: 16b0006
GL_ZERO=: 0
GL_ONE=: 1
GL_SRC_COLOR=: 16b0300
GL_ONE_MINUS_SRC_COLOR=: 16b0301
GL_SRC_ALPHA=: 16b0302
GL_ONE_MINUS_SRC_ALPHA=: 16b0303
GL_DST_ALPHA=: 16b0304
GL_ONE_MINUS_DST_ALPHA=: 16b0305
GL_DST_COLOR=: 16b0306
GL_ONE_MINUS_DST_COLOR=: 16b0307
GL_SRC_ALPHA_SATURATE=: 16b0308
GL_FUNC_ADD=: 16b8006
GL_BLEND_EQUATION=: 16b8009
GL_BLEND_EQUATION_RGB=: 16b8009
GL_BLEND_EQUATION_ALPHA=: 16b883d
GL_FUNC_SUBTRACT=: 16b800a
GL_FUNC_REVERSE_SUBTRACT=: 16b800b
GL_BLEND_DST_RGB=: 16b80c8
GL_BLEND_SRC_RGB=: 16b80c9
GL_BLEND_DST_ALPHA=: 16b80ca
GL_BLEND_SRC_ALPHA=: 16b80cb
GL_CONSTANT_COLOR=: 16b8001
GL_ONE_MINUS_CONSTANT_COLOR=: 16b8002
GL_CONSTANT_ALPHA=: 16b8003
GL_ONE_MINUS_CONSTANT_ALPHA=: 16b8004
GL_BLEND_COLOR=: 16b8005
GL_ARRAY_BUFFER=: 16b8892
GL_ELEMENT_ARRAY_BUFFER=: 16b8893
GL_ARRAY_BUFFER_BINDING=: 16b8894
GL_ELEMENT_ARRAY_BUFFER_BINDING=: 16b8895
GL_STREAM_DRAW=: 16b88e0
GL_STATIC_DRAW=: 16b88e4
GL_DYNAMIC_DRAW=: 16b88e8
GL_BUFFER_SIZE=: 16b8764
GL_BUFFER_USAGE=: 16b8765
GL_CURRENT_VERTEX_ATTRIB=: 16b8626
GL_FRONT=: 16b0404
GL_BACK=: 16b0405
GL_FRONT_AND_BACK=: 16b0408
GL_TEXTURE_2D=: 16b0de1
GL_CULL_FACE=: 16b0b44
GL_BLEND=: 16b0be2
GL_DITHER=: 16b0bd0
GL_STENCIL_TEST=: 16b0b90
GL_DEPTH_TEST=: 16b0b71
GL_SCISSOR_TEST=: 16b0c11
GL_POLYGON_OFFSET_FILL=: 16b8037
GL_SAMPLE_ALPHA_TO_COVERAGE=: 16b809e
GL_SAMPLE_COVERAGE=: 16b80a0
GL_NO_ERROR=: 0
GL_INVALID_ENUM=: 16b0500
GL_INVALID_VALUE=: 16b0501
GL_INVALID_OPERATION=: 16b0502
GL_OUT_OF_MEMORY=: 16b0505
GL_CW=: 16b0900
GL_CCW=: 16b0901
GL_LINE_WIDTH=: 16b0b21
GL_ALIASED_POINT_SIZE_RANGE=: 16b846d
GL_ALIASED_LINE_WIDTH_RANGE=: 16b846e
GL_CULL_FACE_MODE=: 16b0b45
GL_FRONT_FACE=: 16b0b46
GL_DEPTH_RANGE=: 16b0b70
GL_DEPTH_WRITEMASK=: 16b0b72
GL_DEPTH_CLEAR_VALUE=: 16b0b73
GL_DEPTH_FUNC=: 16b0b74
GL_STENCIL_CLEAR_VALUE=: 16b0b91
GL_STENCIL_FUNC=: 16b0b92
GL_STENCIL_FAIL=: 16b0b94
GL_STENCIL_PASS_DEPTH_FAIL=: 16b0b95
GL_STENCIL_PASS_DEPTH_PASS=: 16b0b96
GL_STENCIL_REF=: 16b0b97
GL_STENCIL_VALUE_MASK=: 16b0b93
GL_STENCIL_WRITEMASK=: 16b0b98
GL_STENCIL_BACK_FUNC=: 16b8800
GL_STENCIL_BACK_FAIL=: 16b8801
GL_STENCIL_BACK_PASS_DEPTH_FAIL=: 16b8802
GL_STENCIL_BACK_PASS_DEPTH_PASS=: 16b8803
GL_STENCIL_BACK_REF=: 16b8ca3
GL_STENCIL_BACK_VALUE_MASK=: 16b8ca4
GL_STENCIL_BACK_WRITEMASK=: 16b8ca5
GL_VIEWPORT=: 16b0ba2
GL_SCISSOR_BOX=: 16b0c10
GL_COLOR_CLEAR_VALUE=: 16b0c22
GL_COLOR_WRITEMASK=: 16b0c23
GL_UNPACK_ALIGNMENT=: 16b0cf5
GL_PACK_ALIGNMENT=: 16b0d05
GL_MAX_TEXTURE_SIZE=: 16b0d33
GL_MAX_VIEWPORT_DIMS=: 16b0d3a
GL_SUBPIXEL_BITS=: 16b0d50
GL_RED_BITS=: 16b0d52
GL_GREEN_BITS=: 16b0d53
GL_BLUE_BITS=: 16b0d54
GL_ALPHA_BITS=: 16b0d55
GL_DEPTH_BITS=: 16b0d56
GL_STENCIL_BITS=: 16b0d57
GL_POLYGON_OFFSET_UNITS=: 16b2a00
GL_POLYGON_OFFSET_FACTOR=: 16b8038
GL_TEXTURE_BINDING_2D=: 16b8069
GL_SAMPLE_BUFFERS=: 16b80a8
GL_SAMPLES=: 16b80a9
GL_SAMPLE_COVERAGE_VALUE=: 16b80aa
GL_SAMPLE_COVERAGE_INVERT=: 16b80ab
GL_NUM_COMPRESSED_TEXTURE_FORMATS=: 16b86a2
GL_COMPRESSED_TEXTURE_FORMATS=: 16b86a3
GL_DONT_CARE=: 16b1100
GL_FASTEST=: 16b1101
GL_NICEST=: 16b1102
GL_GENERATE_MIPMAP_HINT=: 16b8192
GL_BYTE=: 16b1400
GL_UNSIGNED_BYTE=: 16b1401
GL_SHORT=: 16b1402
GL_UNSIGNED_SHORT=: 16b1403
GL_INT=: 16b1404
GL_UNSIGNED_INT=: 16b1405
GL_FLOAT=: 16b1406
GL_FIXED=: 16b140c
GL_DEPTH_COMPONENT=: 16b1902
GL_ALPHA=: 16b1906
GL_RGB=: 16b1907
GL_RGBA=: 16b1908
GL_LUMINANCE=: 16b1909
GL_LUMINANCE_ALPHA=: 16b190a
GL_UNSIGNED_SHORT_4_4_4_4=: 16b8033
GL_UNSIGNED_SHORT_5_5_5_1=: 16b8034
GL_UNSIGNED_SHORT_5_6_5=: 16b8363
GL_FRAGMENT_SHADER=: 16b8b30
GL_VERTEX_SHADER=: 16b8b31
GL_MAX_VERTEX_ATTRIBS=: 16b8869
GL_MAX_VERTEX_UNIFORM_VECTORS=: 16b8dfb
GL_MAX_VARYING_VECTORS=: 16b8dfc
GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS=: 16b8b4d
GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS=: 16b8b4c
GL_MAX_TEXTURE_IMAGE_UNITS=: 16b8872
GL_MAX_FRAGMENT_UNIFORM_VECTORS=: 16b8dfd
GL_SHADER_TYPE=: 16b8b4f
GL_DELETE_STATUS=: 16b8b80
GL_LINK_STATUS=: 16b8b82
GL_VALIDATE_STATUS=: 16b8b83
GL_ATTACHED_SHADERS=: 16b8b85
GL_ACTIVE_UNIFORMS=: 16b8b86
GL_ACTIVE_UNIFORM_MAX_LENGTH=: 16b8b87
GL_ACTIVE_ATTRIBUTES=: 16b8b89
GL_ACTIVE_ATTRIBUTE_MAX_LENGTH=: 16b8b8a
GL_SHADING_LANGUAGE_VERSION=: 16b8b8c
GL_CURRENT_PROGRAM=: 16b8b8d
GL_NEVER=: 16b0200
GL_LESS=: 16b0201
GL_EQUAL=: 16b0202
GL_LEQUAL=: 16b0203
GL_GREATER=: 16b0204
GL_NOTEQUAL=: 16b0205
GL_GEQUAL=: 16b0206
GL_ALWAYS=: 16b0207
GL_KEEP=: 16b1e00
GL_REPLACE=: 16b1e01
GL_INCR=: 16b1e02
GL_DECR=: 16b1e03
GL_INVERT=: 16b150a
GL_INCR_WRAP=: 16b8507
GL_DECR_WRAP=: 16b8508
GL_VENDOR=: 16b1f00
GL_RENDERER=: 16b1f01
GL_VERSION=: 16b1f02
GL_EXTENSIONS=: 16b1f03
GL_NEAREST=: 16b2600
GL_LINEAR=: 16b2601
GL_NEAREST_MIPMAP_NEAREST=: 16b2700
GL_LINEAR_MIPMAP_NEAREST=: 16b2701
GL_NEAREST_MIPMAP_LINEAR=: 16b2702
GL_LINEAR_MIPMAP_LINEAR=: 16b2703
GL_TEXTURE_MAG_FILTER=: 16b2800
GL_TEXTURE_MIN_FILTER=: 16b2801
GL_TEXTURE_WRAP_S=: 16b2802
GL_TEXTURE_WRAP_T=: 16b2803
GL_TEXTURE=: 16b1702
GL_TEXTURE_CUBE_MAP=: 16b8513
GL_TEXTURE_BINDING_CUBE_MAP=: 16b8514
GL_TEXTURE_CUBE_MAP_POSITIVE_X=: 16b8515
GL_TEXTURE_CUBE_MAP_NEGATIVE_X=: 16b8516
GL_TEXTURE_CUBE_MAP_POSITIVE_Y=: 16b8517
GL_TEXTURE_CUBE_MAP_NEGATIVE_Y=: 16b8518
GL_TEXTURE_CUBE_MAP_POSITIVE_Z=: 16b8519
GL_TEXTURE_CUBE_MAP_NEGATIVE_Z=: 16b851a
GL_MAX_CUBE_MAP_TEXTURE_SIZE=: 16b851c
GL_TEXTURE0=: 16b84c0
GL_TEXTURE1=: 16b84c1
GL_TEXTURE2=: 16b84c2
GL_TEXTURE3=: 16b84c3
GL_TEXTURE4=: 16b84c4
GL_TEXTURE5=: 16b84c5
GL_TEXTURE6=: 16b84c6
GL_TEXTURE7=: 16b84c7
GL_TEXTURE8=: 16b84c8
GL_TEXTURE9=: 16b84c9
GL_TEXTURE10=: 16b84ca
GL_TEXTURE11=: 16b84cb
GL_TEXTURE12=: 16b84cc
GL_TEXTURE13=: 16b84cd
GL_TEXTURE14=: 16b84ce
GL_TEXTURE15=: 16b84cf
GL_TEXTURE16=: 16b84d0
GL_TEXTURE17=: 16b84d1
GL_TEXTURE18=: 16b84d2
GL_TEXTURE19=: 16b84d3
GL_TEXTURE20=: 16b84d4
GL_TEXTURE21=: 16b84d5
GL_TEXTURE22=: 16b84d6
GL_TEXTURE23=: 16b84d7
GL_TEXTURE24=: 16b84d8
GL_TEXTURE25=: 16b84d9
GL_TEXTURE26=: 16b84da
GL_TEXTURE27=: 16b84db
GL_TEXTURE28=: 16b84dc
GL_TEXTURE29=: 16b84dd
GL_TEXTURE30=: 16b84de
GL_TEXTURE31=: 16b84df
GL_ACTIVE_TEXTURE=: 16b84e0
GL_REPEAT=: 16b2901
GL_CLAMP_TO_EDGE=: 16b812f
GL_MIRRORED_REPEAT=: 16b8370
GL_FLOAT_VEC2=: 16b8b50
GL_FLOAT_VEC3=: 16b8b51
GL_FLOAT_VEC4=: 16b8b52
GL_INT_VEC2=: 16b8b53
GL_INT_VEC3=: 16b8b54
GL_INT_VEC4=: 16b8b55
GL_BOOL=: 16b8b56
GL_BOOL_VEC2=: 16b8b57
GL_BOOL_VEC3=: 16b8b58
GL_BOOL_VEC4=: 16b8b59
GL_FLOAT_MAT2=: 16b8b5a
GL_FLOAT_MAT3=: 16b8b5b
GL_FLOAT_MAT4=: 16b8b5c
GL_SAMPLER_2D=: 16b8b5e
GL_SAMPLER_CUBE=: 16b8b60
GL_VERTEX_ATTRIB_ARRAY_ENABLED=: 16b8622
GL_VERTEX_ATTRIB_ARRAY_SIZE=: 16b8623
GL_VERTEX_ATTRIB_ARRAY_STRIDE=: 16b8624
GL_VERTEX_ATTRIB_ARRAY_TYPE=: 16b8625
GL_VERTEX_ATTRIB_ARRAY_NORMALIZED=: 16b886a
GL_VERTEX_ATTRIB_ARRAY_POINTER=: 16b8645
GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING=: 16b889f
GL_IMPLEMENTATION_COLOR_READ_TYPE=: 16b8b9a
GL_IMPLEMENTATION_COLOR_READ_FORMAT=: 16b8b9b
GL_COMPILE_STATUS=: 16b8b81
GL_INFO_LOG_LENGTH=: 16b8b84
GL_SHADER_SOURCE_LENGTH=: 16b8b88
GL_SHADER_COMPILER=: 16b8dfa
GL_SHADER_BINARY_FORMATS=: 16b8df8
GL_NUM_SHADER_BINARY_FORMATS=: 16b8df9
GL_LOW_FLOAT=: 16b8df0
GL_MEDIUM_FLOAT=: 16b8df1
GL_HIGH_FLOAT=: 16b8df2
GL_LOW_INT=: 16b8df3
GL_MEDIUM_INT=: 16b8df4
GL_HIGH_INT=: 16b8df5
GL_FRAMEBUFFER=: 16b8d40
GL_RENDERBUFFER=: 16b8d41
GL_RGBA4=: 16b8056
GL_RGB5_A1=: 16b8057
GL_RGB565=: 16b8d62
GL_DEPTH_COMPONENT16=: 16b81a5
GL_STENCIL_INDEX=: 16b1901
GL_STENCIL_INDEX8=: 16b8d48
GL_RENDERBUFFER_WIDTH=: 16b8d42
GL_RENDERBUFFER_HEIGHT=: 16b8d43
GL_RENDERBUFFER_INTERNAL_FORMAT=: 16b8d44
GL_RENDERBUFFER_RED_SIZE=: 16b8d50
GL_RENDERBUFFER_GREEN_SIZE=: 16b8d51
GL_RENDERBUFFER_BLUE_SIZE=: 16b8d52
GL_RENDERBUFFER_ALPHA_SIZE=: 16b8d53
GL_RENDERBUFFER_DEPTH_SIZE=: 16b8d54
GL_RENDERBUFFER_STENCIL_SIZE=: 16b8d55
GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE=: 16b8cd0
GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME=: 16b8cd1
GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL=: 16b8cd2
GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE=: 16b8cd3
GL_COLOR_ATTACHMENT0=: 16b8ce0
GL_DEPTH_ATTACHMENT=: 16b8d00
GL_STENCIL_ATTACHMENT=: 16b8d20
GL_NONE=: 0
GL_FRAMEBUFFER_COMPLETE=: 16b8cd5
GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT=: 16b8cd6
GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT=: 16b8cd7
GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS=: 16b8cd9
GL_FRAMEBUFFER_UNSUPPORTED=: 16b8cdd
GL_FRAMEBUFFER_BINDING=: 16b8ca6
GL_RENDERBUFFER_BINDING=: 16b8ca7
GL_MAX_RENDERBUFFER_SIZE=: 16b84e8
GL_INVALID_FRAMEBUFFER_OPERATION=: 16b0506

gl_I=: 3 : 0
4 4$5{.1
)

gl_GetFloatv=: 3 : 0
1&fc ,|:y
)

gl_mp=: +/ . *

gl_Rotate=: 3 : 0
(gl_iden'') gl_rotate y
:
mat=. x
'a x y z'=. y
s=. 1 o. a * 1p1 % 180
c=. 2 o. a * 1p1 % 180

xx=. x * x
xy=. x * y
xz=. x * z
yy=. y * y
yz=. y * z
zz=. z * z
m=. xx * (1 - c) + c
m=. m, xy * (1 - c) - z * s
m=. m, xz * (1 - c) + y * s
m0=. m, 0

m=. xy * (1 - c) + z * s
m=. m, yy * (1 - c) + c
m=. m, yz * (1 - c) - x * s
m1=. m, 0

m=. xz * (1 - c) - y * s
m=. m, yz * (1 - c) + x * s
m=. m, zz * (1 - c) + c
m2=. m, 0

m3=. 0 0 0 1

mat (+/ . *) (|:_4]\m0,m1,m2,m3)
)

gl_Translate=: 3 : 0
(gl_iden'') gl_translate y
:
mat=. x
'x y z'=. y

m0=. 1 0 0 0
m1=. 0 1 0 0
m2=. 0 0 1 0
m3=. x,y,x,1

mat (+/ . *) (|:_4]\m0,m1,m2,m3)
)

gl_Scale=: 3 : 0
(gl_iden'') gl_scale y
:
mat=. x
'x y z'=. y

m0=. x,0 0 0
m1=. 0,y,0 0
m2=. 0 0,z,0
m3=. 0 0 0 1

mat (+/ . *) (|:_4]\m0,m1,m2,m3)
)
gluLookAt=: 3 : 0
'eye center up'=. _3]\,>y
F=. center - eye
f=. (% +/&.:*:)F
UPP=. (% +/&.:*:)up
s=. f ((1&|.@:[ * _1&|.@:]) - _1&|.@:[ * 1&|.@:]) UPP
u=. s ((1&|.@:[ * _1&|.@:]) - _1&|.@:[ * 1&|.@:]) f
M=. _4]\ s, 0, u, 0, (-f), 0 0 0 0 1 
glMultMatrixd <,@:|: M
glTranslated -eye
)
