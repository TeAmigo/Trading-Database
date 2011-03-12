# README FOR TRADING DATABASE #
<2011-03-11 Fri 16:14>
The file tradingschema.sql contains all the necessary schema information to create the trading database
used by ptsupdater and ptscharts. Unfortunately, there is a lot else in there that isn't necessary. 
None of the stored functions used in ptsupdater or ptscharts rely upon pljava or plr. The only 
extension relied upon is plpgsql. No data is included.
