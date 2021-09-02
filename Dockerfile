FROM bitnami/git AS GIT

RUN cd / && git clone https://github.com/JarbasSkills/skill-voip.git && ls

FROM mycroftai/docker-mycroft

ENV PULSE_SERVER unix:/tmp/pulse/native 

COPY --from=GIT /skill-voip /opt/mycroft/skills/skill-voip

RUN 	mkdir /root/.mycroft && mkdir /root/.mycroft/identity && cd /opt/mycroft/skills/skill-voip \
  && apt-get update \
  && apt-get -y install libre-dev librem-dev baresip ffmpeg \
	&& apt-get -y autoremove \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && /opt/mycroft/bin/mycroft-pip install -r requirements.txt
  
COPY identity2.json /root/.mycroft/identity
