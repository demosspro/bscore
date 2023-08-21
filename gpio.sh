 #!/bin/bash
 echo "start"
 FLAG1=0
 FLAG2=0
 while true; do
 VAR1=$(gpioget 0 46)
 VAR2=$(gpioget 0 10)

  if [ $VAR1 -eq 0 ] && [ $FLAG1 -eq 1 ]; then 
 echo 0 > /sys/class/gpio/gpio456/value
 echo 456 > /sys/class/gpio/unexport
 echo 0 > /sys/class/gpio/gpio455/value
 echo 455 > /sys/class/gpio/unexport
 echo 0 > /sys/class/gpio/gpio454/value
 echo 454 > /sys/class/gpio/unexport
 echo "WARNING"
 FLAG1=0
 fi
  if [ $VAR2 -eq 0 ] && [ $FLAG2 -eq 1 ]; then 
 echo 0 > /sys/class/gpio/gpio456/value
 echo 456 > /sys/class/gpio/unexport
 echo 0 > /sys/class/gpio/gpio455/value
 echo 455 > /sys/class/gpio/unexport
 echo 0 > /sys/class/gpio/gpio454/value
 echo 454 > /sys/class/gpio/unexport
 echo "WARNING"
 FLAG2=0
 fi
  if [ $VAR1 -eq 1 ] && [ $FLAG1 -eq 0 ]; then 
 echo 456 > /sys/class/gpio/export
 echo 455 > /sys/class/gpio/export
 echo 454 > /sys/class/gpio/export
 FLAG1=1
 echo "OK"
 fi
  if [ $VAR2 -eq 1 ] && [ $FLAG2 -eq 0 ]; then 
 echo 456 > /sys/class/gpio/export
 echo 455 > /sys/class/gpio/export
 echo 454 > /sys/class/gpio/export
 FLAG2=1
 echo "OK"
 fi
 sleep 0.5
 done