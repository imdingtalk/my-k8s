
kubeadm init --config kubeadm-init.yaml
if [ -d ~/.kube ];then
rm -rf ~/.kube
fi
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

#kubectl命令自动补全
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
#部署网络
kubectl apply -f net/

kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl apply -f heapster/

kubectl apply -f dashboard/
