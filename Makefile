run-project:
	# run project
	@echo "Grafana UI: http://localhost:3000"

start-project:
	docker compose -p exam up -d --build --force-recreate

stop-project:
	docker compose -p exam down

build-api:
	docker build -t api-v1 -f ./src/api/v1/Dockerfile .

run-api:
	docker run --rm -d --name api-v1 -p 8000:8000 api-v1

stop-api:
	docker stop api-v1

logs-api:
	docker compose -p exam logs api-v1

test-api:
	curl -X POST "http://localhost/predict" \
     -H "Content-Type: application/json" \
     -d '{"sentence": "Oh yeah, that was soooo cool!"}' \
	 --user admin:admin \
     --cacert ./deployments/nginx/certs/nginx.crt;
