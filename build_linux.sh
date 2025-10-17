#!/bin/bash

# 定义 Go 源文件和输出目录
SOURCE_FILE="iptest.go"
BUILD_DIR="./builds"

echo "正在创建编译输出目录: $BUILD_DIR"
mkdir -p "$BUILD_DIR"

# 1. 编译用于 Termux (Android ARM64) 的程序（纯 Go DNS 解析）
echo "--> 正在编译 Termux (Android ARM64) 版本..."
CGO_ENABLED=0 GOOS=android GOARCH=arm64 go build -o "$BUILD_DIR/iptest_termux_arm64" "$SOURCE_FILE"

#  编译用于 Termux (Android ARM) 的程序（纯 Go DNS 解析）
# echo "--> 正在编译 Termux (Android ARM) 版本..."
# CGO_ENABLED=0 GOOS=android GOARCH=arm go build -o "$BUILD_DIR/iptest_termux_arm" "$SOURCE_FILE"

# 2. 编译用于 64位 Linux 的程序
echo "--> 正在编译 64位 Linux 版本..."
GOOS=linux GOARCH=amd64 go build -o "$BUILD_DIR/iptest_linux_amd64" "$SOURCE_FILE"

# 3. 编译用于 Linux (ARM64) 的程序
echo "--> 正在编译 Linux (ARM64) 版本..."
GOOS=linux GOARCH=arm64 go build -o "$BUILD_DIR/iptest_linux_arm64" "$SOURCE_FILE"

# 4. 编译用于 64位 Windows 的程序
echo "--> 正在编译 64位 Windows 版本..."
GOOS=windows GOARCH=amd64 go build -o "$BUILD_DIR/iptest_windows_amd64.exe" "$SOURCE_FILE"

# 5. 编译用于 Windows (ARM64) 的程序
echo "--> 正在编译 Windows (ARM64) 版本..."
GOOS=windows GOARCH=arm64 go build -o "$BUILD_DIR/iptest_windows_arm64.exe" "$SOURCE_FILE"

# 6. 编译用于 macOS (ARM64) 的程序
echo "--> 正在编译 macOS (ARM64) 版本..."
GOOS=darwin GOARCH=arm64 go build -o "$BUILD_DIR/iptest_darwin_arm64" "$SOURCE_FILE"

# 7. 编译用于 macOS (AMD64) 的程序
echo "--> 正在编译 macOS (AMD64) 版本..."
GOOS=darwin GOARCH=amd64 go build -o "$BUILD_DIR/iptest_darwin_amd64" "$SOURCE_FILE"

echo ""
echo "编译完成! 所有可执行文件已保存在 '$BUILD_DIR' 目录下。"