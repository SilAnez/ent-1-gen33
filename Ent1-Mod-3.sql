--------USERS---------
create table users(
  id serial primary key,
  first_name varchar(30),
  last_name varchar(30),
  email varchar(30)
)

insert into users(first_name,last_name, email) values 
	('Silvestre','Añez','silvestre@mail.com'), --1
	('Irene','Rossetti','irene@mail.com'), --2
	('Claudio','Cuellar','claudio@mail.com'); --3

select * from users

--------POSTS---------
create table posts(
  id serial primary key,
  creator_id int references users(id),
  title varchar(70),
  text text
)
insert into posts(creator_id,title,text) values 
/*1*/(1,'Los mejores Mmmorpg del 2023','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur'), 
/*2*/(2,'Musica clásica estudio de La Traviata','La Traviata, de Giuseppe Verdi, es una ópera en tres actos con libreto en italiano de Francesco Maria Piave, inspirado en la novela de La dama de las camelias, de Alexandre Dumas. Ambientada alrededor de 1700, se basa en la historia de una famosa cortesana de París, Alphonsine Plessis, cuya vida es considerada uno de los mayores exponentes del Romanticismo Francés.'),
/*3*/(3,'Construccion de Instrumentos con Palisandro de la India','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur'),
/*4*/(2,'Musica clásica estudio de La Flauta Magica','La flauta mágica es la última ópera escenificada de Wolfgang Amadeus Mozart. El libreto, en alemán de Emanuel Schikaneder, tiene lugar dentro de un cuento de hadas. Su argumento ha sido muy discutido a lo largo de la historia porque, mientras que muchos investigadores solo ven el propio cuento de hadas, otros aprecian en la obra el simbolismo y las referencias masónicas.'),
/*5*/(3,'Que estilo de madera ocupar en la construccion de tu guitarra clasica?','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur'),
/*6*/(1,'Como realizar mantenimiento a tu PC?','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur');	
select * from posts

--------LIKES---------
create table likes(
  id serial primary key,
  users_id int references users(id),
  posts_id int references posts(id)	
)

insert into likes(users_id,posts_id) values 
(1,2),
(1,3),
(2,1),
(2,4),
(3,1),
(3,6);

select * from likes

------JOINS-------
--Trae todos los posts y la información del usuario del campo creator_id
select u.id as id_user,p.creator_id as id_contenide_creator,u.first_name, u.last_name, u.email, 
p.id as id_publication, p.title, p.text
from posts as p
inner join users as u 
on p.creator_id = u.id
order by 1 asc

--Trae todos los posts, con la información de los usuarios que les dieron like.

select p.id,p.title,l.users_id as id_users_like, u.first_name as name_users_like, 
u.last_name as last_name_users_like
from posts as p
inner join likes as l on p.id = l.posts_id
inner join users as u on l.users_id = u.id
order by 1 asc



