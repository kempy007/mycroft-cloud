FROM bitnami/git AS GIT

RUN cd / && git clone https://github.com/JarbasSkills/skill-voip.git && ls

FROM mycroftai/docker-mycroft

ENV PULSE_SERVER unix:/var/run/pulse/native 

COPY --from=GIT /skill-voip /opt/mycroft/skills/skill-voip

RUN cd /root && git clone https://github.com/baresip/re.git \
  && git clone https://github.com/baresip/rem.git \
  && git clone https://github.com/baresip/baresip.git \
  && cd re && make && make install && ldconfig \
  && cd .. && cd rem && make && make install && ldconfig \
  && cd .. && cd baresip && make && make install

# libre-dev librem-dev baresip
RUN 	mkdir /root/.mycroft && mkdir /root/.mycroft/identity && cd /opt/mycroft/skills/skill-voip \
  && mkdir /root/.baresip && echo "<sip:REDACTED@sipgate.co.uk>;auth_pass=REDACTED" > /root/.baresip/accounts \
  && apt-get update \
  && apt-get -y install nano mplayer vlc ffmpeg \
	&& apt-get -y autoremove \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && /opt/mycroft/bin/mycroft-pip install -r requirements.txt
# TODO: seems 'baresip -f /root/.baresip' work but 'baresip' does not and has same error in logs when invoked by skill. pulseaudio also has no devices, seems to rely on host system mapping in snd device and volumes.
# TODO: Remove creds and rotate keys.

COPY identity2.json /root/.mycroft/identity
