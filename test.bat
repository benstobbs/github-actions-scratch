echo "Downloading OSS"
Powershell.exe -Command "curl https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2022-01-30/oss-cad-suite-windows-x64-20220130.exe -O archive.exe"
echo "Unzipping"
.\archive.exe
echo "Activating environment"
.\oss-cad-suite\environment.bat
echo "running: where python3"
where python3
echo "running: python3 -m ssl"
python3 -m ssl
echo "running: python3 -m asdf"
python3 -m asdf