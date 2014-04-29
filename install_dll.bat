call baseq3path.local.bat

copy /Y build\cgame_%target%\cgame%arch%.dll %basepath%\baseq3
copy /Y build\game_%target%\qagame%arch%.dll %basepath%\baseq3
copy /Y build\q3_ui_%target%\ui%arch%.dll %basepath%\baseq3
copy /Y build\renderer_opengl1_%target%\renderer_opengl1_%arch%.dll %basepath%