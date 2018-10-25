/* proc print */

proc print data=kostat.cars1(obs=30); 
run;

/* proc means */

/*���1*/
PROC MEANS DATA=sashelp.cars;
	VAR MPG_City;
	CLASS Origin;
	OUTPUT OUT=kostat.output_cars; /* OUTPUT OUT = �������͸� */
RUN;

DATA kostat.mean_MPG_City;
	SET kostat.output_cars(WHERE=(_STAT_="MEAN"));
RUN;

/*���2*/
PROC MEANS DATA=sashelp.cars;
	VAR MPG_City;
	CLASS Origin;
	OUTPUT OUT=kostat.mean_cars MEAN=avg MEDIAN=med STD=sd;  /* OUTPUT OUT = �������͸� MEAN = �������ͼ¿����� �������� */
RUN;

/* proc univariate */

PROC UNIVARIATE DATA = sashelp.class;
	VAR height;
	HISTOGRAM height /NORMAL;
RUN;

/* proc tabulate */

  ods trace on;

 proc tabulate data=sashelp.cars;
 	class origin;
	var mpg_city;
	table origin, mpg_city * (mean std);
	ods output table = work.new;
run;

/* keep */

data q2;
set q;
keep sex p08aa017-p08aa023 p08bb002 p08ed001;
run;

/* sort */

proc sort data=policy;
by id;
run;

/* merge */

data kostat.m_cars;
	merge kostat.cars1 kostat.cars2;	
	by make model;
run;

/* set */

data kostat.s_cars;
	set kostat.cars3 kostat.cars4;
run;

/* glm */ 

proc glm data=hw5_1;
	model p08bb002=sex /solution;
run;

/* test for revision_kayshin */

proc contents data=hw5_1;
run;