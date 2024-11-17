package main

import (
	"day-30/database"
	"day-30/handler"
	"day-30/repository"
	"day-30/service"
	"fmt"
	"net/http"

	"github.com/go-chi/chi"
)

func main() {
	db, err := database.InitDB()
	if err != nil {
		panic(err)
	}
	defer db.Close()

	repoTravel := repository.NewTravelRepository(db)
	TravelService := service.NewTravelService(repoTravel)
	TravelHandler := handler.NewTravelHandler(TravelService)

	repoTransaction := repository.NewTransactionRepository(db)
	TransactionService := service.NewTransactionService(repoTransaction)
	TransactionHandler := handler.NewTransactionHandler(TransactionService)

	r := chi.NewRouter()

	r.Get("/travel", TravelHandler.GetTravelHandler)
	r.Get("/travel/{id}", TravelHandler.GetTravelByIDHandler)
	r.Post("/travel/{id}", TransactionHandler.CreateTransactionHandler)
	r.Get("/travel/{id}/plans", TravelHandler.GetTravelPlansHandler)

	r.Handle("/assets/*", http.StripPrefix("/assets/", http.FileServer(http.Dir("assets"))))

	fmt.Println("Server started on port 8080")
	http.ListenAndServe(":8080", r)
}
