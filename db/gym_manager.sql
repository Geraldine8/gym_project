DROP TABLE members;
DROP TABLE bookings;
DROP TABLE gym_classes;

CREATE TABLE members(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_number VARCHAR(255),
  email VARCHAR(255),
  premium INT4
);

CREATE TABLE gym_classes(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  capacity INT8,
  timetable VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL4,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  gym_class_id INT8 references gym_classes(id) ON DELETE CASCADE
);
