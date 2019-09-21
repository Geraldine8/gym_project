DROP TABLE members;
DROP TABLE bookings;
DROP TABLE gym_classes;

CREATE TABLE members(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_number INT4,
  email VARCHAR(255)
);

CREATE TABLE gym_classes(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  capacity INT4,
  timetable VARCHAR(255)
);

CREATE TABLE bookings (
  members_id INT4 REFERENCES members(id) ON DELETE CASCADE,
  gym_classes_id INT4 references gym_classes(id) ON DELETE CASCADE
);
