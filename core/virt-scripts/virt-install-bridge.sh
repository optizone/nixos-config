#!/usr/bin/env bash

BRIDGE='<network>
  <name>bridge</name>
  <forward mode="bridge" />
  <bridge name="br0" />
</network>'

echo "$BRIDGE" >.__bridge_xml__.tmp

virsh --connect qemu:///system net-define .__bridge_xml__.tmp
virsh --connect qemu:///system net-start bridge

rm .__bridge_xml__.tmp
