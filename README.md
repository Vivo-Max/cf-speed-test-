脚本功能简介

概述

iptest.go 是一个 Go 语言编写的命令行工具，基于碧海青天 https://github.com/bh-qt/Cloudflare-IP-SpeedTest 项目二次修改。用于从文件中读取 IP 地址和端口列表，进行可用性测试、延迟测量，并可选地进行下载速度测试。脚本支持并发处理，支持多种输入格式（如 TXT、CSV），并将结果输出到 CSV 文件。适用于网络诊断、IP 筛选和性能测试场景。
主要特性：

支持读取单个文件或目录中的 IP/端口列表。
测试 IP 的 TCP 连接和 HTTP/HTTPS 响应。
提取数据中心、地区、国家、城市等位置信息（基于内置机场位置表）。
可选的多协程下载速度测试（支持 TLS）。
输出结果支持端口过滤和速度阈值筛选。
自动去重 IP/端口对。
支持 Linux 系统提升文件描述符上限（需 root 权限）。

主要功能

IP/端口读取：

支持多种格式：IP:port、IP port、[IPv6]:port、IPv6 port、JSON、CSV、代理链接（vless:// 等）。
无端口时默认 443。
支持域名（非 IP）解析和测试。

可用性测试：

使用 TCP 连接测试端口可用性。
发送 HTTP/HTTPS 请求到指定 URL（默认 www.speedtest.net），检查响应中特定字符串（uag=Mozilla/5.0）。
测量延迟（TCP + HTTP 请求时间），超时 1 秒，最大持续 2 秒。

位置信息提取：

从响应中提取数据中心代码（colo=XXX）。
使用内置 JSON 位置表映射到地区、国家、城市等。

速度测试（可选）：

使用多协程（默认 5）并发下载测试文件（默认 speed.cloudflare.com/__down?bytes=500000000）。
支持范围请求（Range）分块下载。
计算平均下载速度 (MB/s)，并可设置最低速度阈值过滤。

输出：

生成 CSV 文件，包含 IP、端口、TLS、数据中心、地区、国家代码、国家、城市、延迟、速度（若启用）。
排序：速度测试模式按速度降序，否则按延迟升序。
支持端口过滤输出。

并发控制：

默认最大 100 协程测试 IP。
速度测试协程数可配置，设为 0 禁用。

命令行参数
脚本通过 flag 包解析参数，使用方式：go run iptest.go [参数]。
```
-path：输入文件或目录路径（默认 "ip.txt"）。
-outfile：输出 CSV 文件名（默认 "ip.csv"）。
-max：最大并发协程数（默认 100）。
-speedtest：下载测速协程数（默认 5，0 禁用）。
-int：最低下载速度阈值 (MB/s)（默认 0）。
-url：测速文件 URL（默认 "speed.cloudflare.com/__down?bytes=500000000"）。
-tls：是否启用 TLS（默认 true）。
-tcpurl：TCP 测试 URL（默认 "www.speedtest.net"）。
-port：输出特定端口结果（默认 0，不过滤）。
```
使用示例

基本使用（测试 ip.txt 中的 IP，启用速度测试）：
go run iptest.go -path ip.txt -speedtest 5

输出：ip.csv 文件，包含测试结果。

禁用速度测试，只测延迟：
go run iptest.go -path ip.txt -speedtest 0

指定输出文件和端口过滤：
go run iptest.go -path ip_dir -outfile results.csv -port 443 -tls=false

输入示例 (ip.txt)：
```
8.8.8.8:53
example.com:443
[2001:db8::1]:80
```




