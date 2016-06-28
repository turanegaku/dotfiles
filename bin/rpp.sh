#!/bin/bash

# usage
function usage(){
  cat << EOS
Usage: `basename $0` [options]

Options:
  -h        show help
  -b        build only
  -f        build force
  -g        build gdb
EOS
}
[[ $1 == '-h' ]] && usage && exit 2

# check exist cpp file
ls *.cpp > /dev/null || exit 1

# get most new file
name=`ls -t *.cpp | head -n 1`
md5=`md5 -q $name`

# if -g build only
if [[ $* =~ '-g' ]]; then
  echo gbuild $name
  g++ -std=c++11 -g3 $name
  exit 0
fi

# check prebuild file
prebuild="`dirname $0`/.prebuild"
[ -e $prebuild ] && pmd5=`cat $prebuild`

# build if different prebuild or -f
if [[ $pmd5 != $md5 || $* =~ '-f' ]]; then
  echo build $name
  if [[ $* =~ '-d' ]]; then
    g++ -std=c++11 -D_GLIBCXX_DEBUG $name || exit 1
  else
    g++ -std=c++11 $name || exit 1
  fi
  echo $md5 > $prebuild
  if [[ $* =~ '-b' ]]; then
    exit 0
  fi
fi
echo run $name
./a.out
