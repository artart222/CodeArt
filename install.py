import platform, os

os = platform.system()

if os == "Linux":
    from installer import linux

# MacOs
elif os == "Darwin":
    from installer import macOS

elif os == "Windows":
    from installer import windows
