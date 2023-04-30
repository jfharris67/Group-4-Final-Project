-- Best and worst airlines by on-time arrival performance:
(
    SELECT
        a.carrier_name,
        COUNT(f.ARR_DEL15) AS total_flights,
        SUM(f.ARR_DEL15) AS delayed_flights,
        (SUM(f.ARR_DEL15) / COUNT(f.ARR_DEL15)) * 100 AS percentage_delayed
    FROM
        Flights f
    JOIN
        Airlines a ON f.OP_UNIQUE_CARRIER = a.carrier
    GROUP BY
        a.carrier_name
    ORDER BY
        percentage_delayed ASC
    LIMIT 10
)
UNION ALL
(
    SELECT
        a.carrier_name,
        COUNT(f.ARR_DEL15) AS total_flights,
        SUM(f.ARR_DEL15) AS delayed_flights,
        (SUM(f.ARR_DEL15) / COUNT(f.ARR_DEL15)) * 100 AS percentage_delayed
    FROM
        Flights f
    JOIN
        Airlines a ON f.OP_UNIQUE_CARRIER = a.carrier
    GROUP BY
        a.carrier_name
    ORDER BY
        percentage_delayed DESC
    LIMIT 10
);


-- Top 10 and worst 10 departure airports by on-time departure performance:
(
    SELECT
        d.airport_name,
        COUNT(f.DEP_DEL15) AS total_flights,
        SUM(f.DEP_DEL15) AS delayed_flights,
        (SUM(f.DEP_DEL15) / COUNT(f.DEP_DEL15)) * 100 AS percentage_delayed
    FROM
        Flights f
    JOIN
        Departure_Airports d ON f.ORIGIN = d.airport
    GROUP BY
        d.airport_name
    ORDER BY
        percentage_delayed ASC
    LIMIT 10
)
UNION ALL
(
    SELECT
        d.airport_name,
        COUNT(f.DEP_DEL15) AS total_flights,
        SUM(f.DEP_DEL15) AS delayed_flights,
        (SUM(f.DEP_DEL15) / COUNT(f.DEP_DEL15)) * 100 AS percentage_delayed
    FROM
        Flights f
    JOIN
        Departure_Airports d ON f.ORIGIN = d.airport
    GROUP BY
        d.airport_name
    ORDER BY
        percentage_delayed DESC
    LIMIT 10
);


-- Top 10 and worst 10 arrival airports by on-time arrival performance:

(
    SELECT
        a.airport_name,
        COUNT(f.ARR_DEL15) AS total_flights,
        SUM(f.ARR_DEL15) AS delayed_flights,
        (SUM(f.ARR_DEL15) / COUNT(f.ARR_DEL15)) * 100 AS percentage_delayed
    FROM
        Flights f
    JOIN
        Arrival_Airports a ON f.DEST = a.airport
    GROUP BY
        a.airport_name
    ORDER BY
        percentage_delayed ASC
    LIMIT 10
)
UNION ALL
(
    SELECT
        a.airport_name,
        COUNT(f.ARR_DEL15) AS total_flights,
        SUM(f.ARR_DEL15) AS delayed_flights,
        (SUM(f.ARR_DEL15) / COUNT(f.ARR_DEL15)) * 100 AS percentage_delayed
    FROM
        Flights f
    JOIN
        Arrival_Airports a ON f.DEST = a.airport
    GROUP BY
        a.airport_name
    ORDER BY
        percentage_delayed DESC
    LIMIT 10
);



-- Top 10 and worst 10 hours of day for on-time arrivals:

WITH formatted_flights AS (
    SELECT
        ARR_DEL15,
        (current_date + ((ARR_TIME / 100)::int * INTERVAL '1 hour') + ((ARR_TIME - floor(ARR_TIME / 100) * 100)::int * INTERVAL '1 minute'))::timestamp AS arrival_timestamp
    FROM Flights
)
(
    SELECT
        EXTRACT(HOUR FROM arrival_timestamp) AS hour_of_day,
        COUNT(ARR_DEL15) AS total_flights,
        SUM(ARR_DEL15) AS delayed_flights,
        (SUM(ARR_DEL15) / COUNT(ARR_DEL15)) * 100 AS percentage_delayed
    FROM
        formatted_flights
    GROUP BY
        hour_of_day
    ORDER BY
        percentage_delayed ASC
    LIMIT 10
)
UNION ALL
(
    SELECT
        EXTRACT(HOUR FROM arrival_timestamp) AS hour_of_day,
        COUNT(ARR_DEL15) AS total_flights,
        SUM(ARR_DEL15) AS delayed_flights,
        (SUM(ARR_DEL15) / COUNT(ARR_DEL15)) * 100 AS percentage_delayed
    FROM
        formatted_flights
    GROUP BY
        hour_of_day
    ORDER BY
        percentage_delayed DESC
    LIMIT 10
);




-- Top 10 and worst 10 time blocks for on-time departures:
    SELECT
        DEP_TIME_BLK,
        COUNT(DEP_DEL15) AS total_flights,
        SUM(DEP_DEL15) AS delayed_flights,
        (SUM(DEP_DEL15) / COUNT(DEP_DEL15)) * 100 AS percentage_delayed
    FROM
        Flights
    GROUP BY
        DEP_TIME_BLK
    ORDER BY
        percentage_delayed ASC
    

