noiserver
=========

Restful webservice for medium-frequency signal streaming.

Assumes `mongod` is running on `localhost`, and uses a db called `noiserver`.

## Structure

```
/                   [GET]
  info/             [GET]
  instrument/       [GET]
    info/           [GET]
    wii/            [GET]
      mote/         [GET, POST]
        info/       [GET]
        {id}/       [GET, PUT, DELETE]
          {sensor}  [GET, PUT]
      guitar/       [GET, POST]
        ...
    mobile/         [GET]
      ???
```
