#!/usr/bin/env sh

die() {
  echo "${@}"
  exit 1
}

work_dir=`dirname $0`

set -e

[ `pwd` = "$HOME" ] || die "Please run this script from your home directory!"

git submodule init
git submodule update
