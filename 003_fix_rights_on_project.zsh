#!/usr/bin/env  zsh
#
# fix some rights on namespace
#
# you have to be logged as OpenShift cluster admin !!!
# author: Nikolaj Majorov nmajorov@redhat.com
# script should be running with admin rights

DIRNAME=`dirname "$0"`

export KUBE_USERNAME="developer"


# prepare namespace

export NAMESPACE="edb-demo"


echo "show current user"
echo "using project $NAMESPACE"
oc whoami


echo "change to project"
oc project $NAMESPACE


echo 
echo "add user $KUBE_USERNAME as project admin"

oc adm policy add-role-to-user admin $KUBE_USERNAME -n $NAMESPACE

# 
# TODO: check if roles name matching 
# oc get role -n edb-demo
#
#
echo
echo "add to user $KUBE_USERNAME  role cluster-example in namespace $NAMESPACE"

oc adm policy add-role-to-user cluster-example $KUBE_USERNAME --role-namespace $NAMESPACE -n $NAMESPACE


# we need it for a pgadmin container
#
echo "fix rights to be able run  containers with root user"
oc adm policy add-scc-to-user anyuid system:serviceaccount:$NAMESPACE:default










