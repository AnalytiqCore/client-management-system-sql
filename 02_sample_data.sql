-- =========================================================
-- Mercy Immigration SQL Analysis Project
-- 02_sample_data.sql
-- Synthetic portfolio data
-- =========================================================

USE mercy_immigration_portfolio;

INSERT INTO consultants
(first_name, last_name, email, phone, specialization)
VALUES
('Amit', 'Kapoor', 'amit@mercyimmigration.test', '9000000001', 'Germany'),
('Simran', 'Kaur', 'simran@mercyimmigration.test', '9000000002', 'Canada'),
('John', 'Mathew', 'john@mercyimmigration.test', '9000000003', 'Australia'),
('Neha', 'Sharma', 'neha@mercyimmigration.test', '9000000004', 'UK'),
('Riya', 'Malhotra', 'riya@mercyimmigration.test', '9000000005', 'Netherlands');

INSERT INTO clients
(first_name, last_name, email, phone, date_of_birth, target_country, immigration_program, consultant_id, consultation_fee)
VALUES
('Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876500001', '1995-05-10', 'Germany', 'Job Seeker Visa', 1, 5000),
('Ansh', 'Verma', 'ansh.verma@gmail.com', '9876500002', '1997-07-18', 'Germany', 'EU Blue Card', 1, 5000),
('Aman', 'Singh', 'aman.singh@gmail.com', '9876500003', '1994-01-22', 'Germany', 'Skilled Worker', 1, 5000),
('Karan', 'Mehta', 'karan.mehta@gmail.com', '9876500004', '1992-09-14', 'Germany', 'Student Visa', 1, 5000),

('Priya', 'Kaur', 'priya.kaur@gmail.com', '9876500005', '1998-11-20', 'Canada', 'Study Permit', 2, 6000),
('Rohit', 'Arora', 'rohit.arora@gmail.com', '9876500006', '1993-03-16', 'Canada', 'Work Permit', 2, 6000),

('Neha', 'Verma', 'neha.verma@gmail.com', '9876500007', '1996-06-11', 'Australia', 'Skilled Visa', 3, 7000),
('Armaan', 'Gill', 'armaan.gill@gmail.com', '9876500008', '1991-12-03', 'Australia', 'Student Visa', 3, 7000),

('Simran', 'Bedi', 'simran.bedi@gmail.com', '9876500009', '1999-02-28', 'UK', 'Student Visa', 4, 6500),
('Arjun', 'Sethi', 'arjun.sethi@gmail.com', '9876500010', '1995-08-09', 'UK', 'Skilled Worker Visa', 4, 6500),

('Mehak', 'Chopra', 'mehak.chopra@gmail.com', '9876500011', '1997-04-25', 'Netherlands', 'Highly Skilled Migrant', 5, 5500),
('Vikas', 'Nanda', 'vikas.nanda@gmail.com', '9876500012', '1990-10-08', 'Netherlands', 'Orientation Year', 5, 5500),
('Riya', 'Malik', 'riya.malik@gmail.com', '9876500013', '1998-01-31', 'UK', 'Visitor Visa', 4, 6500);

INSERT INTO visa_applications
(client_id, application_date, visa_type, application_status, country, processing_fee, decision_date)
VALUES
(1,  '2026-01-08', 'Job Seeker Visa',       'Approved',    'Germany',     5000, '2026-03-10'),
(2,  '2026-01-21', 'EU Blue Card',          'In Progress', 'Germany',     5000, NULL),
(3,  '2026-02-05', 'Skilled Worker',        'Submitted',   'Germany',     5000, NULL),
(4,  '2026-02-19', 'Student Visa',          'Approved',    'Germany',     5000, '2026-05-12'),

(5,  '2026-03-03', 'Study Permit',          'Approved',    'Canada',      6000, '2026-06-15'),
(6,  '2026-03-18', 'Work Permit',           'Rejected',    'Canada',      6000, '2026-06-28'),

(7,  '2026-04-07', 'Skilled Visa',          'In Progress', 'Australia',   7000, NULL),
(8,  '2026-04-25', 'Student Visa',          'Submitted',   'Australia',   7000, NULL),

(9,  '2026-05-04', 'Student Visa',          'Approved',    'UK',          5500, '2026-07-02'),
(10, '2026-05-22', 'Skilled Worker Visa',   'Rejected',    'UK',          5500, '2026-07-15'),
(13, '2026-06-09', 'Visitor Visa',          'Submitted',   'UK',          5500, NULL),

(11, '2026-06-20', 'Highly Skilled Migrant','In Progress', 'Netherlands', 6500, NULL),
(12, '2026-07-03', 'Orientation Year',      'Withdrawn',   'Netherlands', 6500, NULL);
