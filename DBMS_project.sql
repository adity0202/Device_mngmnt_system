CREATE DATABASE device_management_system;
USE device_management_system;

-- Create the DeviceCategory table
CREATE TABLE DeviceCategory (
  category_id INT PRIMARY KEY,
  category_description VARCHAR(255)
);

-- Insert entries into DeviceCategory table
INSERT INTO DeviceCategory (category_id, category_description)
VALUES
  (1, 'iPhone'),
  (2, 'iPad'),
  (3, 'MacBook'),
  (4, 'Apple Watch'),
  (5, 'AirPods'),
  (6, 'HomePod'),
  (7, 'Apple TV'),
  (8, 'iPod'),
  (9, 'Accessories'),
  (10, 'Software');

-- Create the Device table
CREATE TABLE Device (
  device_id INT PRIMARY KEY,
  category_id INT,
  name VARCHAR(255),
  description VARCHAR(255),
  detail VARCHAR(255),
  FOREIGN KEY (category_id) REFERENCES DeviceCategory(category_id)
);

-- Insert entries into Device table
INSERT INTO Device (device_id, category_id, name, description, detail)
VALUES
  (1, 1, 'iPhone 13 Pro', 'Latest iPhone model', '6.1-inch Super Retina XDR display, A15 Bionic chip, Triple-camera system'),
  (2, 1, 'iPhone 13', 'New generation iPhone', '6.1-inch Super Retina XDR display, A15 Bionic chip, Dual-camera system'),
  (3, 2, 'iPad Pro', 'Powerful tablet for professionals', '11-inch Liquid Retina display, M1 chip, Apple Pencil support'),
  (4, 2, 'iPad Air', 'Versatile tablet', '10.9-inch Liquid Retina display, A14 Bionic chip, Touch ID'),
  (5, 3, 'MacBook Pro', 'High-performance laptop', '16-inch Retina display, M1 Pro chip, Magic Keyboard'),
  (6, 3, 'MacBook Air', 'Thin and light laptop', '13.3-inch Retina display, M1 chip, Touch ID'),
  (7, 4, 'Apple Watch Series 7', 'Advanced smartwatch', 'Always-on display, ECG app, Fall detection'),
  (8, 4, 'Apple Watch SE', 'Affordable smartwatch', 'Retina display, Fitness tracking, Family Setup'),
  (9, 5, 'AirPods Pro', 'Wireless earphones with active noise cancellation', 'Active noise cancellation, Transparency mode'),
  (10, 5, 'AirPods Max', 'Premium over-ear headphones', 'High-fidelity audio, Adaptive EQ, Active noise cancellation');

-- Create the User table
CREATE TABLE User (
  user_id INT PRIMARY KEY,
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  phone VARCHAR(20),
  email VARCHAR(255),
  address VARCHAR(255),
  remarks VARCHAR(255)
);

-- Insert entries into User table
INSERT INTO User (user_id, firstName, lastName, phone, email, address, remarks)
VALUES
  (1, 'rahul', 'tanwar', '123-456-7890', 'rahul.tanwar@example.com', '123 Apple Street, Cupertino, CA', 'Preferred contact method: Email'),
  (2, 'aditi', 'sharma', '987-654-3210', 'aditi.sharma@example.com', '456 Apple Avenue, Cupertino, CA', 'Device: iPhone 13 Pro'),
  (3, 'rahul', 'verma', '555-123-4567', 'rahul.verma@example.com', '789 Apple Road, Cupertino, CA', 'Device: MacBook Pro'),
  (4, 'deepanshu', 'verma', '222-333-4444', 'deepanshu.verma@example.com', '987 Apple Lane, Cupertino, CA', ''),
  (5, 'anurag', 'goswami', '777-888-9999', 'anurag.goswami@example.com', '654 Apple Court, Cupertino, CA', 'Device: iPad Pro'),
  (6, 'lakshay', 'taneja', '444-555-6666', 'lakshay.taneja@example.com', '321 Apple Circle, Cupertino, CA', '');

