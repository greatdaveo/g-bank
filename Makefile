postgres: 
	docker run --name root -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres:12-alpine

createdb: 
	docker exec -it root createdb --username=postgres --owner=postgres g-bank

dropdb: 
	docker exec -it root dropdb --username=postgres g-bank

migrateup: 
	migrate -path db/migration -database "postgresql://postgres:mysecretpassword@localhost:5432/g-bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:mysecretpassword@localhost:5432/g-bank?sslmode=disable" -verbose down

sqlc: 
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown
