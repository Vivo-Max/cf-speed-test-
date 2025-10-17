@echo off
setlocal

REM 定义 Go 源文件和输出目录
set SOURCE_FILE=iptest.go
set BUILD_DIR=builds

echo 正在创建编译输出目录: %BUILD_DIR%
if not exist %BUILD_DIR% mkdir %BUILD_DIR%

REM 1. Termux (Android ARM64)
echo --> 正在编译 Termux (Android ARM64) 版本...
set CGO_ENABLED=0
set GOOS=android
set GOARCH=arm64
go build -o %BUILD_DIR%\iptest_termux_arm64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_termux_arm64  编译成功！) else (echo [失败] iptest_termux_arm64 编译出错！)

REM 2. Linux (AMD64)
echo --> 正在编译 64位 Linux 版本...
set GOOS=linux
set GOARCH=amd64
go build -o %BUILD_DIR%\iptest_linux_amd64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_linux_amd64  编译成功！) else (echo [失败] iptest_linux_amd64 编译出错！)

REM 3. Linux (ARM64)
echo --> 正在编译 Linux (ARM64) 版本...
set GOOS=linux
set GOARCH=arm64
go build -o %BUILD_DIR%\iptest_linux_arm64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_linux_arm64  编译成功！) else (echo [失败] iptest_linux_arm64 编译出错！)

REM 4. Windows (AMD64)
echo --> 正在编译 64位 Windows 版本...
set GOOS=windows
set GOARCH=amd64
go build -o %BUILD_DIR%\iptest_windows_amd64.exe %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_windows_amd64.exe  编译成功！) else (echo [失败] iptest_windows_amd64.exe 编译出错！)

REM 5. Windows (ARM64)
echo --> 正在编译 Windows (ARM64) 版本...
set GOOS=windows
set GOARCH=arm64
go build -o %BUILD_DIR%\iptest_windows_arm64.exe %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_windows_arm64.exe  编译成功！) else (echo [失败] iptest_windows_arm64.exe 编译出错！)

REM 6. macOS (ARM64)
echo --> 正在编译 macOS (ARM64) 版本...
set GOOS=darwin
set GOARCH=arm64
go build -o %BUILD_DIR%\iptest_darwin_arm64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_darwin_arm64  编译成功！) else (echo [失败] iptest_darwin_arm64 编译出错！)

REM 7. macOS (AMD64)
echo --> 正在编译 macOS (AMD64) 版本...
set GOOS=darwin
set GOARCH=amd64
go build -o %BUILD_DIR%\iptest_darwin_amd64 %SOURCE_FILE%
if %errorlevel%==0 (echo [OK]  iptest_darwin_amd64  编译成功！) else (echo [失败] iptest_darwin_amd64 编译出错！)

echo.
echo ================================
echo 编译完成! 所有可执行文件已保存在 "%BUILD_DIR%" 目录下。
echo ================================
pause
