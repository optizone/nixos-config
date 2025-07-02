#!/usr/bin/env bash

BRIDGE="<hostdev mode='subsystem' type='usb' managed='yes'>
  <source>
    <vendor id='$1'/>
    <product id='$2'/>
  </source>
</hostdev>"

echo "$BRIDGE" >.__bridge_xml__.tmp

virsh --connect qemu:///system net-define .__bridge_xml__.tmp
virsh --connect qemu:///system net-start bridge

rm .__bridge_xml__.tmp
