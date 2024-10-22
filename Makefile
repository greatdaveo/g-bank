postgres: 
	docker run --name gbank_postgres_container -e POSTGRES_PASSWORD=mysecretpassword -p 5433:5432 -d postgres:12-alpine

createdb: 
	docker exec -it gbank_postgres_container createdb --username=postgres --owner=postgres g-bank

dropdb: 
	docker exec -it gbank_postgres_container dropdb --username=postgres g-bank

migrateup: 
	migrate -path db/migration -database "postgresql://postgres:mysecretpassword@localhost:5433/g-bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:mysecretpassword@localhost:5433/g-bank?sslmode=disable" -verbose down

sqlc: 
	sqlc generate

test: 
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc
