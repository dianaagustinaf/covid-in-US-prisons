-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "state_abbreviation" (
    "state" varchar(200)   NOT NULL,
    "abbreviation" varchar(20)   NOT NULL,
    CONSTRAINT "pk_state_abbreviation" PRIMARY KEY (
        "state"
     )
);

CREATE TABLE "national_covid_statistics_us" (
    "state" varchar(20)   NOT NULL,
    "abbreviation" VARCHAR   NOT NULL,
    "TotalCases" INT   NOT NULL,
    "TotalDeaths" INT   NOT NULL,
    "Tot_Cases_1M_pop" INT   NOT NULL,
    "TotalTests" INT   NOT NULL,
    "Tests_per_1M_pop" INT   NOT NULL,
    "Population" INT   NOT NULL,
    CONSTRAINT "pk_national_covid_statistics_us" PRIMARY KEY (
        "state"
     )
);

CREATE TABLE "total_prison_covid_stats_by_state_nyt" (
    "state" varchar(200)   NOT NULL,
    "inmate_tests" int   NOT NULL,
    "total_inmate_cases" int   NOT NULL,
    "total_inmate_deaths" int   NOT NULL,
    "latest_inmate_population" int   NOT NULL,
    "max_inmate_population_2020" int   NOT NULL,
    "total_officer_cases" int   NOT NULL,
    "total_officer_deaths" int   NOT NULL,
    CONSTRAINT "pk_total_prison_covid_stats_by_state_nyt" PRIMARY KEY (
        "state"
     )
);

CREATE TABLE "prison_facilities_nyt" (
    "id" SERIAL   NOT NULL,
    "nyt_id" varchar(200)   NOT NULL,
    "facility_name" varchar(200)   NOT NULL,
    "facility_type" varchar(200)   NOT NULL,
    "facility_city" varchar(200)   NOT NULL,
    "facility_county" varchar(200)   NOT NULL,
    "facility_county_fips" INT   NOT NULL,
    "state" varchar(200)   NOT NULL,
    "facility_lng" DEC   NOT NULL,
    "facility_lat" DEC   NOT NULL,
    "latest_inmate_population" INT   NOT NULL,
    "max_inmate_population_2020" INT   NOT NULL,
    "total_inmate_cases" INT   NOT NULL,
    "total_inmate_deaths" INT   NOT NULL,
    "total_officer_cases" INT   NOT NULL,
    "total_officer_deaths" INT   NOT NULL,
    "note" varchar(200)   NOT NULL,
    CONSTRAINT "pk_prison_facilities_nyt" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "covid_prison_cases_apm" (
    "id" SERIAL   NOT NULL,
    "state" varchar(20)   NOT NULL,
    "abbreviation" varchar(20)   NOT NULL,
    "staff_tests" INT   NOT NULL,
    "staff_tests_with_multiples" INT   NOT NULL,
    "total_staff_cases" INT   NOT NULL,
    "staff_recovered" INT   NOT NULL,
    "total_staff_deaths" INT   NOT NULL,
    "staff_partial_dose" INT   NOT NULL,
    "staff_full_dose" INT   NOT NULL,
    "prisoner_tests" INT   NOT NULL,
    "prisoner_tests_with_multiples" INT   NOT NULL,
    "total_prisoner_cases" INT   NOT NULL,
    "prisoners_recovered" INT   NOT NULL,
    "total_prisoner_deaths" INT   NOT NULL,
    "prisoners_partial_dose" INT   NOT NULL,
    "prisoners_full_dose" INT   NOT NULL,
    "as_of_date" DATE   NOT NULL,
    "notes" VARCHAR(2000)   NOT NULL,
    CONSTRAINT "pk_covid_prison_cases_apm" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "covid_prisons_rates_apm" (
    "state" varchar(20)   NOT NULL,
    "latest_week" DATE   NOT NULL,
    "cumulative_prisoner_cases" INT   NOT NULL,
    "prisoner_cases_pct" DEC   NOT NULL,
    "prisoner_case_rate" VARCHAR(20)   NOT NULL,
    "cumulative_prisoner_deaths" INT   NOT NULL,
    "prisoner_deaths_pct" DEC   NOT NULL,
    "prisoner_death_rate" VARCHAR(20)   NOT NULL,
    "cumulative_staff_cases" INT   NOT NULL,
    "staff_cases_pct" DEC   NOT NULL,
    "staff_case_rate" VARCHAR(20)   NOT NULL,
    "cumulative_staff_deaths" INT   NOT NULL,
    "staff_deaths_pct" DEC   NOT NULL,
    "staff_death_rate" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_covid_prisons_rates_apm" PRIMARY KEY (
        "state"
     )
);

CREATE TABLE "prison_populations_apm" (
    "id" SERIAL   NOT NULL,
    "state" VARCHAR(200)   NOT NULL,
    "abbreviation" VARCHAR(100)   NOT NULL,
    "month" VARCHAR(100)   NOT NULL,
    "as_of_date" DATE   NOT NULL,
    "pop" INT   NOT NULL,
    CONSTRAINT "pk_prison_populations_apm" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "staff_populations_apm" (
    "id" SERIAL   NOT NULL,
    "state" varchar(200)   NOT NULL,
    "abbreviation" varchar(20)   NOT NULL,
    "month" varchar(200)   NOT NULL,
    "as_of_date" date   NOT NULL,
    "pop" INT   NOT NULL,
    "Notes" VARCHAR(1000)   NOT NULL,
    CONSTRAINT "pk_staff_populations_apm" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "state_abbreviation" ADD CONSTRAINT "fk_state_abbreviation_state" FOREIGN KEY("state")
REFERENCES "total_prison_covid_stats_by_state_nyt" ("state");

ALTER TABLE "state_abbreviation" ADD CONSTRAINT "fk_state_abbreviation_abbreviation" FOREIGN KEY("abbreviation")
REFERENCES "prison_populations_apm" ("abbreviation");

ALTER TABLE "national_covid_statistics_us" ADD CONSTRAINT "fk_national_covid_statistics_us_state" FOREIGN KEY("state")
REFERENCES "prison_facilities_nyt" ("state");

ALTER TABLE "total_prison_covid_stats_by_state_nyt" ADD CONSTRAINT "fk_total_prison_covid_stats_by_state_nyt_state" FOREIGN KEY("state")
REFERENCES "prison_facilities_nyt" ("state");

ALTER TABLE "covid_prison_cases_apm" ADD CONSTRAINT "fk_covid_prison_cases_apm_state" FOREIGN KEY("state")
REFERENCES "covid_prisons_rates_apm" ("state");

ALTER TABLE "covid_prisons_rates_apm" ADD CONSTRAINT "fk_covid_prisons_rates_apm_state" FOREIGN KEY("state")
REFERENCES "national_covid_statistics_us" ("state");

ALTER TABLE "prison_populations_apm" ADD CONSTRAINT "fk_prison_populations_apm_abbreviation" FOREIGN KEY("abbreviation")
REFERENCES "staff_populations_apm" ("abbreviation");

