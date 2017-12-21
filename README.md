# Scripter

## Summary
`Scripter` is a Swift program that works through data (JSON in this case) to work on a database. The idea is that if you need to import/update or manipulate a bigger file of data it would be much quicker to simply rewrite a little script for it.

This script could be your template by already having the components you need (MySQL, JSON).

In the future this script may be published with further options (CSV, MongoDB etc.) but so far this is a start.

## Configuration
It requires a 'config.json' file present in the folder from which you are calling the program. The structure of the config file is:
```
{
"mysql": {
"host": "localhost",
"user": "skelpo",
"password": "4242",
"database": "secret"
}
}
```


