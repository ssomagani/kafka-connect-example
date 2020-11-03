----------------
--- Setup ---
docker pull voltdb/voltdb-------
docker tag voltdb/voltdb------- us.gcr.io/${PROJECT_ID}/----
docker push us.gcr.io/${PROJECT_ID}/----

-----------------
--- Run ---
curl -X POST -H "Authorization: Bearer "$(gcloud auth application-default print-access-token) -H "Content-Type: application/json" -d @cluster.yaml https://container.googleapis.com/v1beta1/projects/fourth-epigram-293718/zones/us-east4-a/clusters

gcloud container clusters list

gcloud container clusters get-credentials kipling-cluster --zone us-east4-a --project fourth-epigram-293718

kubectl create configmap voltdb-config --from-file ../configMap/
kubectl create -f voltdb.yaml


----------------
--- Validation ---
kubectl get pods
kubectl describe pod voltdb-----------
kubectl exec -it voltdb bash
gcloud compute ssh <instance_name> --zone=<instance_zone>

----------------
--- Destroy ---
kubectl delete -f deployment.yaml