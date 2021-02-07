#/bin/bash
EXISTS=`ps aux | grep kill-gjs.sh | wc -l`
if [ "$EXISTS" -lt 4 ]; then
    while true
    do
        killall -9 gjs &> /dev/null
        sleep 60
    done
fi
