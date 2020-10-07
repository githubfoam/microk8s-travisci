FROM jenkins/jenkins:2.147-slim

#Memory settings
ENV JAVA_OPTS="-Xmx8192m -"

#Connection pool
ENV JENKINS_OPTS=" --handlerCountMax=300"


# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

RUN /usr/local/bin/install-plugins.sh slack

RUN /usr/local/bin/install-plugins.sh simple-theme-plugin

RUN /usr/local/bin/install-plugins.sh greenballs

RUN /usr/local/bin/install-plugins.sh kubernetes

RUN /usr/local/bin/install-plugins.sh configuration-as-code

RUN /usr/local/bin/install-plugins.sh workflow-aggregator

RUN /usr/local/bin/install-plugins.sh docker-plugin

RUN /usr/local/bin/install-plugins.sh docker-workflow

RUN /usr/local/bin/install-plugins.sh git

RUN /usr/local/bin/install-plugins.sh github


RUN groupadd docker && usermod -a -G docker jenkins


USER jenkins