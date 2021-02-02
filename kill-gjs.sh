#/bin/bash
EXISTS=`ps aux | grep kill-gjs | wc -l`
if [ "$EXISTS" -lt 2 ]; then
    while true
    do
        killall -9 gjs &> /dev/null
        sleep 60
    done
fi
