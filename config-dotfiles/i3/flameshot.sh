
#!/bin/bash
flameshot "$@"
sleep 10
pkill flameshot
