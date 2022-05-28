# ETL PROJECT II

# COVID Cases in Prisons in the US

## Team: 

Kudzanai Mukahiwa    |    Noshaad Ahmed    |    Diana Fernández

## Sources: 

* The Marshall Project & The Associated Press

The Marshall Project, the nonprofit investigative newsroom dedicated to the U.S. criminal justice system, has partnered with The Associated Press to compile data on the prevalence of COVID-19 infection in prisons across that country.

Link to source: https://data.world/associatedpress/marshall-project-covid-cases-in-prisons


* The New York Times

From March 2020 until the end of March 2021, The New York Times collected data about coronavirus infections, deaths and testing for state and federal prisons.

Link to source: https://github.com/nytimes/covid-19-data/tree/master/prisons


* Worldometers

Worldometer.info is an international website that publishes world statistics data that is sourced from reliable sources worldover. For this project, we will obtain from their website data showing coronavirus deaths by US state.

Link to source: https://www.worldometers.info/coronavirus/country/us/


* Social Security

Social Security is a United States government department that is responsible for providing financial security to US citizens. We will obtain from their website a table with state names and two letter state abbreviations of every state in the US. It will allow us to join N°1, N°2 and N°3 datasets.

Link to source: https://www.ssa.gov/international/coc-docs/states.html

---

## Database:

Once all the data is obtained from the links listed above, we will design our tables. Those  will be used to produce a relational database in PostgreSQL. The relational database will have an ERD diagram.

---

## Description:

We have chosen to make an ETL on Covid cases in prison data. What happens in prisons are often looked passed as prisoners are looked down upon in society. These individuals are vulnerable and in fact are at a higher risk than the general public.
Our aim is to provide a good source of data to analyze and give a better understanding of how covid impacted prisons. These will be achieved at first with official data from the United States by State.
Data collected by The Marshall Project and AP shows that hundreds of thousands of prisoners, workers, correctional officers and staff have caught the illness as prisons became the center of some of the country’s largest outbreaks. And thousands of people, most of them incarcerated, have died.

The New York Times has also collected data about coronavirus infections, deaths and testing for state and federal prisons; immigration detention centers; juvenile detention facilities; local, regional and reservation jails; and those in the custody of the U.S. Marshals Service.

We will join them through state abbreviations provided by Social Security (a United States government department).

And finally, we will add national (US) Covid statistics from Worldometer, that will provide the possibility of comparison, for example the likelihood of a person in prison dying from Covid-19 compared to those that are not in prison. 
