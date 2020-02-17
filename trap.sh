#!/usr/bin/env bash

die()
{
    echo "Running the trap..."

    RESULT=$(bash /run_trap_code.sh)

    if [ -n "${SLACK_CHANNEL}" ] && [ -n "${SLACK_URL}" ] && [ -n "${SLACK_USERNAME}" ]; then
      curl -X POST --data-urlencode "payload={\"channel\": \"#${SLACK_CHANNEL}\", \"username\": \"${SLACK_USERNAME}\", \"text\": \"[$(hostname)] ${RESULT}\", \"icon_emoji\": \":ghost:\"}" ${SLACK_URL};
    fi

    exit 0
}

trap die SIGTERM

while true
do
    sleep 1
done
