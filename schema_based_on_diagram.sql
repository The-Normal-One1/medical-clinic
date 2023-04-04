CREATE DATABASE schema_diagram;


 CREATE TABLE patients(id INT PRIMARY KEY, name VARCHAR, date_of_birth DATE);

 CREATE TABLE medical_histories(id INT PRIMARY KEY, admitted_at TIMESTAMP, patient_id INT, status VARCHAR, FOREIGN KEY (patient_id) REFERENCES patients(id));

 CREATE TABLE treatments(id INT PRIMARY KEY, type VARCHAR, name VARCHAR);



SELECT * FROM patients;
