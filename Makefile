postgres:
	docker run --name postgres32 -p 2020:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

createdb:
	docker exec -it postgres32 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres32 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:2020/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:2020/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown