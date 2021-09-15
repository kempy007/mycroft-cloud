# mycroft-cloud
Mycroft AI in cloud via SIP

# local build
docker built -t "mcc:latest" .
docker run -it --rm --entrypoint=/bin/bash mcc:latest

# Issues
- [ ] baresipy fails to connect [upstream log](https://github.com/JarbasSkills/skill-voip/issues/7)
  - [x] create /root/.baresip/accounts
  - [x] test 'baresip' Failed (log matches that of baresipy log error)
  - [x] test 'baresip -f /root/.baresip' Worked
- [ ] PulseAudio server in container
  - https://askubuntu.com/questions/633674/virtual-audio-cable-for-ubuntu
- [ ] Remove creds and rotate keys.


## References
- https://community.mycroft.ai/t/mycroft-as-sip-client-smart-voice-enabled-ivr/6736/3
- https://github.com/JarbasSkills/skill-voip
- https://github.com/OpenJarbas/baresipy
- https://github.com/baresip/baresip
- https://github.com/baresip/re
- https://github.com/baresip/rem
- https://hub.docker.com/r/mycroftai/docker-mycroft (intended to be used as client in container to attach to host audio)
- https://github.com/MycroftAI/docker-mycroft.git
- https://account.mycroft.ai/
- https://app.sipgate.com/
- https://github-wiki-see.page/m/mviereck/x11docker/wiki/Container-sound:-ALSA-or-Pulseaudio
- https://github-wiki-see.page/m/baresip/baresip/wiki/Accounts

# ls /usr/local/lib/baresip/modules
account.so   b2bua.so      dtls_srtp.so  httpd.so    mixausrc.so   portaudio.so    stdio.so       v4l2.so
alsa.so      cons.so       ebuacip.so    httpreq.so  mixminus.so   presence.so     stun.so        vidbridge.so
aubridge.so  contact.so    echo.so       ice.so      multicast.so  rtcpsummary.so  syslog.so      vidinfo.so
aufile.so    ctrl_dbus.so  evdev.so      jack.so     mwi.so        selfview.so     turn.so        vidloop.so
auloop.so    ctrl_tcp.so   fakevideo.so  l16.so      natpmp.so     serreg.so       uuid.so        vumeter.so
ausine.so    debug_cmd.so  g711.so       menu.so     netroam.so    srtp.so         v4l2_codec.so