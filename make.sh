#!/bin/bash
set -e

function build {
  docker --version
  cdir="$PWD"
  
  basename="$1"
  version="$2"
  namespace="$3"
  
  tag=""  
  buildArgs=""
  if [ "$namespace" != "" ];
  then
    tag="${namespace}/"
    buildArgs="--build-arg NAMESPACE=${namespace}/"
  fi
  tag="${tag}${basename}:${version}"
     

  cd $version
  cmd="docker build --compress $buildArgs --tag $tag ."
  echo "$cmd"
  eval "$cmd"
  cd "$cdir"
}

function deploy {
  docker --version
  basename=$1
  version=$2
  namespace=$3
  user=$4
  key=$5
  registry=$6
  docker login -u $user -p $key $registry
  docker push $namespace/$basename:$version
}


# Usage:
# basename="buildenv-jme3"
# version="android"
# registry="..."
# user="..."
# password="..."
# ./make.sh build $basename $version [$namespace]
# ./make.sh deploy $basename $version $namespace $user $password $registry

$@


