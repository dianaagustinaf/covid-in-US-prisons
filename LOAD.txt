
# CREATING THE TABLES IN POSTGRES


CREATE TABLE state_abbreviation(
	state varchar(200) primary key,
	abbreviation varchar(20) not null
);



CREATE TABLE national_covid_statistics_us (
	state varchar(20) PRIMARY KEY,
	abbreviation VARCHAR,
	TotalCases INT,
	TotalDeaths INT,
	Tot_Cases_1M_pop  INT,
	TotalTests INT,
	Tests_per_1M_pop INT,
	Population INT
);

---
## NYT 


CREATE TABLE total_prison_covid_stats_by_state_nyt(

	state varchar(200) primary key,
	inmate_tests int,
	total_inmate_cases int,
	total_inmate_deaths int,
	latest_inmate_population int,
	max_inmate_population_2020 int,
	total_officer_cases int,
	total_officer_deaths int
	);



CREATE TABLE prison_facilities_nyt( 
	id SERIAL PRIMARY KEY,
	nyt_id varchar(200), 

	facility_name varchar(200), 
	facility_type varchar(200), 
	facility_city varchar(200),
    facility_county varchar(200), 
	facility_county_fips INT, 
	state varchar(200), 
	facility_lng DEC,
    facility_lat DEC, 
	latest_inmate_population INT,
    max_inmate_population_2020 INT, 
	total_inmate_cases INT,
    total_inmate_deaths INT,
	total_officer_cases INT, 
	total_officer_deaths INT,
    note varchar(200)
);


---
## APM


CREATE TABLE covid_prison_cases_apm (
	id SERIAL PRIMARY KEY,
	state varchar(20),
	abbreviation varchar(20),
	staff_tests INT,
	staff_tests_with_multiples INT,
	total_staff_cases INT,
	staff_recovered INT,
	total_staff_deaths INT,
	staff_partial_dose INT,
	staff_full_dose INT,
	prisoner_tests INT,
	prisoner_tests_with_multiples INT,
	total_prisoner_cases INT,
	prisoners_recovered INT,
	total_prisoner_deaths INT,
	prisoners_partial_dose INT,
	prisoners_full_dose INT,
	as_of_date DATE,
	notes VARCHAR (2000)
);



CREATE TABLE covid_prisons_rates_apm (
	state varchar(20) PRIMARY KEY,
	latest_week DATE,
	cumulative_prisoner_cases INT,
	prisoner_cases_pct DEC,
	prisoner_case_rate VARCHAR(20),
	cumulative_prisoner_deaths INT,
	prisoner_deaths_pct DEC,
	prisoner_death_rate VARCHAR(20),
	cumulative_staff_cases INT,
	staff_cases_pct DEC,
	staff_case_rate VARCHAR(20),
	cumulative_staff_deaths INT,
	staff_deaths_pct DEC,
	staff_death_rate VARCHAR(20)
);



CREATE TABLE prison_populations_apm( 
	id SERIAL PRIMARY KEY,
	state VARCHAR(200),
	abbreviation VARCHAR(100),	
	month VARCHAR(100),
	as_of_date DATE,
	pop INT
);


CREATE TABLE staff_populations_apm (

	 id SERIAL PRIMARY KEY, 
	 state varchar(200),
	 abbreviation varchar(20),
	 month varchar(200),
	 as_of_date date,
	 pop INT,
	 Notes VARCHAR(1000)
);


---
---

# ER DIAGRAM

https://app.quickdatabasediagrams.com/#/ 


national_covid_statistics_us 
--
state varchar(20) PK FK >- prison_facilities_nyt.state
abbreviation VARCHAR
TotalCases INT
TotalDeaths INT
Tot_Cases_1M_pop INT
TotalTests INT
Tests_per_1M_pop INT
Population INT


total_prison_covid_stats_by_state_nyt
--
state varchar(200) PK FK >- prison_facilities_nyt.state
inmate_tests int
total_inmate_cases int
total_inmate_deaths int
latest_inmate_population int
max_inmate_population_2020 int
total_officer_cases int
total_officer_deaths int


prison_facilities_nyt
--
id SERIAL PK
nyt_id varchar(200)
facility_name varchar(200)
facility_type varchar(200)
facility_city varchar(200)
facility_county varchar(200)
facility_county_fips INT
state varchar(200)
facility_lng DEC
facility_lat DEC
latest_inmate_population INT
max_inmate_population_2020 INT
total_inmate_cases INT
total_inmate_deaths INT
total_officer_cases INT
total_officer_deaths INT
note varchar(200)


covid_prison_cases_apm
--
id SERIAL PK
state varchar(20) FK >- covid_prisons_rates_apm.state
abbreviation varchar(20)
staff_tests INT
staff_tests_with_multiples INT
total_staff_cases INT
staff_recovered INT
total_staff_deaths INT
staff_partial_dose INT
staff_full_dose INT
prisoner_tests INT
prisoner_tests_with_multiples INT
total_prisoner_cases INT
prisoners_recovered INT
total_prisoner_deaths INT
prisoners_partial_dose INT
prisoners_full_dose INT
as_of_date DATE
notes VARCHAR(2000)


covid_prisons_rates_apm
--
state varchar(20) PK
latest_week DATE
cumulative_prisoner_cases INT
prisoner_cases_pct DEC
prisoner_case_rate VARCHAR(20)
cumulative_prisoner_deaths INT
prisoner_deaths_pct DEC
prisoner_death_rate VARCHAR(20)
cumulative_staff_cases INT
staff_cases_pct DEC
staff_case_rate VARCHAR(20)
cumulative_staff_deaths INT
staff_deaths_pct DEC
staff_death_rate VARCHAR(20)


prison_populations_apm
--
id SERIAL PK
state VARCHAR(200)
abbreviation VARCHAR(100) FK >- staff_populations_apm.abbreviation
month VARCHAR(100)
as_of_date DATE
pop INT


staff_populations_apm
--
id SERIAL PK
state varchar(200)
abbreviation varchar(20)
month varchar(200)
as_of_date date
pop INT
Notes VARCHAR(1000)

