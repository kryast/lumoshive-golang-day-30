package repository

import (
	"day-30/model"
)

func (r *TravelRepositoryDB) GetPlansByTravelID(id int) ([]model.Plan, error) {
	query := `
        SELECT p.id, p.title, p.detail
        FROM plans p
        JOIN travel_plans tp ON p.id = tp.plan_id
        WHERE tp.travel_id = $1
    `
	rows, err := r.DB.Query(query, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var plans []model.Plan

	for rows.Next() {
		var plan model.Plan
		err := rows.Scan(&plan.ID, &plan.Title, &plan.Detail)
		if err != nil {
			return nil, err
		}
		plans = append(plans, plan)
	}

	return plans, nil
}
