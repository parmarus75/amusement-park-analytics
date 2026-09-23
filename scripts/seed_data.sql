-- Insert Parks
INSERT INTO parks (park_name, park_code, location, opened_date) VALUES
('Sunset Cove Adventure Park', 'SCA', 'Orlando, Florida', '1990-06-07'),
('Emerald Isle Fantasy Park', 'EIF', 'Orlando, Florida', '1999-05-28'),
('Coral Bay Water World', 'CBW', 'Orlando, Florida', '2005-03-15'),
('Golden Peak Thrill Park', 'GPT', 'Los Angeles, California', '1985-04-18');

-- Insert Rides
INSERT INTO rides (park_id, ride_name, ride_type, opening_date, height_requirement_inches, thrill_level, duration_minutes) VALUES
(1, 'Dragon''s Fury Coaster', 'Roller Coaster', '2004-05-01', 48, 'Intense', 3),
(1, 'Crystal Caverns Adventure', 'Dark Ride', '2014-07-08', 42, 'Family', 5),
(1, 'Vortex Spinner', 'Interactive Ride', '2000-06-23', 42, 'Moderate', 4),
(1, 'Thunderbolt Express', 'Roller Coaster', '1999-06-18', 54, 'Intense', 2),
(1, 'Sky Rocket', 'Roller Coaster', '2009-08-07', 51, 'Intense', 2),
(2, 'Enchanted Forest Journey', 'Roller Coaster', '2010-06-18', 48, 'Moderate', 4),
(2, 'Giant Ape Encounter', 'Dark Ride', '2016-07-21', 42, 'Moderate', 3),
(2, 'Velocity Rush', 'Roller Coaster', '2021-06-10', 51, 'Intense', 2),
(2, 'Web Slinger Adventure', 'Dark Ride', '1999-05-28', 40, 'Family', 3);

-- Insert Attractions
INSERT INTO attractions (park_id, attraction_name, attraction_type, opening_date) VALUES
(1, 'Rockit Show Plaza', 'Show Area', '2009-08-07'),
(1, 'Mystic Realm Land', 'Themed Land', '2010-06-18'),
(2, 'Ape Island Experience', 'Dark Ride', '2016-07-21'),
(2, 'Prehistoric Valley', 'Themed Land', '1999-05-28');

-- Insert sample wait times
INSERT INTO wait_times (ride_id, wait_time_minutes, recorded_date, recorded_hour, crowd_level) VALUES
(1, 45, CURRENT_DATE, 12, 'Moderate'),
(1, 65, CURRENT_DATE, 14, 'High'),
(1, 30, CURRENT_DATE - INTERVAL '1 day', 10, 'Low'),
(2, 55, CURRENT_DATE, 11, 'High'),
(2, 40, CURRENT_DATE - INTERVAL '1 day', 15, 'Moderate'),
(3, 25, CURRENT_DATE, 13, 'Low'),
(4, 80, CURRENT_DATE, 16, 'Very High'),
(4, 90, CURRENT_DATE - INTERVAL '1 day', 14, 'Very High'),
(5, 35, CURRENT_DATE, 12, 'Moderate');

-- Insert Tickets
INSERT INTO tickets (park_id, ticket_type, price_usd, duration_days, valid_from, valid_to) VALUES
(1, '1-Day Ticket', 109.00, 1, CURRENT_DATE, CURRENT_DATE + INTERVAL '90 days'),
(1, '2-Day Ticket', 189.00, 2, CURRENT_DATE, CURRENT_DATE + INTERVAL '90 days'),
(1, '3-Day Ticket', 239.00, 3, CURRENT_DATE, CURRENT_DATE + INTERVAL '90 days'),
(2, '1-Day Ticket', 109.00, 1, CURRENT_DATE, CURRENT_DATE + INTERVAL '90 days'),
(2, '2-Day Ticket', 189.00, 2, CURRENT_DATE, CURRENT_DATE + INTERVAL '90 days');

-- Insert Visitor Statistics
INSERT INTO visitor_statistics (park_id, visit_date, total_visitors, peak_hour, average_crowd_level) VALUES
(1, CURRENT_DATE, 45000, 14, 'High'),
(1, CURRENT_DATE - INTERVAL '1 day', 52000, 15, 'Very High'),
(2, CURRENT_DATE, 38000, 13, 'Moderate'),
(2, CURRENT_DATE - INTERVAL '1 day', 41000, 14, 'High');
