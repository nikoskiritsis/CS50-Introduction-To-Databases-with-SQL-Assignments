# Design Document

By NIKOLAOS KYRITSIS

Video overview: <https://youtu.be/Hi--zjEUZCM>

## Scope

The database for CS50 SQL includes all elements necessary to represent songs and their creators. As such, included in the database's scope is:

* Artists, including basic identifying information
* Producers, including basic identifying information
* Songs, including the time at which the song was released and the music genre it belongs

Out of scope are elements like streams of a song, prizes an artist could have won etc.

## Functional Requirements

This database will support:

* CRUD operations for artists, producers and songs
* Finding all songs made by an artist or producer
* Viewing songs released in a particular year, by genre.
* Finding collaborations among producers and artists.


* What's beyond the scope of what a user should be able to do with your database?

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The database includes the following entities:

#### Artists

The `artists` table includes:

* `id`, which specifies the unique ID for the artist as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the artist's name as `TEXT`, given `TEXT` is appropriate for name fields.
* `age`, which specifies the artist's age as `INTEGER`, given `INTEGER` is appropriate for age fields.

All columns in the `artists` table are required and hence should have the `NOT NULL` constraint applied. No other constraints are necessary.

#### Producers

The `producers` table includes:

* `id`, which specifies the unique ID for the producer as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the producer's name as `TEXT`, given `TEXT` is appropriate for name fields.
* `age`, which specifies the producer's age as `INTEGER`, given `INTEGER` is appropriate for age fields.

All columns in the `artists` table are required and hence should have the `NOT NULL` constraint applied. No other constraints are necessary.

#### Songs

The `songs` table includes:

* `id`, which specifies the unique ID for the song as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `name`, which specifies the song's name as `TEXT`, given `TEXT` is appropriate for name fields.
* `genre`, which specifies the song's genre it belongs as `TEXT`, given `TEXT` is appropriate for genre's name fields.
* `year`, which specifies the song's release year as `INTEGER`, given `INTEGER` is appropriate for year fields.

All columns in the `songs` table are required and hence should have the `NOT NULL` constraint applied. No other constraints are necessary.

#### Song by

The `song_by` table includes:

* `id`, which specifies the unique ID for the song-artist correlation as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `song_id`, which is the ID of the song which is sung by the artist as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `songs` table to ensure data integrity.
* `artist_id`, which is the ID of the artist which is the singer of the song as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `artist` table to ensure data integrity.

All columns are required but the `NOT NULL` constraint is not needed because all columns have a `PRIMARY KEY` or `FOREIGN KEY` constraint.

#### Song by

The `produced_by` table includes:

* `id`, which specifies the unique ID for the producer-artist correlation as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `song_id`, which is the ID of the song which is produced by the producer as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `producers` table to ensure data integrity.
* `producer_id`, which is the ID of the producer which is the producer of the song as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `producers` table to ensure data integrity.

All columns are required but the `NOT NULL` constraint is not needed because all columns have a `PRIMARY KEY` or `FOREIGN KEY` constraint.

### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![ER Diagram](diagram.png)

As detailed by the diagram:

* One artist is capable of making 1 to many songs. 1, because an artist must have some work to show, and many if they make more than one songs. A song is made by one or many artists, because they can collaborate.
* One producer is capable of producing 1 to many songs. 1, because a producer must have some work to show, and many if they produce more than one songs. A song is produced by one and only one producer. It is assumed that producers will not collaborate.
* A song is associated with one or many artists, whereas a song can be produced by one and only one producer.

## Optimizations

Per the typical queries in `queries.sql`, it is common for users of the database to access all songs submitted by any particular artist. For that reason, indexes are created on the `name` column to speed the identification of artists by those columns.
The same logic is applied in creating an index for the `producers` table, listing producers by the `name` column.

Similarly, it is also common practice for a user of the database to concerned with viewing all songs who got released on a specific year. As such, an index is created on the `year` column in the `song` table to speed the identification of songs by year.

## Limitations

The current schema assumes a song can only belong to one genre. Songs with multiple genres would require a shift to a many-to-many relationship between songs and genres.
