cd $(dirname $0)

function exe () {
    local cmd=$@
    if ! pgrep -x $cmd; then
        $cmd &
    fi
}

exe picom --animations -b
exe $HOME/.config/awesome/scripts/redshift.sh restore
exe ~/scripts/caps-esc.sh

xrdb merge $HOME/.Xresources
exe syndaemon -d -i 0.3 -t -K -R &&
exe nitrogen --restore &&
exe nm-applet 
exe rfkill unblock all
