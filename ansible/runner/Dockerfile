FROM python:slim

RUN apt-get update -qq && \
    apt-get install less && \
    apt-get install openssh-client -y && \
    apt-get install sshpass -y && \
    apt-get install git -y && \
    apt-get clean && \
    rm -rf /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN python3 -m pip install ansible ansible-core
    
LABEL runner="ansible-runner"

ENV USER runner
ENV FOLDER /home/runner
RUN /usr/sbin/groupadd $USER && \
    /usr/sbin/useradd $USER -m -d $FOLDER -g $USER -s /bin/bash && \
    echo $USER 'ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN for dir in \
      /usr/share/ansible/roles \
      /ansible ; \
    do mkdir -p $dir ; chown -R $USER:$USER $dir; chmod -R 775 $dir ; done

USER $USER

WORKDIR /ansible