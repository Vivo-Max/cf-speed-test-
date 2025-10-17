@echo off
setlocal

REM ���� Go Դ�ļ������Ŀ¼
set SOURCE_FILE=iptest.go
set BUILD_DIR=builds

echo ���ڴ����������Ŀ¼: %BUILD_DIR%
if not exist %BUILD_DIR% mkdir %BUILD_DIR%

REM 1. Termux (Android ARM64)
echo --> ���ڱ��� Termux (Android ARM64) �汾...
set CGO_ENABLED=0
set GOOS=android
set GOARCH=arm64
go build -o %BUILD_DIR%\iptest_termux_arm64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_termux_arm64  ����ɹ���) else (echo [ʧ��] iptest_termux_arm64 �������)

REM 2. Linux (AMD64)
echo --> ���ڱ��� 64λ Linux �汾...
set GOOS=linux
set GOARCH=amd64
go build -o %BUILD_DIR%\iptest_linux_amd64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_linux_amd64  ����ɹ���) else (echo [ʧ��] iptest_linux_amd64 �������)

REM 3. Linux (ARM64)
echo --> ���ڱ��� Linux (ARM64) �汾...
set GOOS=linux
set GOARCH=arm64
go build -o %BUILD_DIR%\iptest_linux_arm64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_linux_arm64  ����ɹ���) else (echo [ʧ��] iptest_linux_arm64 �������)

REM 4. Windows (AMD64)
echo --> ���ڱ��� 64λ Windows �汾...
set GOOS=windows
set GOARCH=amd64
go build -o %BUILD_DIR%\iptest_windows_amd64.exe %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_windows_amd64.exe  ����ɹ���) else (echo [ʧ��] iptest_windows_amd64.exe �������)

REM 5. Windows (ARM64)
echo --> ���ڱ��� Windows (ARM64) �汾...
set GOOS=windows
set GOARCH=arm64
go build -o %BUILD_DIR%\iptest_windows_arm64.exe %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_windows_arm64.exe  ����ɹ���) else (echo [ʧ��] iptest_windows_arm64.exe �������)

REM 6. macOS (ARM64)
echo --> ���ڱ��� macOS (ARM64) �汾...
set GOOS=darwin
set GOARCH=arm64
go build -o %BUILD_DIR%\iptest_darwin_arm64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_darwin_arm64  ����ɹ���) else (echo [ʧ��] iptest_darwin_arm64 �������)

REM 7. macOS (AMD64)
echo --> ���ڱ��� macOS (AMD64) �汾...
set GOOS=darwin
set GOARCH=amd64
go build -o %BUILD_DIR%\iptest_darwin_amd64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_darwin_amd64  ����ɹ���) else (echo [ʧ��] iptest_darwin_amd64 �������)

echo.
echo ================================
echo �������! ���п�ִ���ļ��ѱ����� "%BUILD_DIR%" Ŀ¼�¡�
echo ================================
pause
