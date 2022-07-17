tsplot variables= death
/id= week
/nolog
/format nofill NOREFERENCE.

tsplot variables= death_1
/id= week
/nolog
/FORMAT NOFILL NOREFERENCE.

compute lgdeath_1=lg10(death_1 + 154).
execute.
TSPLOT VARIABLES =lgdeath_1
/id= week
/NOLOG
/format NOFILL NOREFERENCE.

ACF
variables=lgdeath_1
/nolog
/mxauto 10
/serror = MA
/PACF.

ARIMA death
/model = (1 1 1)NOCONSTANT
/mxiter 10
/pareps .001
/ssqpct .001
/FORECAST EXACT.
acf
variables = err_1
/nolog
/MXAUTO 10
/SERROR = ma
/pacf.

*ARIMA.
TSET PRINT=DEFAULT cin=95 newvar=all.
predict thru end.
Arima death With acid
/model= (1 1 1) NOCONSTANT
/MXITER 10
/PAREPS .001
/SSQPCT .001
/forecast EXACT.
acf
variables = err_2
/nolog
/MXAUTO 10
/SERROR = ma
/pacf.
