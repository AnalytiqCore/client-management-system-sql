# Data Dictionary

## consultants
| Column | Type | Description |
|---|---|---|
| consultant_id | INT | Primary key |
| first_name | VARCHAR | Consultant first name |
| last_name | VARCHAR | Consultant last name |
| email | VARCHAR | Unique consultant email |
| phone | VARCHAR | Contact number |
| specialization | VARCHAR | Country/immigration specialization |

## clients
| Column | Type | Description |
|---|---|---|
| client_id | INT | Primary key |
| first_name | VARCHAR | Client first name |
| last_name | VARCHAR | Client last name |
| email | VARCHAR | Client email |
| phone | VARCHAR | Client phone |
| date_of_birth | DATE | Client DOB |
| target_country | VARCHAR | Destination country |
| immigration_program | VARCHAR | Program/visa interest |
| consultant_id | INT | Foreign key to consultants |
| consultation_fee | DECIMAL | Consultation fee |

## visa_applications
| Column | Type | Description |
|---|---|---|
| application_id | INT | Primary key |
| client_id | INT | Foreign key to clients |
| application_date | DATE | Application submission date |
| visa_type | VARCHAR | Visa/application type |
| application_status | VARCHAR | Current status |
| country | VARCHAR | Destination country |
| processing_fee | DECIMAL | Application processing fee |
| decision_date | DATE | Final decision date, if available |
