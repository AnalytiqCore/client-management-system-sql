-- =========================================================
-- Mercy Immigration SQL Analysis Project
-- 01_schema.sql
-- =========================================================

DROP DATABASE IF EXISTS mercy_immigration_portfolio;
CREATE DATABASE mercy_immigration_portfolio;
USE mercy_immigration_portfolio;

CREATE TABLE consultants (
    consultant_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    specialization VARCHAR(50) NOT NULL
);

CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    date_of_birth DATE,
    target_country VARCHAR(50),
    immigration_program VARCHAR(80),
    consultant_id INT,
    consultation_fee DECIMAL(10,2),
    CONSTRAINT fk_clients_consultants
        FOREIGN KEY (consultant_id)
        REFERENCES consultants(consultant_id)
);

CREATE TABLE visa_applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    application_date DATE NOT NULL,
    visa_type VARCHAR(80),
    application_status VARCHAR(40),
    country VARCHAR(50),
    processing_fee DECIMAL(10,2),
    decision_date DATE,
    CONSTRAINT fk_applications_clients
        FOREIGN KEY (client_id)
        REFERENCES clients(client_id)
);
