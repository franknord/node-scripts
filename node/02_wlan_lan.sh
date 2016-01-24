uci -q batch <<EOF
        delete wireless.radio0.disabled                 # WLAN Einschalten
        delete wireless.@wifi-iface[0]                  # OpenWRT-Default WLAN loeschen
        set wireless.radio0.channel='1'                 # Funkeinstellungen
        set wireless.radio0.htmode='HT20'
        set wireless.radio0.country='DE'
        
        set wireless.wifi_freifunk='wifi-iface'         # 1. WLAN: Accesspoint
        set wireless.wifi_freifunk.device='radio0'
        set wireless.wifi_freifunk.network='freifunk'
        set wireless.wifi_freifunk.mode='ap'
        set wireless.wifi_freifunk.ssid='Freifunk'
        
        set wireless.wifi_mesh='wifi-iface'             # 2. WLAN: Ad-Hoc Mesh
        set wireless.wifi_mesh.device='radio0'
        set wireless.wifi_mesh.network='mesh'
        set wireless.wifi_mesh.mode='adhoc'
        set wireless.wifi_mesh.ssid='42:42:42:42:42:42'
        set wireless.wifi_mesh.bssid='42:42:42:42:42:42'
        set wireless.wifi_mesh.mcast_rate='12000'
        commit wireless

        set batman-adv.bat0.gw_mode='client'            # Batman-adv: Router ist Node - kein Supernode
        set batman-adv.bat0.orig_interval='5000'        # Beacon alle 5 Sekunden senden
        set batman-adv.bat0.bridge_loop_avoidance='1'   # Bride Loop-Avoidance Feature einschalten
        commit batman-adv

        set network.bat0='interface'                    # Interface bat0 (batman-adv) im System bekannt machen
        set network.bat0.proto='none'
        set network.bat0.ifname='bat0'

        set network.freifunk='interface'                # Interface "Freifunk" im System bekannt machen
        set network.freifunk.ifname="bat0"                # Enhaelt als Bridge bat0 und den Freifunk-AP (siehe wireless)
        set network.freifunk.type='bridge'              
        set network.freifunk.proto='none'               # Keine IP usw. setzen.
        set network.freifunk.auto='1'
        
        set network.mesh='interface'                    # Mesh als Interface im System bekannt machen
        set network.mesh.proto='batadv'                 # Nutze batman-adv
        set network.mesh.mtu='1532'                     # MTU ist seit batman-adv 2014.0: 1532 Bytes
        set network.mesh.mesh='bat0'                    # Nutze das bat0 Interface fuer das Mesh
        commit network
EOF
/etc/init.d/network restart

