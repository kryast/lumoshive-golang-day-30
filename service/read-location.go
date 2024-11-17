package service

import "day-30/model"

func (s *TravelService) GetLocationByTravelID(id int) (*model.Location, error) {

	locations, err := s.travelRepo.GetLocationByTravelID(id)
	if err != nil {
		return &model.Location{}, err
	}
	return locations, nil
}
