tab: ([] timestamp: `timestamp$(); sym: `symbol$(); price: `float$(); size: `int$())

`tab insert (.z.p; `AAPL; 150.25; 100)
`tab insert (.z.p + 00:01:00; `GOOG; 2800.50; 50)
`tab insert (.z.p + 00:02:00; `MSFT; 300.75; 200)

show tab;

show select from tab where sym=`MSFT;

