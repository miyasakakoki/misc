#!/bin/bash

SITE="rateaj/chartjson/USDJPY_i_bid.json"
while sleep 3600; do
	curl -s ${SITE} |
		sed -n -e "s/\"currency[^,]*,//; s/yyyyMMddHHmm/time/g; 1d; \$d; /\]/d; p" |
			sed -n -e " /`date +%Y%m%d%H%M -d"-1hour"`/,\$ p" >> `date +%Y`-1m.txt
done

