/*******************************************************************************

	Code to generate regressions for Safety-Net Analysis
	Developed by the University of Minnesota COVID-19 Hospitalization Tracking Project

	This code relies on data from:
		- HHS (https://urldefense.com/v3/__https://healthdata.gov/Hospital/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/anag-cw7u__;!!Iwwt!BWBOtXy0bpMa45OVvSSwO0YIHDgm22qwxa7A31iu6EqA8uALYUGE3XhaeQ$ )
			--  Details on the construction/cleaning of this data can be found in our weekly files here:
				https://urldefense.com/v3/__https://drive.google.com/drive/folders/12XBifvy1PlP-R7RAa4gqcK7jFHLPxbA5__;!!Iwwt!BWBOtXy0bpMa45OVvSSwO0YIHDgm22qwxa7A31iu6EqA8uALYUFjNTzb6g$
		- Dartmouth Atlas (https://urldefense.com/v3/__https://data.dartmouthatlas.org/supplemental/__;!!Iwwt!BWBOtXy0bpMa45OVvSSwO0YIHDgm22qwxa7A31iu6EqA8uALYUGdIkthUg$ )
		- CMS provider information https://data.cms.gov/provider-data/dataset/77hc-ibv8
		- America's Essential Hospitals https://essentialhospitals.org/about/listing-of-americas-essential-hospitals-members/

*******************************************************************************/

gen is_metro = is_metro_micro == "true"

* Generate the Outcome
gen pct_hospital_beds_occupied_all = (all_adult_hospital_ip_bed_occ / all_adult_hospital_ip_beds) * 100
drop if pct_hospital_beds_occupied_all > 200 & pct_hospital_beds_occupied_all != .

* Analyses - August to Present (5/14)
unique ccn
reg pct_hospital_beds_occupied_all safety_net is_metro i.hrrnum i.date_start, cluster(ccn)
margins, predict(xb) at(safety_net = 0)
margins, predict(xb) at(safety_net = 1)
reg pct_hospital_beds_occupied_all safety_net i.hrrnum i.date_start if is_metro == 1, cluster(ccn)
reg pct_hospital_beds_occupied_all safety_net i.hrrnum i.date_start if is_metro == 0, cluster(ccn)

* Analyses - December/January Restricted Period
keep if month(date_start) == 1 | month(date_start) == 12
reg pct_hospital_beds_occupied_all safety_net is_metro i.hrrnum i.date_start, cluster(ccn)
margins, predict(xb) at(safety_net = 0)
margins, predict(xb) at(safety_net = 1)
reg pct_hospital_beds_occupied_all safety_net i.hrrnum i.date_start if is_metro == 1, cluster(ccn)
reg pct_hospital_beds_occupied_all safety_net i.hrrnum i.date_start if is_metro == 0, cluster(ccn)
