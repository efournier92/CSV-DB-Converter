#CSV to DB Converter

This is a simple converter app I made to practice connecting to a PostgreSQL database from Ruby. I accomplished this using the `pg` gem

Moreover, this app can push `CSV` data into a PostgreSQL database and print out PSQL data from the database to the CLI with Ruby.

##Setup Instructions

```no-highlight
$ psql

$=# \c ingredients;

$=# CREATE DATABASE ingredients;

$=# CREATE TABLE ingredients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
  );

$=# COPY ingredients(id, name)
    FROM '(path_to_project)/ingredients.csv' DELIMITER ',' CSV;
```

##ScreenShots
![CSV-DB-Converter_Output]()
