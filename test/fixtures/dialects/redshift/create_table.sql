CREATE TABLE t1 (
    col1 INTEGER PRIMARY KEY,
    col2 VARCHAR(5) NOT NULL
)
DISTKEY(col1)
SORTKEY(col1)
;

CREATE TABLE t1 (
    col1 INTEGER PRIMARY KEY,
    col2 VARCHAR(5) GENERATED BY DEFAULT AS IDENTITY (1, 1)
)
DISTKEY(col1)
SORTKEY(col1)
;

CREATE TABLE t1 (
    col1 INTEGER PRIMARY KEY,
    col2 VARCHAR(5),
    col3 VARCHAR(5),
    col4 VARCHAR(5),
    col5 VARCHAR(5),
    col6 VARCHAR(5)
)
DISTKEY (col1)
COMPOUND SORTKEY (col4, col5, col6)
;

CREATE TABLE t1 (
    col1 INTEGER PRIMARY KEY,
    col2 VARCHAR(5) REFERENCES t2 (col1)
)
DISTKEY(col1)
SORTKEY(col1)
;

CREATE TABLE IF NOT EXISTS t1 (
    col1 INTEGER PRIMARY KEY,
    col2 VARCHAR(5)
)
DISTKEY(col1)
SORTKEY(col1)
;

CREATE TEMPORARY TABLE t1 (
    col1 INTEGER PRIMARY KEY,
    col2 VARCHAR(5)
)
DISTKEY(col1)
SORTKEY(col1)
;

CREATE TEMP TABLE t1 (
    col1 INTEGER PRIMARY KEY,
    col2 VARCHAR(5)
)
DISTKEY(col1)
SORTKEY(col1)
;

CREATE LOCAL TEMPORARY TABLE t1 (
    col1 INTEGER UNIQUE,
    col2 VARCHAR(5)
)
BACKUP YES
;

CREATE TEMPORARY TABLE t1 (
    col1 INTEGER PRIMARY KEY,
    col2 VARCHAR(5)
)
BACKUP NO
DISTKEY(col1)
SORTKEY(col1, col2)
;

CREATE TABLE t1 (
    col1 INTEGER ENCODE AZ64 PRIMARY KEY,
    col2 VARCHAR(5) ENCODE TEXT255
)
DISTKEY(col1)
SORTKEY AUTO
DISTSTYLE EVEN
;

CREATE TABLE schema1.t1 (
    col1 INTEGER ENCODE AZ64 PRIMARY KEY,
    col2 VARCHAR(5) ENCODE TEXT255,
    col3 VARCHAR(5) COLLATE CASE_SENSITIVE,
    col3 VARCHAR(5) COLLATE CASE_INSENSITIVE
)
;

CREATE TABLE UniqueKey_demo (
 col1 INT NOT NULL UNIQUE
 ,col2 DATE
 ,col3 VARCHAR(60 )
, UNIQUE (col1)
) DISTKEY(col1)
COMPOUND SORTKEY(col1, col2);

CREATE TABLE UniqueKey_demo (
 col1 INT NOT NULL UNIQUE
 ,col2 DATE
 ,col3 VARCHAR(60 )
, PRIMARY KEY (col1)
) DISTKEY(col1)
INTERLEAVED SORTKEY (col1, col2);

CREATE TEMP TABLE IF NOT EXISTS UniqueKey_demo (
 col1 INT NOT NULL UNIQUE
 ,col2 DATE
 ,col3 VARCHAR(60 )
, FOREIGN KEY (col3) REFERENCES t2 (col5)
) ;

CREATE TEMP TABLE t1 (LIKE schema1.t2);

CREATE TEMP TABLE t1 (LIKE schema1.t2 INCLUDING DEFAULTS);

CREATE TABLE t1 (LIKE schema1.t2 EXCLUDING DEFAULTS);

CREATE TABLE some_schema.example_table (
    LIKE some_schema.another_table INCLUDING DEFAULTS
    , LIKE some_schema.next_table EXCLUDING DEFAULTS
    );

CREATE TABLE some_schema.example_table (
    LIKE some_schema.another_table INCLUDING DEFAULTS
    , col_name VARCHAR(5)
    );

CREATE TABLE some_table
(
    some_column INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IdentityColumn_demo (
    col1 BIGINT IDENTITY
);

CREATE TABLE IdentityColumnGeneratedByDefault_demo (
    col1 BIGINT GENERATED BY DEFAULT AS IDENTITY
);

CREATE TABLE IdentityColumnNotNull_demo (
    col1 BIGINT IDENTITY NOT NULL
);

CREATE TABLE IdentityColumnGeneratedByDefaultNotNull_demo (
    col1 BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL
);

create table public.t1 ( c1 int, c2 int, c3 int, unique (c1, c2) );

create table public.t2
(
    c1 int,
    c2 int,
    c3 int,
    foreign key (c1, c2) references public.t1 (c1, c2)
);

create table test(col1 varchar(max));
