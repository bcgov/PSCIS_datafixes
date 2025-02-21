# PSCIS datafixes

Tracking and fixing data issues in the BC Provincial Stream Crossing Information System (PSCIS)

PSCIS layers available through DataBC Catalogue:

- [Assessments](https://catalogue.data.gov.bc.ca/dataset/pscis-assessments)
- [Confirmations](https://catalogue.data.gov.bc.ca/dataset/pscis-habitat-confirmations)
- [Designs](https://catalogue.data.gov.bc.ca/dataset/pscis-design-proposal)
- [Remediations](https://catalogue.data.gov.bc.ca/dataset/pscis-remediation)

## Workflow

- to log a PSCIS data error, open an issue in this repo (and note proposed fix if apparent)
- when a data fix has been requested/scheduled, generate scripts to apply fixes:
	+ create date stamped folder in /fixes
	+ add readme and sql files per previous fixes
	+ populate sql with data fix commands
	+ request replication of current PSCIS data from `ENVPROD1` to `ENVTEST1`
	+ test scripts against newly replicated data in `ENVTEST1` (requires internal access to bcgov networks)
	+ check out the PSCIS svn repo, add fix folder, commit to svn
	+ DBA to apply scripts to both `TEST` and `PROD`

## svn example

```
# check out the repo
$ svn checkout https://a100.gov.bc.ca/pub/svn/pscis/data-fix pscis_repo

# copy prepped fixes to svn
$ cp -r fixes/2019-11-20 pscis_repo/2019-11-20

# check status
$ cd chkout
$ svn status
?       2019-11-20

$ svn add 2019-11-20
A         2019-11-20
A         2019-11-20/pscis_datafix.sql
A         2019-11-20/pscis_datafix_master.sql
A         2019-11-20/readme.txt

$ svn commit -m "relevant commit message"
Adding         2019-11-20
Adding         2019-11-20/pscis_datafix.sql
Adding         2019-11-20/pscis_datafix_master.sql
Adding         2019-11-20/readme.txt

Transmitting file data ....
Committed revision 97.
```	

## References

- [Fish Passage Technical Working Group](https://www2.gov.bc.ca/gov/content/environment/plants-animals-ecosystems/fish/aquatic-habitat-management/fish-passage/fish-passage-technical)
- [Assessment Field Guide](https://www2.gov.bc.ca/assets/gov/environment/natural-resource-stewardship/land-based-investment/forests-for-tomorrow/field-assessment-for-determining-fish-passage-status-of-cbs.pdf)
- [PSCIS user guide](https://www2.gov.bc.ca/assets/gov/environment/natural-resource-stewardship/land-based-investment/forests-for-tomorrow/pscis-user-guide-v2.pdf)
