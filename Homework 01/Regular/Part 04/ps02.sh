psql --host=dbbigdata.cysswqwhkda8.us-east-1.rds.amazonaws.com --port=5432 --username Admnistrator --dbname bigDataStock -f create_trading_table.sql;
psql --host=dbbigdata.cysswqwhkda8.us-east-1.rds.amazonaws.com --port=5432 --username Admnistrator --dbname bigDataStock -f pop_trading_table.sql;
