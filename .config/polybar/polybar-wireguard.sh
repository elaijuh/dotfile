#!/bin/sh

# this solution is based on NetworkManager, not applicable to systemd-networkd
color_primary=#F0C674
color_disabled=#707880
configs_path="$HOME/.config/wireguard"
connected_interface=$(nmcli d | grep -P ".*wireguard\W+connected" -o | awk '{print $1}')

connect() {
    selected_config=$(ls $configs_path/*.conf | xargs basename -a -s .conf | dmenu)
    [[ $selected_config ]] && wg-quick up "$configs_path"/"$selected_config".conf
}

disconnect() {
    # Normally we should have a single connected interface but technically
    # there's nothing stopping us from having multiple active intgerfaces so
    # let's do this in a loop:
    for connected_config in $(nmcli d | grep -P ".*wireguard\W+connected" -o | awk '{print $1}')
    do
        wg-quick down "$configs_path"/"$connected_config".conf
    done
}

toggle() {
    if [[ $connected_interface ]]
    then
        disconnect
    else
        connect
    fi
}

print() {
    if [[ $connected_interface ]]
    then
        echo "%{F$color_primary}$connected_interface%{F-}"
    else
        echo "%{F$color_disabled}wg%{F-}"
    fi
}

case "$1" in
    --connect)
        connect
        ;;
    --disconnect)
        disconnect
        ;;
    --toggle)
        toggle
        ;;
    *)
        print
        ;;
esac
