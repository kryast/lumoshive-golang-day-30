package handler

import (
	"day-30/library"
	"net/http"
)

func (tph *TravelHandler) GetLocationByTravelID(w http.ResponseWriter, r *http.Request) {
	id := library.GetID(w, r)

	locations, err := tph.travelService.GetLocationByTravelID(id)

	if err != nil {
		library.Response404(w, "ID Not found")
		return
	}

	library.Response200(w, locations)
}
