/* Group 6
Nicholas Vuong
Benjamin Filler
Randell Lapid
*/

DROP DATABASE IF EXISTS docoffice;
CREATE DATABASE docoffice;
use docoffice;
 
CREATE TABLE appointment (
  appointment_id varchar(6) NOT NULL,
  appointment_time datetime NOT NULL,
  PRIMARY KEY (appointment_id));

CREATE TABLE doctor (
  doctor_id varchar(6) NOT NULL,
  first_name varchar(32) NOT NULL,
  last_name varchar(32) NOT NULL,
  PRIMARY KEY (doctor_id));
  
CREATE TABLE doctor_specialty (
  doctor_id varchar(6) NOT NULL,
  first_name varchar(32),
  specialty varchar(32) NOT NULL,
  FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id));

CREATE TABLE office (
  office_name varchar(32) NOT NULL,
  hours varchar(32) NOT NULL,
  PRIMARY KEY (office_name));

CREATE TABLE patient (
  patient_id varchar(6) NOT NULL,
  phone_number varchar(32) NOT NULL,
  first_name varchar(32) NOT NULL,
  last_name varchar(32) NOT NULL,
  is_doctor tinyint(1) NOT NULL,
  PRIMARY KEY (patient_id));
  
CREATE TABLE prescription (
  medicine varchar(32) NOT NULL,
  reference_appointment varchar(6) NOT NULL,
  given_by varchar(6) NOT NULL,
  given_to varchar(6) NOT NULL,
  FOREIGN KEY (reference_appointment) REFERENCES appointment(appointment_id),
  FOREIGN KEY (given_by) REFERENCES doctor(doctor_id),
  FOREIGN KEY (given_to) REFERENCES patient(patient_id));
  
CREATE TABLE medical_test (
  test_name varchar(30) NOT NULL,
  reference_appointment varchar(6) NOT NULL,
  performed_by varchar(6) NOT NULL,
  performed_on varchar(6) NOT NULL,
  FOREIGN KEY (reference_appointment) REFERENCES appointment(appointment_id),
  FOREIGN KEY (performed_by) REFERENCES doctor(doctor_id),
  FOREIGN KEY (performed_on) REFERENCES patient(patient_id));
  
CREATE TABLE doc_specialty_mod (
  first_name varchar(32),
  action varchar(3),
  specialty varchar(32),
  date DATETIME);
  
INSERT INTO office(office_name, hours) VALUES 
  ('Grace Medical', '7am - 4pm M-F'),
  ('Castle Health Care', '7am - 3pm M-Th'),
  ('First Choice Health', '8am - 5pm M-F'),
  ('Intelligent Health Inc.', '7am - 3pm Tu-F');

CREATE VIEW offices AS
SELECT * FROM office;
  
INSERT INTO doctor(doctor_id, last_name, first_name) VALUES 
  ('GW8365', 'Wilson', 'Greg'),
  ('TG0263', 'Greene', 'Tracy'),
  ('DG6583', 'Garcia', 'David'),
  ('AM5229', 'Meyers', 'Alexander'),
  ('WL8204', 'Lee', 'William'),
  ('JM9477', 'Moreno', 'Jacqueline'),
  ('BT9848', 'Thompson', 'Beth'),
  ('SB4829', 'Bonnell', 'Steven'),
  ('JN1841', 'Nguyen', 'Jennifer'),
  ('RS6329', 'Stevens', 'Robert'),
  ('JY6969', 'Yos', 'Justin');
 
INSERT INTO doctor_specialty(doctor_id, first_name, specialty) VALUES
  ('GW8365', 'Greg', 'Pediatrics'),
  ('TG0263', 'Tracy', 'Cardiology'),
  ('DG6583', 'David', 'Dermatology'),
  ('AM5229', 'Alexander', 'Endocrinology'),
  ('WL8204', 'William', 'Dermatology'),
  ('JM9477', 'Jacqueline', 'Pediatrics'),
  ('BT9848', 'Beth', 'Radiology'),
  ('SB4829', 'Steven', 'Cardiology'),
  ('JN1841', 'Jennifer', 'Oncology'),
  ('RS6329', 'Robert', 'Ophthalmology'),
  ('JY6969', 'Justin', 'NONE');
  
