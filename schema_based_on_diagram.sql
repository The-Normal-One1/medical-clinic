CREATE DATABASE schema_diagram;


 CREATE TABLE patients(
    id INT PRIMARY KEY GENERATED ALWAYS ON IDENTITY, 
    name VARCHAR(120), 
    date_of_birth DATE
);

 CREATE TABLE medical_histories(
    id INT PRIMARY KEY GENERATED ALWAYS ON IDENTITY, 
    admitted_at TIMESTAMP, 
    patient_id INT, 
    status VARCHAR, 
    FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE
    );

 CREATE TABLE treatments(
    id INT PRIMARY KEY GENERATED ALWAYS ON IDENTITY, 
    type VARCHAR, 
    name VARCHAR
    );

CREATE TABLE medical_histories_has_treatments(
    id PRIMARY KEY GENERATED ALWAYS ON IDENTITY,
    medical_histories_id INT NOT NULL,
    treatments_id INT NOT NULL,
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id) ON DELETE CASCADE
    FOREIGN KEY (treatments_id) REFERENCES treatments (id) ON DELETE CASCADE
);

SELECT * FROM patients;

CREATE TABLE invoices(
    id INT PRIMARY KEY, 
    total_amount INT, 
    generated_at TIMESTAMP, 
    payed_at TIMESTAMP, 
    medical_history_id INT, 
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
    );

CREATE TABLE invoice_items(
    id INT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT, 
    total_price DECIMAL, 
    invoice_id INT, 
    treatment_id INT, 
    FOREIGN KEY (treatment_id) REFERENCES treatments (id) , 
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE
    );

    -- Create indexes for the foreign keys

CREATE INDEX ON medical_histories (patient_id);

CREATE INDEX ON invoices (medical_history_id);

CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);

CREATE INDEX ON medical_histories_has_treatments (medical_histories_id);
CREATE INDEX ON medical_histories_has_treatments (treatments_id);
