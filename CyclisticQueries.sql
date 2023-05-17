
DROP TABLE IF EXISTS #qtr_1;
DROP TABLE IF EXISTS #qtr_2;
DROP TABLE IF EXISTS #qtr_3;
DROP TABLE IF EXISTS #qtr_4;
DROP TABLE IF EXISTS #year_data;

CREATE TABLE #qtr_1 (
ride_id VARCHAR(100) PRIMARY KEY,
rideable_type VARCHAR(100),
started_at SMALLDATETIME,
ended_at SMALLDATETIME,
ride_length TIME,
day_of_week VARCHAR(100),
ride_date DATE,
ride_month VARCHAR(100),
start_station_name VARCHAR(200),
start_station_id VARCHAR(100),
end_station_name VARCHAR(200),
end_station_id VARCHAR(100),
start_lat FLOAT,
start_rad_lat FLOAT,
start_lng FLOAT,
start_rad_lng FLOAT,
end_lat FLOAT,
end_rad_lat FLOAT,
end_lng FLOAT,
end_rad_lng FLOAT,
ride_distance_in_km FLOAT,
ride_distance_in_mi FLOAT,
member_casual VARCHAR(100)
);
CREATE TABLE #qtr_2 (
ride_id VARCHAR(100) PRIMARY KEY,
rideable_type VARCHAR(100),
started_at SMALLDATETIME,
ended_at SMALLDATETIME,
ride_length TIME,
day_of_week VARCHAR(100),
ride_date DATE,
ride_month VARCHAR(100),
start_station_name VARCHAR(200),
start_station_id VARCHAR(100),
end_station_name VARCHAR(200),
end_station_id VARCHAR(100),
start_lat FLOAT,
start_rad_lat FLOAT,
start_lng FLOAT,
start_rad_lng FLOAT,
end_lat FLOAT,
end_rad_lat FLOAT,
end_lng FLOAT,
end_rad_lng FLOAT,
ride_distance_in_km FLOAT,
ride_distance_in_mi FLOAT,
member_casual VARCHAR(100)
);
CREATE TABLE #qtr_3 (
ride_id VARCHAR(100) PRIMARY KEY,
rideable_type VARCHAR(100),
started_at SMALLDATETIME,
ended_at SMALLDATETIME,
ride_length TIME,
day_of_week VARCHAR(100),
ride_date DATE,
ride_month VARCHAR(100),
start_station_name VARCHAR(200),
start_station_id VARCHAR(100),
end_station_name VARCHAR(200),
end_station_id VARCHAR(100),
start_lat FLOAT,
start_rad_lat FLOAT,
start_lng FLOAT,
start_rad_lng FLOAT,
end_lat FLOAT,
end_rad_lat FLOAT,
end_lng FLOAT,
end_rad_lng FLOAT,
ride_distance_in_km FLOAT,
ride_distance_in_mi FLOAT,
member_casual VARCHAR(100)
);
CREATE TABLE #qtr_4 (
ride_id VARCHAR(100) PRIMARY KEY,
rideable_type VARCHAR(100),
started_at SMALLDATETIME,
ended_at SMALLDATETIME,
ride_length TIME,
day_of_week VARCHAR(100),
ride_date DATE,
ride_month VARCHAR(100),
start_station_name VARCHAR(200),
start_station_id VARCHAR(100),
end_station_name VARCHAR(200),
end_station_id VARCHAR(100),
start_lat FLOAT,
start_rad_lat FLOAT,
start_lng FLOAT,
start_rad_lng FLOAT,
end_lat FLOAT,
end_rad_lat FLOAT,
end_lng FLOAT,
end_rad_lng FLOAT,
ride_distance_in_km FLOAT,
ride_distance_in_mi FLOAT,
member_casual VARCHAR(100)
);
CREATE TABLE #year_data (
ride_id VARCHAR(100) PRIMARY KEY,
rideable_type VARCHAR(100),
started_at SMALLDATETIME,
ended_at SMALLDATETIME,
ride_length TIME,
day_of_week VARCHAR(100),
ride_date DATE,
ride_month VARCHAR(100),
start_station_name VARCHAR(200),
start_station_id VARCHAR(100),
end_station_name VARCHAR(200),
end_station_id VARCHAR(100),
start_lat FLOAT,
start_rad_lat FLOAT,
start_lng FLOAT,
start_rad_lng FLOAT,
end_lat FLOAT,
end_rad_lat FLOAT,
end_lng FLOAT,
end_rad_lng FLOAT,
ride_distance_in_km FLOAT,
ride_distance_in_mi FLOAT,
member_casual VARCHAR(100),
);


INSERT
  INTO  #qtr_1 
SELECT *
FROM [Cyclistic Capstone]..['202201-divvy-tripdata$']
UNION
SELECT *
FROM [Cyclistic Capstone]..['202202-divvy-tripdata$']
UNION
SELECT *
FROM [Cyclistic Capstone]..['202203-divvy-tripdata$']
;

INSERT
  INTO  #qtr_2
