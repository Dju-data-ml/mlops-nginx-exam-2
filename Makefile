run-project:
	# run project
	@echo "Grafana UI: http://localhost:3000"

start-project:
	# start project api
	docker compose -p exam up -d --build --force-recreate

stop-project:
	# stop project api
	docker compose -p exam down

logs-project:
	# show project logs
	docker compose -p exam logs

test-api:
	# Run a simple test
	curl -X POST "http://localhost/predict" \
     -H "Content-Type: application/json" \
     -d '{"sentence": "Oh yeah, that was soooo cool!"}' \
	 --user admin:admin \
     --cacert ./deployments/nginx/certs/nginx.crt;

test-project:
	# Run all the tests
	./tests/run_tests.sh