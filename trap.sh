#!/usr/bin/env bash

die()
{
    if [ -n "${SLACK_CHANNEL}" ] && [ -n "${SLACK_URL}" ] && [ -n "${SLACK_USERNAME}" ] && [ -n "${SLACK_TEXT}" ]; then
      curl -X POST --data-urlencode "payload={\"channel\": \"#${SLACK_CHANNEL}\", \"username\": \"${SLACK_USERNAME}\", \"text\": \"[$(hostname)] ${SLACK_TEXT}\", \"icon_emoji\": \":ghost:\"}" ${SLACK_URL}
    fi

    bash /run_trap_code.sh

    exit 0
}

trap die TERM

while true
do
    sleep 1
done
