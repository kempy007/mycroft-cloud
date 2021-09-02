FROM bitnami/git AS GIT

RUN cd / && git clone https://github.com/JarbasSkills/skill-voip.git && ls

FROM mycroftai/docker-mycroft

COPY --from=GIT /skill-voip /opt/mycroft/skills
RUN 	cd /opt/mycroft/skills \
  && apt-get update \
  && apt-get -y install libre-dev librem-dev baresip ffmpeg \
	&& apt-get -y autoremove \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && /opt/mycroft/bin/mycroft-pip install -r requirements.txt
