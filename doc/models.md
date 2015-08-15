Models for wobtrack
===================

Track:
------

    bin/rails g scaffold Track name:string description:text date:date:index \
              wobauth_user:references creator:string

Trackpoint:
-----------

    bin/rails g scaffold Trackpoint 'longitude:decimal{10,8}' \
              'latitude:decimal{10,8}' 'elevation{8,2}' time:datetime \
              track:references heart_rate:integer
