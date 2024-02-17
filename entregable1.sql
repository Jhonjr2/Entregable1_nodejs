-- Creando tabla users --

create table users (
 id serial primary key,
 firstname varchar (50),
 lastname varchar (50),
 email varchar (50)
);

-- insertando tres users

insert into users (firstname, lastname, email) values
('Jhon', 'rangel', 'rangeljhon55@gmail.com'),
('Pedro', 'ramirez', 'ramirez@gmail.com'),
('Maria', 'Guerra', 'maria@gmail.com');

-- creando tabla posts
create table posts (
 id serial primary key,
 creator_id integer references users(id),
 title varchar(50),
 text TEXT
);

--insertando los cinco posts

insert into posts (creator_id, title, text) values
(1, 'Post 1', 'Loem psum dolor sit'),
(2, 'Post 2', 'Loem psum dolor sit2'),
(3, 'Post 3', 'Loem psum dolor sit3'),
(1, 'Post 4', 'Loem psum dolor sit4'),
(2, 'Post 5', 'Loem psum dolor sit5');


select * from posts;

-- creando tabla likes

create table likes (
  id serial primary key,
  users_id integer references users(id),
  posts_id integer references posts(id)
);


--Añadir cinco likes

insert into likes (users_id, posts_id ) values
(2, 1),
(3, 1),
(1, 2),
(3, 3),
(1, 3);

select * from likes;


-- Traer todos los posts y la informacion del usuario del campo creator_id

SELECT  posts.id, users.firstname ||' '|| users.lastname AS creator, posts.title, posts.text 
FROM posts 
JOIN users ON posts.creator_id = users.id;


-- Traer todos los posts, con la informacion de los usuarios que le dieron like
SELECT posts.id, posts.title, posts.text, users.firstname ||' '|| users.lastname AS user_like
FROM posts
JOIN likes ON posts.id = likes.posts_id
JOIN users ON likes.users_id = users.id


