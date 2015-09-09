## Jenkins Job Database Manager Plugin for PostgreSQL

[![GitHub license](https://img.shields.io/github/license/jbox-web/job-database-manager-postgresql.svg)](https://github.com/jbox-web/job-database-manager-postgresql/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/jbox-web/job-database-manager-postgresql.svg)](https://github.com/jbox-web/job-database-manager-postgresql/releases/latest)
[![Code Climate](https://codeclimate.com/github/jbox-web/job-database-manager-postgresql/badges/gpa.svg)](https://codeclimate.com/github/jbox-web/job-database-manager-postgresql)
[![Download](https://img.shields.io/github/downloads/jbox-web/job-database-manager-postgresql/latest/job-database-manager-postgresql.hpi.svg)](https://github.com/jbox-web/job-database-manager-postgresql/releases/download/1.0.0/job-database-manager-postgresql.hpi)

### A Jenkins plugin that automatically set up PostgreSQL test databases for Jenkins jobs, easy ;)

## Installation

Download the [hpi file](https://github.com/jbox-web/job-database-manager-postgresql/releases/download/1.0.0/job-database-manager-postgresql.hpi) and install it within Jenkins interface.

## Configuration

In the global Jenkins configuration, set up host and port of your
PostgreSQL server and enter credentials of the PostgreSQL user that shall be
used to create databases and grant permissions. Note that this user
needs at least CREATEDB and CREATEROLE permissions.

## Usage

Configure a database name in a job. The plugin ensures the database
exists when the job is run. It grants all permissions for the database
to a job specific user and publishes its credentials in the
environment variables `$PGSQL_USER` and `$PGSQL_PASSWORD`.
It also ensures that the database is dropped at the end of the job.

These environment variables will be injected in the build :

* `$PGSQL_DATABASE`
* `$PGSQL_USER`
* `$PGSQL_PASSWORD`
* `$PGSQL_HOST`
* `$PGSQL_PORT`

## See also

There is also a MySQL variant of this plugin : https://github.com/jbox-web/job-database-manager-mysql

## Contribute

You can contribute to this plugin in many ways such as :
* Helping with documentation
* Contributing code (features or bugfixes)
* Reporting a bug
* Submitting translations
