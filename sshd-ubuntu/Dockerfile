# A disposable development environment for java, python, and c++

FROM ubuntu:latest
RUN useradd -m docker
RUN apt-get update && apt-get install -y \
      vim \
      git ssh rsync \
      python
      
# non-root user for running things and x forwarding
USER docker

#CMD /opt/idea/bin/idea.sh > /dev/null 2>&1
#CMD /opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#CMD /opt/qtcreator/bin/qtcreator > /dev/null 2>&1
CMD bash
