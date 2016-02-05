# A disposable development environment for java, python, and c++

FROM project5/dev-ubuntu:latest
USER root

MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -y \
      python-pip python-dev

RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl

# non-root user for running things and x forwarding
USER docker

#CMD /opt/idea/bin/idea.sh > /dev/null 2>&1
#CMD /opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#CMD /opt/clion/bin/clion.sh > /dev/null 2>&1
CMD bash
