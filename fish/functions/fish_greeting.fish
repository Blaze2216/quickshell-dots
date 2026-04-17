function fish_greeting
    echo -ne '\x1b[38;5;16m'  # Set colour to primary
    echo '      ____  _                 '
    echo '     | __ )| | __ _ _______   '
    echo '     |  _ \| |/ _` |_  / _ \  '
    echo '     | |_) | | (_| |/ /  __/  '
    echo '     |____/|_|\__,_/___\___|  '
    set_color normal
    fastfetch --key-padding-left 5
end