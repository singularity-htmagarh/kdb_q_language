stockData:([] Date:date$(); Open:float$(); High:float$(); Low:float$(); Close:float$(); Adj_Close:float$(); Volume:int$(); Sym:symbol$())

loadCSV:{[file; sym]
    / Read the CSV File
    rawData: read0 file;
    header: first rawData;
    dataLines: 1_ rawData; / drop header line
    data: ("DFFFFFI";enlist ",") 0: dataLines; / parse CSV lines (date, 5 floats, int)
    / ensure column names match the `stockData` table
    data: data xcol `date`Open`High`Low`Close`Adj_Close`Volume;
    data: update Sym:sym from data;
    data: update Volume:int$Volume from data;
    `stockData insert data
 }

//Example Usage
stock_list: `AAPL`MSFT`AMZN`GOOGL`META

// Load data for each stock in the list
{[sym]
    file_path: "C:/Users/ADMIN/Documents/GitHub/kdb_q_language/data/" , string sym , ".csv";
    file: file_path;
    loadCSV[file; sym]
} each stock_list


 save `stockData