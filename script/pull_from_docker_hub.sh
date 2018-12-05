KUBE_VERSION=v1.12.1
KUBE_PAUSE_VERSION=3.1
ETCD_VERSION=3.2.24
DNS_VERSION=1.14.8
COREDNS_VERSION=1.2.2
DASHBOARD_VERSION=v1.10.0
HEAPSTER_VERSION=v1.5.4
GRAFANA_VERSION=v5.0.4
influxdb_VERSION=v1.5.2
GCR_URL=k8s.gcr.io
HUB=gcrxio

images=(kube-proxy:${KUBE_VERSION}
kube-scheduler:${KUBE_VERSION}
kube-controller-manager:${KUBE_VERSION}
kube-apiserver:${KUBE_VERSION}
kube-proxy:${KUBE_VERSION}
pause:${KUBE_PAUSE_VERSION}
etcd:${ETCD_VERSION}
coredns:${COREDNS_VERSION}
kubernetes-dashboard-amd64:${DASHBOARD_VERSION}
heapster-influxdb-amd64:${influxdb_VERSION}
heapster-amd64:${HEAPSTER_VERSION}
heapster-grafana-amd64:${GRAFANA_VERSION}
)


for imageName in ${images[@]} ; do
  docker pull $HUB/$imageName
  docker tag  $HUB/$imageName $GCR_URL/$imageName
  docker rmi $HUB/$imageName
done

docker images
