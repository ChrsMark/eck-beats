#________________________________________________________________________
#PART_1
#------------------------------------------------------------------------
kubectl apply -f all-in-one.yaml
kubectl -n elastic-system logs -f statefulset.apps/elastic-operator
kubectl apply -f 0_ns.yaml
kubectl apply -f 1_monitor.yaml

watch -n 0.5 kubectl get all -n beats 
watch -n 0.5 kubectl get elasticsearch,kibana -n beats 
kubectl get elasticsearch -n beats

--> edit config to scale cluster

kubectl port-forward -n beats service/monitor-kb-http 5601
echo `kubectl get secret monitor-es-elastic-user -o=jsonpath='{.data.elastic}' -n beats | base64 --decode`
https://localhost:5601/


#_________________________________________________________________________
#PART_2
#_________________________________________________________________________
kubectl apply -f 2_filebeat-kubernetes.yaml
kubectl apply -f 3_metricbeat-kubernetes.yaml

#__________________________________________________________________________
#PART_3
#__________________________________________________________________________
cat node-exporter.yaml
kubectl apply -f node-exporter.yaml
#prometheus.metrics.node_procs_running
# prometheus.metrics.node_filesystem_device_error
cat nats.yaml
kubectl apply -f nats.yaml
#show dashboards
#___________________________________________________________________________
