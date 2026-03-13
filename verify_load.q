\l upload.q

/ preserve schema but clear rows to avoid duplicate inserts
stockData: 0#stockData;

/ load AAPL and show summary
loadCSV["data/AAPL.csv"; `AAPL];

loadedCount: count select from stockData where Sym=`AAPL;
show `loadedCount!loadedCount;

/ show first 5 rows for AAPL
show 5#select from stockData where Sym=`AAPL;

\n