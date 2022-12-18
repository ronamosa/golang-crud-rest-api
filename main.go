package main

import (
	"crud-rest-api/controllers"
	"crud-rest-api/database"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func RegisterProductRoutes(router *mux.Router) {
	router.HandleFunc("/api/products", controllers.GetProducts).Methods("GET")
	router.HandleFunc("/api/products/{id}", controllers.GetProductsById).Methods("GET")
	router.HandleFunc("/api/products", controllers.CreateProducts).Methods("POST")
	router.HandleFunc("/api/products/{id}", controllers.UpdateProducts).Methods("PUT")
	router.HandleFunc("/api/products/{id}", controllers.DeleteProducts).Methods("DELETE")
}

func main() {
	// Load config.json using Viper
	LoadAppConfig()

	// Init Database
	database.Connect(AppConfig.ConnectionString)
	database.Migrate()

	// Init router
	router := mux.NewRouter().StrictSlash(true)

	// Register Routes
	RegisterProductRoutes(router)

	// Start Server
	log.Println(fmt.Sprintf("Starting Server on port %s", AppConfig.Port))
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%v", AppConfig.Port), router))
}
