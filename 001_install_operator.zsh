#!/usr/bin/env  zsh
#
# install edb operator in namespace
# author: Nikolaj Majorov nmajorov@redhat.com
# script should be running with admin rights

DIRNAME=`dirname "$0"`


# prepare namespace

export NAMESPACE="edb-demo"


echo "show current user"
echo "using project $NAMESPACE"
oc whoami

echo "create namespace"

oc new-project $NAMESPACE

echo "change to project"
oc project $NAMESPACE



# install operator with a cli
# see more info https://docs.openshift.com/container-platform/4.12/operators/admin/olm-adding-operators-to-cluster.html
#
echo "install operator"
echo

cat "$DIRNAME/edb-operator-group.yaml" | sed -e "s/edb-demo/$NAMESPACE/g" 


cat "$DIRNAME/edb-operator-group.yaml" | sed -e "s/edb-demo/$NAMESPACE/g" | oc create -f -

cat "$DIRNAME/cloud-native-postgresql-operator-subscription.yaml" | sed -e "s/edb-demo/$NAMESPACE/g"  | oc create -f -



