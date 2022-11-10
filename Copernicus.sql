drop database if exists copernicus;
create database copernicus;

use copernicus;

create table Clases(
id_clase int not null auto_increment primary key,
nom_clase varchar(40),
grado varchar(15)
);

create table Usuario(
id_usuario int not null auto_increment primary key,
nombre varchar (40),
correo varchar(40),
pass varchar (15),
foto_usu varchar (80),
tipo_usu varchar(30),
grado varchar(18),
id_clase int, foreign key(id_clase) references Clases(id_clase)
);

create table Examen(
id_exam int not null auto_increment primary key,
cal_exam int);

create table Ejercicios(
id_ejer int not null auto_increment primary key,
cal_ejer int);

create table Puntuaciones (
id_exam int,
id_ejer int,
id_usuario int,
foreign key(id_usuario) references Usuario(id_usuario),
foreign key(id_exam) references Examen(id_exam),
foreign key(id_ejer) references Ejercicios(id_ejer));
 
create table Post (
id_post int not null auto_increment primary key,
autor varchar(40),
mesaje varchar(3000),
id_usuario int,
foreign key(id_usuario) references Usuario(id_usuario) );

create table Comentarios (
id_com int not null auto_increment primary key,
autor_com varchar(40),
comentario varchar(3000),
id_usuario int,
foreign key(id_usuario) references Usuario(id_usuario) 
);

create table imgUsu(
id_imgUsu int not null auto_increment primary key,
id_usuario int,
imagen varchar(100),
foreign key(id_usuario) references Usuario(id_usuario) 
);

select * from imgUsu;
select * from Usuario;
select * from Clases;