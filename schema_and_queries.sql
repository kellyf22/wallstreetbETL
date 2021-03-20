--Drop table if exists
DROP TABLE gme_reddit;

-- r/gme posts table
CREATE TABLE gme_reddit (
	post_id VARCHAR(20),
	title VARCHAR(1024),
	author VARCHAR(100),
	created DATE,
	score INT
);

-- AMC Stock Prices Table
Create Table AMC (
	date DATE,
	open DECIMAL,
	high DECIMAL,
	low DECIMAL,
	close DECIMAL,
	adj_close DECIMAL,
	volume BIGINT
);

-- Gamestop Stock Prices Table
Create Table GME (
	date DATE,
	open DECIMAL,
	high DECIMAL,
	low DECIMAL,
	close DECIMAL,
	adj_close DECIMAL,
	volume BIGINT
);

-- NYSE Table
Create Table NYA (
	date DATE,
	open DECIMAL,
	high DECIMAL,
	low DECIMAL,
	close DECIMAL,
	adj_close DECIMAL,
	volume BIGINT
);

-- NASDAQ Table
Create Table IXIC (
	date DATE,
	open DECIMAL,
	high DECIMAL,
	low DECIMAL,
	close DECIMAL,
	adj_close DECIMAL,
	volume BIGINT
);

-- S&P 500 Table
Create Table SP500 (
	date DATE,
	open DECIMAL,
	high DECIMAL,
	low DECIMAL,
	close DECIMAL,
	adj_close DECIMAL,
	volume BIGINT
);

--Queries--some examples of what you can do with our database!
SELECT * FROM GME;

SELECT r.created, SUM(r.score) AS "Cumulative Score", COUNT(r.created) AS "Frequency"
-- g.close AS "Stock price"
FROM gme_reddit as r
-- INNER JOIN GME as g 
-- on g.date = r.created
GROUP BY r.created
ORDER BY r.created
;

select * from gme_reddit
select * from GME
select r.post_id, r.title,r.author,r.created,r.score, g.open, g.high, g.low, g.close, g.volume
from gme_reddit as r
inner join GME as g on
r.created=g.date

select r.created AS "Date", SUM(r.score) AS "reddit score", MAX(g.close) AS "Closing Price", COUNT(r.created) AS "Post Frequency"
from gme_reddit as r
inner join GME as g on
r.created=g.date
GROUP BY r.created
ORDER BY r.created

--Make a new table showing reddit driving GME stock prices
CREATE TABLE gme_go_brrr AS (
select r.created AS "Date", SUM(r.score) AS "reddit score", MAX(g.close) AS "Closing Price", COUNT(r.created) AS "Post Frequency"
from gme_reddit as r
inner join GME as g on
r.created=g.date
GROUP BY r.created
ORDER BY r.created
)

SELECT * FROM gme_go_brrr
