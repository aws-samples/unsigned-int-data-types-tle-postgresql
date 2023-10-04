## Unsigned integer (and other) data types for PostgreSQL using Trusted Language Extensions

These Trusted Language Extensions provides additional integer types for PostgreSQL:

- `int1` (signed 8-bit integer)
- `uint1` (unsigned 8-bit integer)
- `uint2` (unsigned 16-bit integer)
- `uint4` (unsigned 32-bit integer)
- `uint8` (unsigned 64-bit integer)

### Installation of Trusted Language Extensions in PostgreSQL

These custom PostgreSQL data types are written as PostgreSQL Trusted Language Extensions. For more information on how to install this base extension, please see the related documentation/repository: 
   [pg_tle](https://github.com/aws/pg_tle) 

### Installation of custom data types in this repository

  Copy the contents of the desired extension's SQL file and execute against the desired database OR run the sql file directly against the desired database using psql: 
    ```
  psql -h <host> -d <mydatabase> -f /home/user/git/unsigned-int-data-types-tle-postgresql/uint2.sql
```

If the instalation is sucessful, you will see the following output: 

```
install_extension
-------------------
 t
(1 row)
```
Next, enable your TLE extension:

```
CREATE EXTENSION pg_uint2;
```

In order to verify the new data type is installed, use the following PSQL command: 

```
tle_test=> \dT
       List of data types
 Schema |   Name   | Description
--------+----------+-------------
 public | pg_uint2 |
(1 row)
```
### Usage
Create a table that uses your new data type Trusted Language Extension: 

```
CREATE TABLE employee_info(
empl_id pg_uint2,
empl_age SMALLINT,
empl_name TEXT
);

CREATE TABLE
```

### For more information on using custom data types with Trusted Language Extensions, please see the following link to the related AWS blog: [Create custom PostgreSQL data types using Trusted Language Extensions](https://aws.amazon.com/blogs/database/create-custom-postgresql-data-types-using-trusted-language-extensions/) 

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

