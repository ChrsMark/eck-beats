# eck-beats

This repo holds the ECK-Beats demo.

Outline:
- Deploy Filebeat  daemonset reporting container logs to the monitoring cluster
- Deploy Metricbeat both as daemonset and deployment reporting k8s metrics to the monitoring cluster
- Deploy a prometheus node-exporter pod and see autodiscover with hints in action
- Build a visualization on the fly on prometheus.metrics.node_procs_running metric that is collected by the Prometheus module
- Deploy a NATS server with annotations and see the populated prebuilt dashboard in Kibana
