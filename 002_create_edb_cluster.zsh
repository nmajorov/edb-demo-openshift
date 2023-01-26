#!/usr/bin/env  zsh
#
# create edb 
# author: Nikolaj Majorov nmajorov@redhat.com
# script should be running with admin rights

DIRNAME=`dirname "$0"`


# prepare namespace

export NAMESPACE="edb-demo"


echo "show current user"
echo "using project $NAMESPACE"
oc whoami


echo "change to project"
oc project $NAMESPACE


echo "create edb-cluster"
echo

oc apply -f  "$DIRNAME/cluster-example.yaml"






