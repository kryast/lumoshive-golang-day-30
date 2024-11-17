package repository

import (
	"database/sql"
	"day-30/model"
)

func (r *TravelRepositoryDB) GetLocationByTravelID(id int) (*model.Location, error) {
	query := `
        SELECT longitude, latitude
        FROM locations
        WHERE travel_id = $1
    `

	row := r.DB.QueryRow(query, id)

	var location model.Location
	err := row.Scan(&location.Longitude, &location.Latitude)

	if err == sql.ErrNoRows {
		return nil, err
	}
	if err != nil {
		return nil, err
	}

	return &location, nil
}
