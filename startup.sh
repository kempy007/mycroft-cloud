#!/bin/bash
pulseaudio --system &
source /opt/mycroft/.venv/bin/activate
/opt/mycroft/./start-mycroft.sh all
baresip -f /root/.baresip/ -d &

tail -f /var/log/mycroft/*.log
