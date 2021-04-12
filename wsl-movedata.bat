@echo off
IF "%1%" == "" goto end

set dest_dir=%1%
echo %1%
echo %dest_dir%

IF EXIST %dest_dir% (
	echo "dest dir is exist!"
	) ELSE (
	MD "%dest_dir%"
	)

set dest_tar_name=docker-desktop-data
set dest_tar_filename=%dest_dir%%dest_tar_name%.tar
echo %dest_tar_filename%

wsl --shutdown
wsl --export %dest_tar_name% %dest_tar_filename%
wsl --unregister docker-desktop-data
wsl --import %dest_tar_name% %dest_dir% %dest_tar_filename% --version 2

:end
echo "please input dest path!like this: wsl-movedata.bat d:/docker1/"
