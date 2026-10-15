Exusiai Desktop Pet v1.5.4 - Source Package

目录说明
- src/              Win32 C++ 源码、资源声明、版本信息和 Manifest
- assets/           编译所需的 GIF、PNG、图标和 WAV 资源
- tools/            原始素材预处理脚本（可选，不参与日常编译）
- build.sh          MinGW-w64 构建脚本
- Requirements.txt  截至 v1.5.4 的完整需求与变更记录

构建环境
- Linux 或 WSL
- MinGW-w64 x86_64 交叉编译工具链
- Bash、coreutils、sha256sum

Debian/Ubuntu/WSL 安装示例
  sudo apt update
  sudo apt install mingw-w64 binutils-mingw-w64-x86-64

构建命令
  bash build.sh

输出文件
- dist/Exusiai.exe
- dist/Exusiai.exe.sha256

说明
- 当前构建直接使用 assets/ 内已经处理好的资源，不需要 source_assets/ 或 audio_source/。
- 所有运行所需动画、图标、语音和字幕都会嵌入 Exusiai.exe。
- 构建目标为 Windows x64 GUI，程序采用静态 C/C++ 运行库链接。
- 进入/退出作战请使用右键菜单；J 为普攻、K 为技能，A/D 或方向键控制朝向。
- v1.5.4 不注册也不轮询 Q/Alt+Q 快捷键，避免按键提示音及误触发。
- GIF 播放速度可在设置窗口中调整为 1.0×–2.0×。
