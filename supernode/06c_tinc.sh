#!/bin/sh
# Git konfigurieren - Anpassen (!)
git config --global user.name "Frank Nord"
git config --global user.email "frank.nord@mailbox.org"

# Public Key erstellen
tincd -n kbubackbone -K 

# Patch erstellen
cd /etc/tinc/kbubackbone/hosts/
git add mein_neuer_supernode
git commit -a -m "Added mein_neuer_supernode"
git format-patch HEAD~..HEAD -o /tmp/
cat /tmp/0001-Added-mein_neuer_supernode.patch
# /tmp/0001-Added-mein_neuer_supernode.patch

