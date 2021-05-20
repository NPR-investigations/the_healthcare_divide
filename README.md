# Data Analysis for The Healthcare Divide project

Stories reported by Emma Schwartz, Laura Sullivan, Nick Verbitsky and I.<br>
Links are below<br>
https://www.pbs.org/wgbh/frontline/film/the-healthcare-divide/<br>
https://www.npr.org/2021/05/18/996207511/hospitals-serving-the-poor-struggled-during-covid-wealthy-hospitals-made-million<br>

The collaboration looks at the differences between the hospital haves and the hospital have nots, with a focus on urban safety net hospitals.<br>

# HHS hospital capacity data analysis

Zachary Levin. PhD Student at the University of Minnesota School of Public Health, and Pinar Karaca-Mandic, PhD, Professor at Carlson School of Management, University of Minnesota conducted this analysis with input from NPR.

Using [HHS's COVID-19 Reported Patient Impact and Hospital Capacity dataset](https://beta.healthdata.gov/Hospital/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/anag-cw7u), we compared the adult inpatient bed occupancy rate of acute care safety net hospitals with other acute care hospitals between August 2020 and the first week of May. 

We identified acute care hospitals through filtering out children's hospitals, which is available in HHS dataset, as well as psychiatric hospitals, through [CMS's provider information dataset](https://data.cms.gov/provider-data/dataset/77hc-ibv8)

Since there is no set definition for safety net hospitals (see [journal article](https://www.nejm.org/doi/full/10.1056/NEJMp2030228)), we use the [member list of America's Essential Hospitals](https://essentialhospitals.org/about/listing-of-americas-essential-hospitals-members/) and see how they fared compared to non members, controlling for urban/rural, market as defined by hospital referral regions, and week.

The members are identified by their CMS Certification Number, or CCNs, provided by AEH. We did not include members that do not have their own CCNs. The list of CCNs is [here](https://github.com/jhuo7/the_healthcare_divide/blob/main/AEHMemberIDs.csv)

The [code](https://github.com/jhuo7/the_healthcare_divide/blob/main/npr_regressions_safetynet_export.do) was written in Stata. The results are [here](https://github.com/jhuo7/the_healthcare_divide/blob/main/safetynet_regressions_3.xlsx)

## Analyzing supplemental payment data in Tenessee
[Jupyter notebook used to pull JAR data](https://github.com/jhuo7/the_healthcare_divide/blob/main/20210414_parsing_doh_jar_files.ipynb)
[Jupyter notebook containing data analysis](https://github.com/jhuo7/the_healthcare_divide/blob/main/20210517_healthcare_divide_for_sharing.ipynb)
