-------------------------------------------------------------------------------
-- Purpose: Delivery instructions for March 2025 PSCIS data fix
-- Date:    March 15, 2025
-------------------------------------------------------------------------------


OVERVIEW
--------
A database administrator with appropriate access privileges should run the
required script in the PSCIS database.


FILES IN THIS RELEASE
---------------------
The following files are contained within this release:

pscis_datafix_20250315.sql
readme.txt


INSTALLATION INSTRUCTIONS
-------------------------

-------------------------------------------------------------------------------
1.  DATABASE UPDATES
-------------------------------------------------------------------------------

1.1 Connect to the target database as pscis using sqlplus

    sqlplus pscis/<password>@<instance>

Where <instance> is one of:

      DVLR: envdlvr1
      TEST: envtest1
      PROD: envprod1


1.2 Run script

    start pscis_datafix_20250315_master.sql


1.3  If there are no errors from the above script, commit the changes.

    commit;

1.4 Exit sqlplus

    exit