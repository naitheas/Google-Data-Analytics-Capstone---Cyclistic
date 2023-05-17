
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
member_casual VARCHAR(100)
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
FROM #qtr_4;