INSERT INTO patient(patient_id, phone_number, last_name, first_name, is_doctor) VALUES 
  ('567328', '872-555-8273', 'Hernandez', 'Daniel', 0),
  ('028365', '532-555-5438', 'Sharpe', 'Alyssa', 0),
  ('167981', '872-555-1053', 'Henderson', 'Eric', 0),
  ('538922', '872-555-2757', 'Brown', 'Miranda', 0),
  ('976352', '485-555-8603', 'Chan', 'Lauren', 0),
  ('593266', '784-555-9184', 'Jones', 'Christopher', 0),
  ('969123', '872-555-2976', 'Hamilton', 'Marcus', 0),
  ('657280', '765-555-9283', 'Rivera', 'Jacob', 0),
  ('059351', '834-555-4781', 'Tu', 'Kevin', 0),
  ('982134', '876-555-6932', 'Reed', 'Sofia', 0),
  ('756912', '872-555-6982', 'Perez', 'Angel', 0),
  ('478921', '872-555-0193', 'Gray', 'Andrew', 0);

CREATE VIEW patients AS
SELECT * FROM patient;
  
INSERT INTO appointment(appointment_id, appointment_time) VALUES 
  ('7N83KJ', '2020-01-19 08:00:00'),
  ('3BW6A0', '2020-06-02 08:30:00'),
  ('P32NLC', '2020-08-28 13:30:00'),
  ('9JW61T', '2020-11-21 11:30:00'),
  ('8X16GT', '2020-12-04 06:45:00'),
  ('E38Z5F', '2020-12-12 17:15:00'),
  ('H9JA34', '2020-12-21 15:45:00');

CREATE VIEW appointments AS
SELECT * FROM appointment;
  
INSERT INTO prescription(medicine, reference_appointment, given_to, given_by) VALUES 
  ('Risperdal', '7N83KJ', '969123', 'DG6583'),
  ('Fosamax', '7N83KJ', '969123', 'DG6583'),
  ('Cardizem', '9JW61T', '478921', 'SB4829'),
  ('Toprol XL', 'P32NLC', '167981', 'JM9477'),
  ('Vicodin', 'H9JA34', '167981', 'JM9477');

CREATE VIEW prescriptions_given AS
SELECT * FROM prescription;
  
INSERT INTO medical_test(test_name, reference_appointment, performed_on, performed_by) VALUES 
  ('Blood Glucose Test', '7N83KJ', '756912', 'BT9848'),
  ('Fluoroscopy', '3BW6A0', '969123', 'JN1841'),
  ('MPV Blood Test', 'P32NLC', '028365', 'JM9477'),
  ('Skin Biopsy', 'P32NLC', '028365', 'JM9477'),
  ('Vision Test', '8X16GT', '059351', 'RS6329'),
  ('Ocular Tonometry', 'E38Z5F', '567328', 'RS6329'),
  ('Physical Checkup', 'H9JA34', '976352', 'JY6969');
 
CREATE VIEW medical_tests AS
SELECT * FROM medical_test; 
 
  -- Create view that shows names and phone numbers of all of Doctor Robert Stevens' patients
CREATE VIEW stevens_patients AS 
SELECT first_name, last_name, phone_number FROM medical_test 
INNER JOIN patient ON performed_on = patient_id 
WHERE performed_by = 'RS6329';
  
  -- Create view that shows first names and last names of all doctors who gave out prescriptions for Vicodin
CREATE VIEW vicodin_pres AS
SELECT first_name, last_name FROM prescription 
JOIN doctor ON given_by = doctor_id 
WHERE medicine = 'Vicodin';

  -- Create view that shows first names, last names, and specialty of all doctors
CREATE VIEW doctors AS
SELECT doctor.first_name, doctor.last_name, doctor_specialty.specialty FROM doctor
JOIN doctor_specialty ON doctor.doctor_id = doctor_specialty.doctor_id AND specialty <> 'NONE';
  
  -- Create view similar to previous view but includes doctors without a specialty
CREATE VIEW all_doctors AS
SELECT doctor.first_name, doctor.last_name, doctor_specialty.specialty FROM doctor
JOIN doctor_specialty ON doctor.doctor_id = doctor_specialty.doctor_id;

  -- Create trigger on DoctorSpecialty table
CREATE TRIGGER doc_specialty_mod
AFTER UPDATE
ON doctor_specialty
FOR EACH ROW
INSERT INTO doc_specialty_mod VALUES (first_name, 'INS', specialty, GETDATE());

UPDATE doctor_specialty SET specialty = 'Gynecology' WHERE doctor_id = 'JY6969';