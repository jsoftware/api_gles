NB. OpenGL ES on windows ANGLE, iOs and Andorid

coclass 'jgles'

NB. use only OpenGL ES subset
3 : 0''
lib=. (<;._1 ' libGLESv3.so libGLESv3.dylib libGLESv3.dll libGLESv3.so.1'){::~(;:'Android Darwin Win') i. <UNAME
GLES_3=. (2 0-:(lib,' dummy > n')&cd ::cder) ''
lib=. (<;._1 ' libGLESv2.so libGLESv2.dylib libGLESv2.dll libGLESv2.so.2'){::~(;:'Android Darwin Win') i. <UNAME
GLES=. GLES_3 +. IFIOS +. (2 0-:(lib,' dummy > n')&cd ::cder) ''
NB. set GLES_VERSION_jgles_ =: 0 in startup.ijs to disable OpenGLES
GLES_VERSION=: (GLES_VERSION"_)^:(0=4!:0<'GLES_VERSION') (GLES_3{2 3) * GLES
if. IFQT do.
  GLES_VERSION=: GLES_VERSION * 2= {. ".@:wd ::('0'"_)'qopenglmod'
end.
''
)

GLPROC_Initialized=: -. IFWIN > 0~:GLES_VERSION
