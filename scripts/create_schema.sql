-- PARKS TABLE
CREATE TABLE parks (
    park_id SERIAL PRIMARY KEY,
    park_name VARCHAR(255) NOT NULL,
    park_code VARCHAR(10) UNIQUE NOT NULL,
    location VARCHAR(255),
    opened_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- RIDES TABLE
CREATE TABLE rides (
    ride_id SERIAL PRIMARY KEY,
    park_id INTEGER NOT NULL REFERENCES parks(park_id),
    ride_name VARCHAR(255) NOT NULL,
    ride_type VARCHAR(100),
    opening_date DATE,
    height_requirement_inches INTEGER,
    thrill_level VARCHAR(50),
    duration_minutes INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ATTRACTIONS TABLE
CREATE TABLE attractions (
    attraction_id SERIAL PRIMARY KEY,
    park_id INTEGER NOT NULL REFERENCES parks(park_id),
    attraction_name VARCHAR(255) NOT NULL,
    attraction_type VARCHAR(100),
    opening_date DATE,
    reopening_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- WAIT_TIMES TABLE
CREATE TABLE wait_times (
    wait_id SERIAL PRIMARY KEY,
    ride_id INTEGER NOT NULL REFERENCES rides(ride_id),
    wait_time_minutes INTEGER,
    recorded_date DATE,
    recorded_hour INTEGER,
    crowd_level VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TICKETS TABLE
CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    park_id INTEGER NOT NULL REFERENCES parks(park_id),
    ticket_type VARCHAR(100),
    price_usd DECIMAL(10, 2),
    duration_days INTEGER,
    valid_from DATE,
    valid_to DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- VISITOR_STATISTICS TABLE
CREATE TABLE visitor_statistics (
    stat_id SERIAL PRIMARY KEY,
    park_id INTEGER NOT NULL REFERENCES parks(park_id),
    visit_date DATE,
    total_visitors INTEGER,
    peak_hour INTEGER,
    average_crowd_level VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for performance
CREATE INDEX idx_rides_park ON rides(park_id);
CREATE INDEX idx_attractions_park ON attractions(park_id);
CREATE INDEX idx_wait_times_ride ON wait_times(ride_id);
CREATE INDEX idx_wait_times_date ON wait_times(recorded_date);
CREATE INDEX idx_tickets_park ON tickets(park_id);
CREATE INDEX idx_visitor_stats_date ON visitor_statistics(visit_date);
