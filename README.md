# k8s-learning

Day 1: Learnt about replicaSet type using nginx-rs yaml example. 
Day 2: Learnt how to set role, service account, bind role to service account using rolebinding, added script to generate yaml file and validated by running apply -f with dry run mode. Yaml is valid.

Service account => Permissions that apps like argo, prometheus, flux require to do their job. 

kubectl create serviceaccount <serviceaccountname> --namespace=<namespacename> --dry-run=client -o yaml >> <dirfilepathyamlfilename>

kubectl create => is imperative 
kubectl apply -f => is declarative

k8s stores data in the etcd database. It is lightweight and inspired by Linux's /etc directory — the 'd' in etcd implies distributed.

kubectl apply -f => sends manifest to kube-apiserver, which diffs it against 
etcd's current state and creates or merge-patches accordingly. kubectl never 
talks to etcd directly.


> Cluster will be designed as per this stack: [healthcare-stack-design.md](healthcare-stack-design.md)


day 3 commands kustomize learning 

mkdir -p kustomize/base
mkdir -p kustomize/overlays/dev
mkdir -p kustomize/overlays/prod
kubectl create deployment nginx --image=nginx:latest --dry-run=client -o yaml > kustomize/base/deployment.yaml


kubectl kustomize kustomize/overlays/dev