if [ -z "$1" ]
then
echo ./netinterfaces interface address netmask gateway
fi
if [ -n "$1" ]
then
interface=$1
address=$2
netmask=$3
gateway=$4
if [ "$5" == "redhat" ]
then
echo "DEVICE=$interface
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=none
IPADDR=$address
NETMASK=$netmask
GATEWAY=$gateway
IPV4_FAILURE_FATAL=yes
NAME="System $interface""
fi
if [ -z "$5" ]
then
echo "auto "$interface"
iface "$interface" inet static
    address "$address"
    netmask "$netmask"
    gateway "$gateway"
    dns-nameservers 8.8.8.8 8.8.4.4"
fi
fi

