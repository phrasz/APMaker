@echo off
rem APStatus v1 2013-09-16
cls
rem Source: http://www.network-science.de/ascii/
echo "----------------------------------------------------------------"
echo " ______  ____    ____    __             __                      "
echo "/\  _  \/\  _`\ /\  _`\ /\ \__         /\ \__                   "
echo "\ \ \L\ \ \ \L\ \ \,\L\_\ \ ,_\    __  \ \ ,_\  __  __    ____  "
echo " \ \  __ \ \ ,__/\/_\__ \\ \ \/  /'__`\ \ \ \/ /\ \/\ \  /',__\ "
echo "  \ \ \/\ \ \ \/   /\ \L\ \ \ \_/\ \L\.\_\ \ \_\ \ \_\ \/\__, `\"
echo "   \ \_\ \_\ \_\   \ `\____\ \__\ \__/.\_\\ \__\\ \____/\/\____/"
echo "    \/_/\/_/\/_/    \/_____/\/__/\/__/\/_/ \/__/ \/___/  \/___/ "
echo "----------------------------------------------------------------"
                                                                
netsh wlan show hostednetwork                   
netsh wlan show hostednetwork setting=security