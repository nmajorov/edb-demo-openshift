#!/usr/bin/env  zsh
#
# install pgadmin with helm

# helm has to be installed
#
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
echo "add pgadmin repo"
helm repo add cetic https://cetic.github.io/helm-charts
helm repo update


echo "install pgadmin"

helm install  pgadmin cetic/pgadmin --version 0.1.12 --values $DIRNAME/values-pgadmin.yaml

echo "YOU need to expose svc pgadmin for external access"

# not working on my cluster as https only allowed
# oc expose svc pgadmin