-- Create the SupportRequest table
CREATE TABLE SupportRequest (
  request_id INT PRIMARY KEY,
  device_id INT,
  user_id INT,
  reportDate DATE,
  description VARCHAR(255),
  FOREIGN KEY (device_id) REFERENCES Device(device_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Insert entries into SupportRequest table
INSERT INTO SupportRequest (request_id, device_id, user_id, reportDate, description)
VALUES
  (1, 1, 2, '2023-06-15', 'Battery draining quickly'),
  (2, 3, 5, '2023-06-16', 'Cracked screen'),
  (3, 7, 1, '2023-06-17', 'Heart rate monitor not working'),
  (4, 9, 6, '2023-06-18', 'Noise cancellation issue'),
  (5, 2, 3, '2023-06-19', 'Touch ID not responding'),
  (6, 4, 6, '2023-06-20', 'App freezing frequently'),
  (7, 6, 1, '2023-06-21', 'Unable to connect to Wi-Fi'),
  (8, 5, 4, '2023-06-22', 'Bluetooth connection problem'),
  (9, 8, 4, '2023-06-23', 'Home button not working'),
  (10, 10, 5, '2023-06-24', 'Poor audio quality');

-- Create the SupportStaff table
CREATE TABLE SupportStaff (
  staff_id INT PRIMARY KEY,
  name VARCHAR(255),
  phone VARCHAR(20),
  email VARCHAR(255)
);

-- Insert entries into SupportStaff table
INSERT INTO SupportStaff (staff_id, name, phone, email)
VALUES
  (1, 'Adam Johnson', '111-222-3333', 'adam.johnson@example.com'),
  (2, 'Emily Davis', '222-333-4444', 'emily.davis@example.com'),
  (3, 'Michael Anderson', '333-444-5555', 'michael.anderson@example.com'),
  (4, 'Sophia Wilson', '444-555-6666', 'sophia.wilson@example.com'),
  (5, 'Matthew Thompson', '555-666-7777', 'matthew.thompson@example.com'),
  (6, 'Olivia Martinez', '666-777-8888', 'olivia.martinez@example.com'),
  (7, 'Daniel Robinson', '777-888-9999', 'daniel.robinson@example.com'),
  (8, 'Ava Clark', '888-999-0000', 'ava.clark@example.com'),
  (9, 'Alexander Walker', '999-000-1111', 'alexander.walker@example.com'),
  (10, 'Isabella Turner', '000-111-2222', 'isabella.turner@example.com');

-- Create the PriorityType table
CREATE TABLE PriorityType (
  priority_id INT PRIMARY KEY,
  description VARCHAR(255)
);

-- Insert entries into PriorityType table
INSERT INTO PriorityType (priority_id, description)
VALUES
  (1, 'Low'),
  (2, 'Medium'),
  (3, 'High'),
  (4, 'Urgent'),
  (5, 'Critical');

-- Create the History table
CREATE TABLE History (
  history_id INT PRIMARY KEY,
  priority_id INT,
  staff_id INT,
  request_id INT,
  H_date date,
  FOREIGN KEY (priority_id) REFERENCES PriorityType(priority_id),
  FOREIGN KEY (staff_id) REFERENCES SupportStaff(staff_id),
  FOREIGN KEY (request_id) REFERENCES SupportRequest(request_id)
);

-- Insert entries into History table
INSERT INTO History (history_id, priority_id, staff_id, request_id , H_date)
VALUES
  (1, 2, 1, 3, '2023-06-01'),
  (2, 1, 5, 8, '2023-06-02'),
  (3, 3, 3, 7, '2023-06-03'),
  (4, 2, 4, 2, '2023-06-04'),
  (5, 3, 9, 4, '2023-06-05'),
  (6, 1, 2, 1, '2023-06-06'),
  (7, 2, 6, 9, '2023-06-07'),
  (8, 1, 10, 10, '2023-06-08'),
  (9, 3, 7, 6, '2023-06-09'),
  (10, 2, 8, 5, '2023-06-10');

-- Create the SkillSet table
CREATE TABLE SkillSet (
  skill_id INT PRIMARY KEY,
  staff_id INT,
  description VARCHAR(255),
  FOREIGN KEY (staff_id) REFERENCES SupportStaff(staff_id)
);

-- Insert entries into SkillSet table
INSERT INTO SkillSet (skill_id, staff_id, description)
VALUES
  (1, 1, 'iPhone troubleshooting'),
  (2, 2, 'iPad repairs'),
  (3, 3, 'MacBook software support'),
  (4, 4, 'Apple Watch diagnostics'),
  (5, 5, 'AirPods setup and maintenance'),
  (6, 6, 'HomePod configuration'),
  (7, 7, 'Apple TV technical assistance'),
  (8, 8, 'iPod repairs'),
  (9, 9, 'Accessories compatibility'),
  (10, 10, 'Software installation');

-- Create the Solution table
CREATE TABLE Solution (
  solution_id INT PRIMARY KEY,
  history_id INT,
  description VARCHAR(255),
  FOREIGN KEY (history_id) REFERENCES History(history_id)
);

-- Insert entries into Solution table
INSERT INTO Solution (solution_id, history_id, description)
VALUES
  (1, 1, 'Replaced battery'),
  (2, 2, 'Replaced cracked screen'),
  (3, 3, 'Updated firmware to resolve heart rate monitor issue'),
  (4, 4, 'Performed noise cancellation calibration'),
  (5, 5, 'Repaired Touch ID sensor'),
  (6, 6, 'Cleared cache and optimized app performance'),
  (7, 7, 'Troubleshooted Wi-Fi connection and adjusted settings'),
  (8, 8, 'Reset Bluetooth settings and reconnected devices'),
  (9, 9, 'Replaced home button assembly'),
  (10, 10, 'Diagnosed hardware issue and provided replacement headphones');

select*from DeviceCategory; 
select * from Device;

-- Group by
select(category_id),category_description FROM DeviceCategory GROUP BY category_id;


-- Order By
select * FROM Solution
ORDER BY description;

-- Update User
UPDATE User
SET firstName='adity' where user_id='2'; select * from User;


  -- Join Device and DeviceCategory tables
SELECT d.device_id, d.name, d.description, dc.category_description
FROM Device d
JOIN DeviceCategory dc ON d.category_id = dc.category_id;

-- Join SupportRequest, Device, and User tables
SELECT sr.request_id, d.name AS device_name, u.firstName, u.lastName, sr.reportDate, sr.description
FROM SupportRequest sr
JOIN Device d ON sr.device_id = d.device_id
JOIN User u ON sr.user_id = u.user_id;

-- Join History, PriorityType, SupportStaff, and SupportRequest tables
SELECT h.history_id, p.description AS priority_description, ss.name AS staff_name, sr.request_id, sr.description
FROM History h
JOIN PriorityType p ON h.priority_id = p.priority_id
JOIN SupportStaff ss ON h.staff_id = ss.staff_id
JOIN SupportRequest sr ON h.request_id = sr.request_id;

-- Join SkillSet and SupportStaff tables
SELECT s.skill_id, ss.name AS staff_name, s.description
FROM SkillSet s
JOIN SupportStaff ss ON s.staff_id = ss.staff_id;

-- Join Solution, History, and SupportRequest tables
SELECT s.solution_id, h.history_id, sr.request_id, s.description
FROM Solution s
JOIN History h ON s.history_id = h.history_id
JOIN SupportRequest sr ON h.request_id = sr.request_id;

