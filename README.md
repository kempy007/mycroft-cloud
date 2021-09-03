# mycroft-cloud
Mycroft AI in cloud via SIP

# Issues
- [ ] baresipy fails to connect
  - [x] create /root/.baresip/accounts
  - [x] test 'baresip' Failed (log matches that of baresipy log error)
  - [x] test 'baresip -f /root/.baresip' Worked
- [ ] PulseAudio server in container

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
