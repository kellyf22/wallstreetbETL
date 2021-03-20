DROP TABLE REDDIT

Create Table reddit (
	user_id VARCHAR,
	title VARCHAR,
	author VARCHAR,
	created DATE,
	Score INT

)

Select * From reddit

set client_encoding to 'UTF8'

Create Table GME (
	date DATE,
	open DECIMAL,
	high DECIMAL,
	low DECIMAL,
	close DECIMAL,
	adj_close DECIMAL,
	volume BIGINT

)

Select * From GME
