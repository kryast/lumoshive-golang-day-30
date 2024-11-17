package service

import (
	"day-30/model"
	"day-30/repository"
)

type TravelService struct {
	travelRepo repository.TravelRepositoryDB
}

func NewTravelService(repo repository.TravelRepositoryDB) TravelService {
	return TravelService{travelRepo: repo}
}

func (s TravelService) GetTravel() ([]model.Travel, error) {
	return s.travelRepo.GetTravel()
}
