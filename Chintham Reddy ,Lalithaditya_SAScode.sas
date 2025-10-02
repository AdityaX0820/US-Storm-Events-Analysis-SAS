libname Project "C:\Users\akhil\OneDrive\Desktop\Statistical Methods 930 to 1215\Project";

proc import datafile='C:\Users\akhil\OneDrive\Desktop\Statistical Methods 930 to 1215\Project\2022.csv'
    out=project.Data2022
    dbms=csv
    replace;
    getnames=yes;
run;

proc import datafile='C:\Users\akhil\OneDrive\Desktop\Statistical Methods 930 to 1215\Project\2023.csv'
    out=project.Data2023
    dbms=csv
    replace;
    getnames=yes;
run;

proc import datafile='C:\Users\akhil\OneDrive\Desktop\Statistical Methods 930 to 1215\Project\2024.csv'
    out=project.Data2024
    dbms=csv
    replace;
    getnames=yes;
run;

data project.MergedData;
    set project.Data2022 project.Data2023 project.Data2024;
run;

proc contents data=project.MergedData;
run;

proc print data=project.MergedData(obs=10);
run;

data project.MergedData_Cleaned;
    set project.MergedData;
    drop BEGIN_YEARMONTH BEGIN_DAY BEGIN_TIME END_YEARMONTH END_DAY END_TIME STATE_FIPS CZ_FIPS WFO CZ_TIMEZONE SOURCE;
run;

proc contents data=project.MergedData_Cleaned;
run;

proc print data=project.MergedData_Cleaned(obs=10);
run;

proc sort data=project.MergedData_Cleaned out=project.SortedData;
    by STATE;
run;

proc means data=project.sorteddata n mean median min max stddev;
    var INJURIES_DIRECT INJURIES_INDIRECT DEATHS_DIRECT DEATHS_INDIRECT;
run;

proc freq data=project.MergedData;
    tables STATE EVENT_TYPE CZ_TYPE / nocum nopercent;
run;

proc sgplot data=project.MergedData_Cleaned;
    vbar EVENT_TYPE / response=INJURIES_DIRECT stat=sum datalabel;
    title "Total Direct Injuries by Event Type";
run;

data project.damageMergedData_Cleaned;
    set project.MergedData_Cleaned;
    
    /* Check for the presence of 'K' and convert to numeric */
    if find(DAMAGE_PROPERTY, 'K') > 0 then 
        DAMAGE_PROPERTY_NUM = input(scan(DAMAGE_PROPERTY, 1, 'K'), best32.) * 1000;
    else if find(DAMAGE_PROPERTY, 'M') > 0 then
        DAMAGE_PROPERTY_NUM = input(scan(DAMAGE_PROPERTY, 1, 'M'), best32.) * 1000000;
    else DAMAGE_PROPERTY_NUM = .; /* Handle missing or unexpected formats */
run;

proc sgplot data=project.damageMergedData_Cleaned;
    histogram DAMAGE_PROPERTY_NUM / binwidth=10;
    density DAMAGE_PROPERTY_NUM / type=kernel;
    title "Distribution of Property Damage";
run;


proc template;
    define statgraph PieChart;
        begingraph;
        layout region;
        piechart category=EVENT_TYPE / stat=pct datalabellocation=inside;
        endlayout;
        endgraph;
    end;
run;

proc sgrender data=project.damageMergedData_Cleaned template=PieChart;
run;

proc anova data=project.damageMergedData_Cleaned;
    class EVENT_TYPE; /* Categorical variable */
    model DAMAGE_PROPERTY_NUM = EVENT_TYPE; /* Numerical variable */
    means EVENT_TYPE / tukey; /* Post-hoc test to identify significant differences */
run;

proc reg data=project.damageMergedData_Cleaned;
    model DAMAGE_PROPERTY_NUM = INJURIES_DIRECT; /* Response = Predictor */
run;

proc ttest data=project.damageMergedData_Cleaned;
    class CZ_TYPE; /* Two groups (e.g., County vs. Zone) */
    var DAMAGE_PROPERTY_NUM; /* Numerical variable */
run;


