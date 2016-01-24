#!/bin/sh
opkg update
opkg install kmod-batman-adv batctl 
batctl -v
