create table musical_genre (
	genre_id SERIAL primary key,
	name VARCHAR(100) not null
	);
	
create table list_of_performers (
	executor_id SERIAL primary key,
	executor_name VARCHAR(100) not null
);

create table genre_and_executor (
	genre_id integer references genre(id),
	executor_id integer references executor(id),
	constraint genre_and_executor_pk primary key (genre_id, executor_id)
);

create table album (
	album_id SERIAL primary key,
	album_name VARCHAR(100) not null,
	years_of_release integer not null
);

create table album_and_executor (
	executor_id integer references executor(id),
	album_id  integer references album(id),
	constraint album_and_executor_pk primary key (executor_id, album_id)
);


create table track_list (
	track_id SERIAL primary key,
	track_name VARCHAR(100) not null,
	duration integer not null,
	album_id integer references album(id)
);

create table collection (
	collection_id SERIAL primary key,
	collection_name VARCHARE(100) not null,
	years_of_release integer not null
);

create table collection_and_track (
	track_id integer references track(id),
	collection_id integer references collection(id),
	constraint collectoin_and_track_pk primary key (track_id, collection_id) 
);

