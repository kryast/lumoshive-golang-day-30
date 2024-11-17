package handler

import (
	"day-30/library"
	"day-30/model"
	"net/http"
)

func (h *TravelHandler) GetTravelByIDHandler(w http.ResponseWriter, r *http.Request) {
	id := library.GetID(w, r)

	travel, err := h.travelService.GetTravelByID(id)
	if err != nil {
		library.Response400(w, err.Error())
		return
	}

	if (travel == model.Travel{}) {
		library.Response404(w, "ID Not found")
		return
	}

	library.Response200(w, travel)
}
