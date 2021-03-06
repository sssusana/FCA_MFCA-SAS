
libname projfca 'C:\...';
options sasmstore= projfca mstored;
run;

*Perform Simple Correspondence Analysis Data Y2001;

ODS GRAPHICS ON;
TITLE;
TITLE1 "Simple Correspondence Analysis";
 
FOOTNOTE;
FOOTNOTE1 "Generated by the SAS System (&_SASSERVERNAME, &SYSSCPL) on %TRIM(%QSYSFUNC(DATE(), NLDATE20.)) at %TRIM(%SYSFUNC(TIME(), TIMEAMPM12.))";
 
proc corresp data=projfca.Y2001 observed cellchi2 rp cp
     outc=projfca.Coor01 plot;
   var Domestic Non_domestic Industry Agriculture ;
   id Region_NUTSII;
run;
 
/* End of task code */

RUN; QUIT;
TITLE; FOOTNOTE;
ODS GRAPHICS OFF;

TITLE2 " Macro AIDEAFC";
%AIDEAFC(IOA=2,IOS=2,IVA=2,IVS=2,DATA=projfca.Coor01,ID= Region_NUTSII);

