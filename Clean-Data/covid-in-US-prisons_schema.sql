Create table state_abbreviations (state varchar(200) primary key unique,
								 state_abbreviations varchar (20) unique
								
);

ALTER table state_abbreviations
RENAME column abbreviations TO abbreviation;
select * 
from state_abbreviations;
-------------------------------------------------------------------------------------------------------------------
Create table national_covid_statistics_US (state varchar(200) primary key unique,
										   TotalCases int, 
										   TotalDeaths int,
										   Tot Cases/1M pop int,
										   TotalTests int,
										   'Tests/1M pop' int,
										   Population int
);							   
-----------------------------------------------------------------------------------------------										   

Create table covid_prison_cases_APM(state varchar(200) primary key 
									abbreviation varchar (20), 
								    staff_tests int, 
									staff_tests_with_multiples int,
									total_staff_cases int, 
									staff_recovered int, 
									total_staff_deaths int,
                                    staff_partial_dose int, 
									staff_full_dose int, 
									prisoner_tests int,
									prisoner_tests_with_multiples int, 
									total_prisoner_cases int,
									prisoners_recovered int, 
									total_prisoner_deaths int,
									prisoners_partial_dose int, 
									prisoners_full_dose int, 
									as_of_date date, 
									notes varchar(2000)							
);

select * 
from covid_prison_cases_APM;
-------------------------------------------------------------------------------------------------
Create table covid_prison_rates_APM(state varchar(200) primary key,
									latest_week date, cumulative_prisoner_cases int,
       								prisoner_cases_pct int, prisoner_case_rate int,
      								cumulative_prisoner_deaths int, prisoner_deaths_pct int,
       								prisoner_death_rate int, cumulative_staff_cases int, staff_cases_pct int,
       								staff_case_rate int, cumulative_staff_deaths int, staff_deaths_pct int, staff_death_rate int
);
								   

-------------------------------------------------------------------------------------------------
Create table prison_populations_APM(state varchar(200) primary key,
									abbreviation varchar (20),
									month date ,
									as_of_date date primary key,	
									pop int,
									Notes varchar (2000)
);		
--------------------------------------------------------------------------------------------------
Create table staff_populations_APM(state varchar(200) primary key,
								   abbreviation varchar (20),
								   month date,
								   as_of_date date,
								   pop int,
								   Notes Varchar(2000)

);

select*from staff_populations_APM;
select*from staff_populations_apm;
-------------------------------------------------------------------------------------------------
Create table Total_Prison_Covid_Stats_by_State_NYT(state varchar(200) primary key,
									abbreviation varchar (20),
									month date ,
									as_of_date date primary key,	
									pop int,
									Notes varchar (2000)
);