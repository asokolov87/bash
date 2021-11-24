#!/bin/bash
ALLTRUNKSSTRING="`/usr/sbin/asterisk -rx "sip show registry"`"
ALLTRUNKS=`echo "$ALLTRUNKSSTRING" |grep "SIP registrations" |awk '{print $1}'`
REGTRUNKS=`/usr/sbin/asterisk -rx "sip show registry" |grep Registered |wc -l`
#echo $ALLTRUNKS
#echo $REGTRUNKS
if [ "$REGTRUNKS" != "$ALLTRUNKS" ]; then
sleep 1
echo `/usr/sbin/asterisk -rx "sip reload"`
#sleep 5
#VAR=`/usr/sbin/asterisk -rx "sip show registry"`
#echo $VAR
else
echo 'ALL STATUS OK'
fi
