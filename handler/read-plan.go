package handler

import (
	"day-30/library"
	"net/http"
)

func (tph *TravelHandler) GetTravelPlansHandler(w http.ResponseWriter, r *http.Request) {
	id := library.GetID(w, r)

	// Panggil fungsi GetPlansByTravelID
	plans, err := tph.travelService.GetPlansByTravelID(id)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	if plans == nil {
		library.Response404(w, "ID Not found")
		return
	}

	library.Response200(w, plans)
}
