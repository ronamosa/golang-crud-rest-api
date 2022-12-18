# GOLANG REST API with GORM

Building on [Mukesh Murugan's](https://codewithmukesh.com/blog/implementing-crud-in-golang-rest-api/) blog and code to learn about and explore API's in Golang.

## Description

This is a basic REST API, that uses Gorilla Mux (routing), GORM (database) and Viper (config) and MySQL to CRUD (create, read, update, delete) "Products". The goal is to park this here as reference to come back to and iterate on, and use as demo applications for infrastructure patterns and other cloud solution architectures in future.

## Getting Started

### Dependencies

Project build and run with the following:

* [Go](https://go.dev/dl/)
* MySQL (version used: `mysql  Ver 8.0.31-0ubuntu0.22.04.1 for Linux on x86_64 ((Ubuntu))`)
* [https://github.com/gorilla/mux](https://github.com/gorilla/mux)
* [gorm.io/gorm](gorm.io/gorm)
* [gorm.io/driver/mysql](gorm.io/driver/mysql)
* [github.com/spf13/viper](github.com/spf13/viper)

## Setup

### Database

Setup MySQL

```bash
sudo apt install -y mysql-server
```

### fix root login

if you run `mysql_secure_installation` and get an error, try this fix:

login as root: `sudo mysql`

```sh
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
Query OK, 0 rows affected (0.08 sec)
```

then run, `sudo mysql_secure_installation` set password as `password`.

### create database

create the necessary database the API needs to connect to:

```sh
# mysql -U root -p
CREATE DATABASE products;
```

Run the following commands after cloning this repo to get started:

```bash
git clone https://github.com/ronamosa/golang-crud-rest-api

cd golang-crud-rest-api
go build .
```

### update config.json

Update `~/config.json` with your database credentials to connect your API.

### Run program

```sh
go run .
```

open `http://localhost:8080/api/products` to see the products in your database.

Note: run `scripts/data.sh` if you want to populate the database with mock data to test.

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

* Thanks [Mukesh] for the blog & code to get this project started.