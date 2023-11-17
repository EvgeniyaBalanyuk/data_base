--exercise_1
--не менее 4 исполнителей
insert into executor(name)
values('Ariana Grande'), ('Lady Gaga'), ('Billie Eilish'), ('Rihanna');

--не менее 3 жанров
insert into genre(name)
values('Rock'), ('Pop'), ('Hip-hop');

--не менее 3 альбомов
insert into album(name, years_of_release)
values('Renaissance', '2019'), ('Caprisongs', '2023'), ('Dawn FM', '2022');

--не менее 6 треков
insert into track(name, duration)
values('Nah Neh Nah', '4'), 
('Gonna Make You Sweat', '3'), 
('Sandstorm', '5'), 
('Popcorn', '2'), 
('Song 2', '6'), 
('Tom’s Diner', '3'),
('It"s my love', '7');


--не менее 4 сборников
insert into collection (name, years_of_release)
values ('Slippery When Wet', '1986'), 
('Baby One More Time', '1999'),
('Come Away with Me', '2002'),
('Confessions', '2004'),
('Platina', '2019');


--exercise_2
--Название и продолжительность самого длительного трека.
select name, duration from track
where duration > (select MAX(duration) from track)
order by duration desc;

--Название треков, продолжительность которых не менее 3,5 минут.
select name from track
WHERE duration < 3.5;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name from collection 
where years_of_release between 2018 and 2020;

--Исполнители, чьё имя состоит из одного слова.
select name from executor
where name not like '% %';

--Название треков, которые содержат слово «мой» или «my».
select name from track
where name like '%my%';


--exercise_3
--Количество исполнителей в каждом жанре.
select g.name, count(executor_id) from genre g 
join genre_and_executor gae on g.genre_id = gae.genre_id 
group by g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
select a.name, a.years_of_release, count(t.track_id) from album a 
JOIN track t ON a.album_id = t.album_id
WHERE a.years_of_release BETWEEN 2019 and 2020
GROUP BY a.name, a.years_of_release;

--Средняя продолжительность треков по каждому альбому.
SELECT a.name, AVG(t.duration) FROM album a
	JOIN track t ON a.album_id = t.album_id
	GROUP BY a.name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
select e.name from executor e
join album_and_executor aae on e.executor_id = aae.executor_id 
join album a on a.album_id = aae.album_id 
where e.name not in (select name from executor where years_of_release = '2020'); 

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.name FROM collection c
   JOIN collection_and_track cat ON c.collection_id = cat.collection_id
   JOIN track t ON t.track_id = t.track_id
   JOIN album a ON a.album_id = t.album_id
   JOIN album_and_executor aae  ON a.album_id = aae.album_id
   JOIN executor e ON e.executor_id = aae.executor_id
   WHERE e.name LIKE '%%Rihanna%%';
