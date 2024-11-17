package repository

import (
	"day-30/model"
)

func (r *TravelRepositoryDB) GetPlansByTravelID(id int) ([]model.Plan, error) {
	// Query untuk mengambil plans berdasarkan travel_id
	query := `
        SELECT p.id, p.title, p.detail
        FROM plans p
        JOIN travel_plans tp ON p.id = tp.plan_id
        WHERE tp.travel_id = $1
    `

	// Menjalankan query
	rows, err := r.DB.Query(query, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var plans []model.Plan

	// Loop untuk mengambil semua rencana (plans) yang terkait dengan travel_id
	for rows.Next() {
		var plan model.Plan
		err := rows.Scan(&plan.ID, &plan.Title, &plan.Detail)
		if err != nil {
			return nil, err
		}
		plans = append(plans, plan)
	}

	// Mengembalikan daftar plans
	return plans, nil
}
