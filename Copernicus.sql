drop database if exists copernicus;
create database copernicus;

use copernicus;

create table Docente(
id_docen int not null auto_increment primary key,
nom_docen varchar (40),
correo_docen varchar(40),
pass_docen varchar (40),
foto_docen varchar (80),
tipo varchar(30)
);

create table Clases(
id_clase int not null auto_increment primary key,
nom_clase varchar(40),
grado varchar(15),
id_docen int,
foreign key(id_docen) references Docente(id_docen)
);

create table Estudiante(  #Alumno e independiente
id_usuario int not null auto_increment primary key,
nom_usuario varchar (40),
correo_usuario varchar(40),
pass_usuario varchar (40),
foto_usuario varchar (80),
tipo_usuario varchar(30),
grado_usuario varchar (15)
);

create table Usuario_Clase(
id_usuario int,
id_clase int,
foreign key(id_usuario) references Usuario(id_usuario),
foreign key(id_clase) references Clases(id_clase)
);

create table Examen(
id_exam int not null auto_increment primary key,
cal_exam int
);

create table Ejercicios(
id_ejer int not null auto_increment primary key,
cal_ejer int
);

create table Puntuaciones (
id_usuario int,
id_exam int,
id_ejer int,
foreign key(id_usuario) references Usuario(id_usuario),
foreign key(id_exam) references Examen(id_exam),
foreign key(id_ejer) references Ejercicios(id_ejer)
);
 
create table Foro (
id_foro int not null auto_increment primary key,
id_clase int,
foreign key(id_clase) references Clases(id_clase));

create table Post(  #hacer el atributo para agregar la fecha del post
id_post int not null auto_increment primary key,
autor_post varchar(40),
msj varchar(3000),
id_usuario int,
id_docen int,
id_foro int,
foreign key(id_usuario) references Usuario(id_usuario),
foreign key(id_docen) references Docente(id_docen),
foreign key(id_foro) references Foro(id_foro)
);
 
create table Comentarios (
id_com int not null auto_increment primary key,
autor_com varchar(40),
comentario varchar(3000),
id_usuario int,
id_docen int,
id_post int,
foreign key(id_usuario) references Usuario(id_usuario),
foreign key(id_docen) references Docente(id_docen),
foreign key(id_post) references Post(id_post)
);

create table imgUsu(
id_imgUsu int not null auto_increment primary key,
id_usuario int,
imagen varchar(100),
foreign key(id_usuario) references Estudiante(id_usuario) 
);

select * from imgUsu;
select * from Estudiante;
select * from Docente;
select * from Clases;