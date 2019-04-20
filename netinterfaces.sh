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
echo "auto "$interface"
iface "$interface" inet static
    address "$address"
    netmask "$netmask"
    gateway "$gateway"
    dns-nameservers 8.8.8.8 8.8.4.4"
fi
