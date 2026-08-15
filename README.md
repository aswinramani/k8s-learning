# k8s-learning

Day 1: Learnt about replicaSet type using nginx-rs yaml example. 
Day 2: Learnt how to set role, service account, bind role to service account using rolebinding, added script to generate yaml file and validated by running apply -f with dry run mode. Yaml is valid. 

Service account => Permissions that apps like argo, prometheus, flux require to do their job. 

kubectl create serviceaccount <serviceaccountname> --namespace=<namespacename> --dry-run=client -o yaml >> <dirfilepathyamlfilename>

kubectl create => is imperative 
kubectl apply -f => is declarative