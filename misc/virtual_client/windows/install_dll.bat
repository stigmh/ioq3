call baseq3path.local.bat

copy /Y %buildPath%\cgame_%target%\cgame%arch%.dll %basepath%\baseq3
copy /Y %buildPath%\game_%target%\qagame%arch%.dll %basepath%\baseq3
copy /Y %buildPath%\q3_ui_%target%\ui%arch%.dll %basepath%\baseq3
copy /Y %buildPath%\renderer_opengl1_%target%\renderer_opengl1_%arch%.dll %basepath%