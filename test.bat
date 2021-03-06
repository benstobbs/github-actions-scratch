Powershell.exe -Command "curl https://github.com/benstobbs/oss-cad-suite-build/releases/download/manual-python3-ssl/oss-cad-suite-windows-x64-20220131.exe -O archive.exe"
.\archive.exe

copy .\oss-cad-suite\lib\libcrypto-1_1-x64.dll .\oss-cad-suite\lib\python3.8\lib-dynload\libcrypto-1_1-x64.dll
copy .\oss-cad-suite\lib\libssl-1_1-x64.dll .\oss-cad-suite\lib\python3.8\lib-dynload\libssl-1_1-x64.dll 

set YOSYSHQ_ROOT=.\oss-cad-suite\

@set prompt=[OSS CAD Suite] $p$g
@set SSL_CERT_FILE=%YOSYSHQ_ROOT%etc\cacert.pem

@set PATH=%YOSYSHQ_ROOT%bin;%YOSYSHQ_ROOT%lib;%YOSYSHQ_ROOT%py3bin;%PATH%
@set PYTHON_EXECUTABLE=%YOSYSHQ_ROOT%py3bin\python3.exe
@set QT_PLUGIN_PATH=%YOSYSHQ_ROOT%lib\qt5\plugins
@set QT_LOGGING_RULES=*=false

@set GTK_EXE_PREFIX=%YOSYSHQ_ROOT%
@set GTK_DATA_PREFIX=%YOSYSHQ_ROOT%
@set GDK_PIXBUF_MODULEDIR=%YOSYSHQ_ROOT%lib\gdk-pixbuf-2.0\2.10.0\loaders
@set GDK_PIXBUF_MODULE_FILE=%YOSYSHQ_ROOT%lib\gdk-pixbuf-2.0\2.10.0\loaders.cache
@gdk-pixbuf-query-loaders.exe --update-cache

echo %PATH%

where python3
python3 -m ssl
python3 -m asdf