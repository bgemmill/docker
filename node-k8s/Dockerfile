# Run docker inside docker to simulate a kubernites node
# run with --privileged -P

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update \
  && apt-get install -yq curl software-properties-common \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
  && add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" \
  && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
  && add-apt-repository \
   "deb [arch=amd64] https://apt.kubernetes.io/ kubernetes-xenial main" 
#  cat <<EOF >/etc/apt/sources.list.d/kubernetes.list \
#   deb https://apt.kubernetes.io/ kubernetes-xenial main \
#   EOF

RUN apt-get update

# handle utf8
RUN apt-get install -yq locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

# universe and multiverse
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list

# systemd for signals and zombie process reaping
# kubernites wants systemd for init, but we don't want the autostarting cruft:
# https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/
ENV container docker
RUN apt-get install -yq systemd
#RUN rm -f /lib/systemd/system/*.target.wants/* && rm -f /etc/systemd/system/*.target.wants/*

# kubernites
RUN apt-get install -yq \
  docker-ce kubelet kubeadm kubectl
ENV KUBECONFIG=/etc/kubernetes/admin.conf

# overlayfs is not going to work with docker-in-docker
# https://github.com/docker/for-linux/issues/475
# https://github.com/containerd/containerd/issues/2772
RUN sed -i 's:ExecStartPre=:ExecStartPre=-:' /lib/systemd/system/containerd.service

# kubernites is really opaque about how to run it while swap is enabled
# https://bugs.launchpad.net/kolla-kubernetes/+bug/1737770
# https://github.com/kubernetes/kubeadm/issues/610
RUN sed -i 's:ExecStart=/usr/bin/kubelet:ExecStart=/usr/bin/kubelet --fail-swap-on=false:' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

VOLUME ["/var/lib/docker"]

# https://kubernetes.io/docs/setup/independent/install-kubeadm/#check-required-ports
#EXPOSE 6443
#EXPOSE 8080
#EXPOSE 10250

#RUN apt-get purge -yq software-properties-common curl \
#  && apt-get autoremove -yq \
#  && apt-get autoclean -yq \
#  && rm -rf /var/lib/apt/lists/*

#ENTRYPOINT ["dumb-init"]
ENTRYPOINT ["/sbin/init"]
