


if ! systemctl status docker | grep running &> /dev/null; then
		echo "[Francinette] Starting Docker..."
		sleep 1
		exec "/bin/zsh"
fi
if ! docker image ls | grep francinette-image &> /dev/null; then
		echo "[Francinette] Loading the docker container"
		docker load < /home/marmarti/francinette-image/francinette.tar
		exec "/bin/zsh"
fi
if ! docker ps | grep "francinette-image" &> /dev/null; then
	if ! docker ps | grep "run-paco" &> /dev/null; then
    docker run -d -i -v /home:/home -v /goinfre:/goinfre -v /home/marmarti/francinette-image/logs:/francinette/logs-t --name run-paco francinette-image /bin/bash
else
    docker start run-paco
fi

fi
alias francinette=/home/marmarti/francinette-image/run.sh

alias paco=/home/marmarti/francinette-image/run.sh
