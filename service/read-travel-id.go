package service

import (
	"day-30/model"
)

func (s *TravelService) GetTravelByID(id int) (model.Travel, error) {
	travel, err := s.travelRepo.GetTravelByID(id)
	if err != nil {
		return model.Travel{}, err
	}
	return travel, nil
}
