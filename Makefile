TAG=random-selector-to-mattermost:0.0.1
# DROW_TIME="1992-04-18 12:00:00"
DRAW_TIME=today
port=5000
TZ=Asia/Taipei
HOOKS=https://raywu60kg.github.io

activate ::
	gunicorn -w 4 --log-config config/logging.conf -c config/gunicorn_config.py src.app:app

build ::
	docker build -t=${TAG} ./

run::
	docker run --rm -it -e DROW_TIME=${DROW_TIME} -e TZ=${TZ} -e HOOKS=${HOOKS} -p ${port}:5000 random-selector-to-mattermost:0.0.1

get-time-info ::
	curl localhost:5000/time_info

add-candidate ::
	curl -X POST -H "Content-Type: application/json" -d '${data}' localhost:5000/lunch_candidate

check-candidate ::
	curl localhost:5000/lunch_candidate

get-result ::
	curl localhost:5000/result

health ::
	curl localhost:5000/health

force-draw ::
	curl -X POST localhost:5000/draw


	