SELECT *
FROM [Cyclistic Capstone]..['202204-divvy-tripdata$']
UNION
SELECT *
FROM [Cyclistic Capstone]..['202205-divvy-tripdata$']
UNION
SELECT *
FROM [Cyclistic Capstone]..['202206-divvy-tripdata$']
;

INSERT
  INTO  #qtr_3 
SELECT *
FROM [Cyclistic Capstone]..['202207-divvy-tripdata$']
UNION
SELECT *
FROM [Cyclistic Capstone]..['202208-divvy-tripdata$']
UNION
SELECT *
FROM [Cyclistic Capstone]..['202209-divvy-tripdata$']
;

INSERT
  INTO  #qtr_4
SELECT *
FROM [Cyclistic Capstone]..['202210-divvy-tripdata$']
UNION
SELECT *
FROM [Cyclistic Capstone]..['202211-divvy-tripdata$']
UNION
SELECT *
FROM [Cyclistic Capstone]..['202212-divvy-tripdata$']
;

INSERT
  INTO  #year_data
SELECT *
FROM #qtr_1
UNION
SELECT *
FROM #qtr_2
UNION
SELECT *
FROM #qtr_3
UNION
SELECT *
FROM #qtr_4
;

--- QUERIES BY YEAR
--Query to determine average distance traveled by member type for year 2022
SELECT member_casual,AVG(ride_distance_in_mi) AS avg_ride_distance
FROM #year_data
GROUP BY member_casual
ORDER BY avg_ride_distance DESC;

--Query to determine average ride time per member type for year 2022
SELECT member_casual, CASE
WHEN member_casual = 'member' THEN (SELECT CAST( AVG(CAST(CAST(ride_length as DateTime) as Float)) as DateTime))
WHEN member_casual = 'casual' THEN (SELECT CAST( AVG(CAST(CAST(ride_length as DateTime) as Float)) as DateTime))
END AS average_trip_duration_all_year
FROM #year_data
GROUP BY member_casual;

--Query total rides taken for year 2022
SELECT COUNT(started_at) AS total_rides
FROM #year_data;

SELECT member_casual, COUNT(started_at) AS total_rides
FROM #year_data
GROUP BY member_casual;

--Query rides per day of week for year 2022 in descending order
SELECT day_of_week,COUNT(day_of_week) AS day_count
FROM #year_data
GROUP BY day_of_week
ORDER BY day_count DESC;

--Query highest usage months for year 2022 in descending order
SELECT ride_month, 
COUNT(ride_month) AS ride_count
FROM #year_data
GROUP BY ride_month
ORDER BY ride_count DESC;

--Query total trips by member type per day of week for year 2022 in descending order
SELECT day_of_week,
COUNT(started_at) AS TotalTrips,
SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS MemberTrips,
SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS CasualTrips
FROM #qtr_1
GROUP BY day_of_week
ORDER BY TotalTrips DESC;

--Query total trips by member type for year 2022
SELECT COUNT(started_at) AS TotalTrips,
SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS MemberTrips,
SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS CasualTrips
FROM #qtr_1;

--Temp table to hold altered data type to determine percentage of total rides per member group
WITH member_data AS
(SELECT CAST (COUNT(started_at) AS FLOAT) AS total_num
FROM #year_data)
SELECT member_casual, CASE
WHEN member_casual = 'member' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
WHEN member_casual = 'casual' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
END AS percentage_of_total_rides_all_year
FROM #year_data, member_data
GROUP BY member_casual, member_data.total_num;


--QUERIES BY QUARTER
--Temp table to determine percentage of total rides per member group per quarters
--Quarter 1
WITH member_data AS
(SELECT CAST (COUNT(started_at) AS FLOAT) AS total_num
FROM #qtr_1)
SELECT member_casual, CASE
WHEN member_casual = 'member' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
WHEN member_casual = 'casual' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
END AS percentage_of_total_rides_qtr1
FROM #qtr_1, member_data
GROUP BY member_casual, member_data.total_num;
--Quarter 2
WITH member_data AS
(SELECT CAST (COUNT(started_at) AS FLOAT) AS total_num
FROM #qtr_2)
SELECT member_casual, CASE
WHEN member_casual = 'member' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
WHEN member_casual = 'casual' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
END AS percentage_of_total_rides_qtr2
FROM #qtr_2, member_data
GROUP BY member_casual, member_data.total_num;
--Quarter 3
WITH member_data AS
(SELECT CAST (COUNT(started_at) AS FLOAT) AS total_num
FROM #qtr_3)
SELECT member_casual, CASE
WHEN member_casual = 'member' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
WHEN member_casual = 'casual' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
END AS percentage_of_total_rides_qtr3
FROM #qtr_3, member_data
GROUP BY member_casual, member_data.total_num;
--Quarter 4
WITH member_data AS
(SELECT CAST (COUNT(started_at) AS FLOAT) AS total_num
FROM #qtr_4)
SELECT member_casual, CASE
WHEN member_casual = 'member' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
WHEN member_casual = 'casual' THEN ROUND(CAST((COUNT(*) / total_num) * 100 AS NUMERIC),2)
END AS percentage_of_total_rides_qtr4
FROM #qtr_4, member_data
GROUP BY member_casual, member_data.total_num;

