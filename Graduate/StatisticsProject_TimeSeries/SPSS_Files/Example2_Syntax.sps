tsplot variables= quality
/id= week
/nolog
/format nofill NOREFERENCE.

tsplot variables= quality_1
/id= week
/nolog
/FORMAT NOFILL NOREFERENCE.

compute lgqual_1=lg10(quality_1 + 12).
execute.
TSPLOT VARIABLES =lgqual_1
/id= week
/NOLOG
/format NOFILL NOREFERENCE.

ACF
variables=quality_1
/nolog
/mxauto 10
/serror = MA
/PACF.

ARIMA quality
/model = (0 1 1)NOCONSTANT
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

ARIMA quality
/model = (1 1 0)NOCONSTANT
/mxiter 10
/pareps .001
/ssqpct .001
/FORECAST EXACT.
acf
variables = err_2
/nolog
/MXAUTO 10
/SERROR = ma
/pacf.

DO A MOFO FORECAST BEACHES! Then back to all cases!

*ARIMA.
TSET PRINT=DEFAULT cin=95 newvar=all.
predict thru end.
Arima quality With popquiz
/model= (1 1 0) NOCONSTANT
/MXITER 10
/PAREPS .001
/SSQPCT .001
/forecast EXACT.
acf
variables = err_3
/nolog
/MXAUTO 10
/SERROR = ma
/pacf.
