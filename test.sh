#!/bin/bash

touch white | touch black

	
id=$(dmesg | tail -n 20 | egrep serial | awk '{print $5}')
cat /etc/mtab | grep media >> /dev/null

if [ $( grep -c $id white ) -ne 0 ];
then
echo "Esta USB esta tosquisíma"
echo "Montaré la memoria"
mount /dev/sdb /media/montado

elif [ $( grep -c $id black ) -ne 0 ];
then
echo "Esta USB esta bloqueada"

else
echo "Es la primera vez que veo este dispositivo"
echo "¿Dónde los quieres mandar?"
echo "1. Mandar a las memorias toscas"
echo "2. Mandar a las memorias feas "

read a

case $a in
(1)
echo "Elegiste mandar a la lista blanca"
echo "$id" >> white
mount /dev/sdb /media/montado
exit
;;
(2)
echo "Elegiste mandar a la lista negra"
echo "id" >> black
exit
;;

esac
fi

