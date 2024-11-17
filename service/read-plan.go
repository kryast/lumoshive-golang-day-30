package service

import "day-30/model"

func (s *TravelService) GetPlansByTravelID(id int) ([]model.Plan, error) {

	plans, err := s.travelRepo.GetPlansByTravelID(id)
	if err != nil {
		return []model.Plan{}, err
	}
	return plans, nil
}
