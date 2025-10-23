#!/bin/sh

U=`whoami`
N=$((RANDOM%10+5))
if [ _$1 = _commit ]
then
  if [ _$3 = _ ]
  then
    echo "fatal: please specify a commit message"
  else
    echo "[master ea57c8c] $3"
    sleep 0.2
    echo " Committer: <$U@r04p06.prog.sm.cri.epita.fr>"
    sleep 0.5
    printf "$N files changed, $((RANDOM%300+50)) insertions, $((RANDOM%200+20)) deletions\n"
    P=`pwd`
    sleep 0.1
    echo "create mode $((RANDOM)) $P"
  fi
elif [ _$1 = _push ]
then
  printf "\033[36mWelcome @$U from 10.100.123.85\033[37m\n"
  sleep 0.9
  echo "Enumerating objects: $N, done."
  sleep 0.1
  echo "Counting objects: 0% (0/$N)"
  sleep 0.5
  echo "Total $N (delta 4), reused 0 (delta 0), pack-reused 0"
  echo
  echo remote:
  sleep 2
  printf "remote: \033[31mPush to remote failed.\033[37m\n"
  sleep 0.3
  echo "fatal: unable to verify package integrity of data upload."
  sleep 0.8
  echo "Caused by: git.forge.epita.fr.SdkClientException: Unable to verify integrity of data upload. Computed content hash (contentMD5: undefined) didn't match hash from git.forge.epita.fr"
  sleep 0.03
  echo "        at git.forge.epita.fr.uploadObject()"
  sleep 0.03
  echo "        at git.forge.epita.fr.putObject()"
fi
