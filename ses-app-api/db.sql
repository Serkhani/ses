drop database ses_database;
drop user sestracker;
create user ses_tracker with password '';
create database ses_database with template=template0 owner=ses_tracker;
\connect ses_database;
alter default privileges grant all on tables to ses_tracker;
alter default privileges grant all on sequences to ses_tracker;