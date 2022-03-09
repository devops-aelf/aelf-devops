FROM python:3.8.3-slim-buster

RUN apt-get update -y && apt-get install -y ca-certificates openssh-client openssl sshpass

COPY requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt

RUN mkdir -p /opt/tools

COPY entrypoint.sh /opt/tools/entrypoint.sh
RUN chmod +x /opt/tools/entrypoint.sh

COPY ssh_deploy.py /opt/tools/ssh_deploy.py
RUN chmod +x /opt/tools/ssh_deploy.py

ENTRYPOINT ["/opt/tools/entrypoint.sh"]
