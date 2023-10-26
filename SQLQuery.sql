Create Table Unidade_Academica (
Cod_UA INT NOT NULL,
nome char(60) NOT NULL,
endereco varchar(55) NOT NULL,

constraint PK_Unidade_Academica
primary key (Cod_UA),
constraint nome_unico
unique (nome)
);

Create Table Telefones_UA (
Num_fone varchar(20) NOT NULL,
Cod_UA INT NOT NULL,
tipo_fone char NOT NULL,

constraint PK_Telefones_UA
primary key (Num_fone),
constraint FK_Telefones_UA_COD_UA
foreign key (Cod_UA) references Unidade_Academica
);

Create Table Departamento (
Cod_dep INT NOT NULL,
nome_dep char(60) NOT NULL,
Cod_UA INT NOT NULL,

constraint PK_Departamento
primary key (Cod_dep),
constraint FK_Departamento_Cod_UA
foreign key (Cod_UA) references Unidade_Academica
);

Create Table Telefones_dep (
Num_fone varchar(20) NOT NULL,
Cod_dep INT NOT NULL,
tipo_fone char NOT NULL,

constraint PK_Telefones_dep
primary key (Num_fone),
constraint FK_Telefones_dep_Cod_dep
foreign key (Cod_dep) references Unidade_Academica
);

Create Table Curso (
Cod_curso INT NOT NULL,
nome_curso char(60) NOT NULL,

constraint PK_Curso
primary key (Cod_curso)
);

Create Table Dep_Curso (
Cod_dep INT NOT NULL,
Cod_curso INT NOT NULL,

constraint FK_Dep_Curso_Cod_dep
foreign key (Cod_dep) references Departamento
ON DELETE NO ACTION ON UPDATE NO ACTION,
constraint FK_Dep_Curso_Cod_curso
foreign key (Cod_curso) references Curso
ON DELETE NO ACTION ON UPDATE NO ACTION
);

Create Table Professor (
Matr_prof INT NOT NULL,
nome_professor char(60) NOT NULL,
lotacao INT NOT NULL, 
diretor_cod_UA INT NULL,
chefe_cod_dep INT NULL,
coordenador_cod_curso INT NULL,
constraint PK_Professor
primary key (Matr_prof),
constraint FK_lotacao
foreign key (lotacao) references Departamento
ON DELETE NO ACTION ON UPDATE NO ACTION,
constraint FK_Professor_chefe_cod_dep
foreign key (chefe_cod_dep) references Departamento
ON DELETE NO ACTION ON UPDATE NO ACTION,
constraint FK_Professor_diretor_cod_UA
foreign key (diretor_cod_UA) references Unidade_academica
ON DELETE NO ACTION ON UPDATE NO ACTION,
constraint FK_Professor_coordenador_cod_curso
foreign key (coordenador_cod_curso) references Curso
ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Disciplina (
cod_disc INT NOT NULL,
nome_disc char(60) NOT NULL,
qnt_creditos INT NOT NULL,

constraint PK_Disciplina
primary key (cod_disc)
);

Create Table Dep_Disc (
cod_disc INT NOT NULL,
Cod_curso INT NOT NULL,

constraint FK_Dep_Disc_cod_disc
foreign key (cod_disc) references Disciplina
ON DELETE NO ACTION ON UPDATE NO ACTION,
constraint FK_Dep_Disc_Cod_curso
foreign key (Cod_curso) references Curso
ON DELETE NO ACTION ON UPDATE NO ACTION
);


Create Table Prof_Disc (
Matr_prof INT NOT NULL,
cod_disc INT NOT NULL,
semestre varchar(10) NOT NULL,

constraint FK_Prof_Disc_Matr_prof
foreign key (Matr_prof) references Professor
ON DELETE NO ACTION ON UPDATE NO ACTION,
constraint FK_Prof_Disc_cod_disc
foreign key (cod_disc) references Disciplina
ON DELETE NO ACTION ON UPDATE NO ACTION
);



Create Table Cur_Disc (
Cod_curso INT NOT NULL,
cod_disc INT NOT NULL,

constraint FK_Cur_Disc_Cod_curso
foreign key (Cod_curso) references Curso
ON DELETE NO ACTION ON UPDATE NO ACTION,
constraint FK_Cur_Disc_cod_disc
foreign key (cod_disc) references Disciplina
ON DELETE NO ACTION ON UPDATE NO ACTION
);


Create Table Pre_requisito (
cod_disc INT NOT NULL,
cod_pre_requisito INT NULL,

constraint FK_Pre_requisito_cod_disc
foreign key (cod_disc) references Disciplina
ON DELETE NO ACTION ON UPDATE NO ACTION,
constraint FK_Pre_requisito_cod_pre_requisito
foreign key (cod_pre_requisito) references Disciplina
ON DELETE NO ACTION ON UPDATE NO ACTION
);

Create Table Aluno (
matr_aluno INT NOT NULL,
nome_aluno char(60) NOT NULL,
Cod_curso INT NOT NULL,

constraint PK_Aluno
primary key (matr_aluno),
constraint nome_aluno_unico
unique (nome_aluno),
constraint FK_Aluno_Cod_curso
foreign key (Cod_curso) references Curso
ON DELETE NO ACTION ON UPDATE NO ACTION
);

Create Table Aluno_Disc (
semestre varchar(20) NOT NULL,
cod_disc INT NOT NULL,
matr_aluno INT NOT NULL,
primeiraAP float NULL,
segundaAP float NULL,
AF float NULL,


constraint FK_Aluno_Disc_cod_disc
foreign key (cod_disc) references Disciplina
ON DELETE NO ACTION ON UPDATE NO ACTION,
constraint FK_Aluno_Disc_matr_aluno
foreign key (matr_aluno) references Aluno
ON DELETE NO ACTION ON UPDATE NO ACTION
);




insert into Unidade_Academica (Cod_UA, nome, endereco) values (1, 'Campus da UFC em Sobral', '467 Pine View Alley');
insert into Unidade_Academica (Cod_UA, nome, endereco) values (2, 'Centro de Ciências', '04 Pawling Place');
insert into Unidade_Academica (Cod_UA, nome, endereco) values (3, 'Centro de Humanidades', '21 Stang Junction');


insert into Departamento (Cod_dep, Cod_UA, nome_dep) values (1, 1, 'Departamento de Medicina');
insert into Departamento (Cod_dep, Cod_UA, nome_dep) values (2, 1, 'Departamento de Veterinaria');
insert into Departamento (Cod_dep, Cod_UA, nome_dep) values (3, 2, 'Departamento de Arquitetura');
insert into Departamento (Cod_dep, Cod_UA, nome_dep) values (4, 2, 'Departamento de Engenharia de Produção');
insert into Departamento (Cod_dep, Cod_UA, nome_dep) values (5, 2, 'Departamento de Engenharia de Teleinformática');
insert into Departamento (Cod_dep, Cod_UA, nome_dep) values (6, 2, 'Departamento de Ciência');
insert into Departamento (Cod_dep, Cod_UA, nome_dep) values (7, 3, 'Departamento de Direito');
insert into Departamento (Cod_dep, Cod_UA, nome_dep) values (8, 3, 'Departamento de Linguas');
insert into Departamento (Cod_dep, Cod_UA, nome_dep) values (9, 3, 'Departamento de Letras');


insert into Curso (Cod_curso, nome_curso) values (1, 'cursodesobral1');
insert into Curso (Cod_curso, nome_curso) values (2, 'cursodesobral2');
insert into Curso (Cod_curso, nome_curso) values (3, 'cursodesobral3');
insert into Curso (Cod_curso, nome_curso) values (4, 'cursodesobral4');
insert into Curso (Cod_curso, nome_curso) values (5, 'cursodesobral5');
insert into Curso (Cod_curso, nome_curso) values (6, 'cursodesobral6');
insert into Curso (Cod_curso, nome_curso) values (7, 'tecno1');
insert into Curso (Cod_curso, nome_curso) values (8, 'tecno2');
insert into Curso (Cod_curso, nome_curso) values (9, 'tecno3');
insert into Curso (Cod_curso, nome_curso) values (10, 'tecno4');
insert into Curso (Cod_curso, nome_curso) values (11, 'Engenharia da Computação');
insert into Curso (Cod_curso, nome_curso) values (12, 'Ciência da computação');
insert into Curso (Cod_curso, nome_curso) values (13, 'hum1');
insert into Curso (Cod_curso, nome_curso) values (14, 'hum2');
insert into Curso (Cod_curso, nome_curso) values (15, 'hum3');
insert into Curso (Cod_curso, nome_curso) values (16, 'hum4');
insert into Curso (Cod_curso, nome_curso) values (17, 'hum5');
insert into Curso (Cod_curso, nome_curso) values (18, 'hum6');


insert into Dep_Curso (Cod_dep, Cod_curso) values (1,1);
insert into Dep_Curso (Cod_dep, Cod_curso) values (1,2);
insert into Dep_Curso (Cod_dep, Cod_curso) values (1,3);
insert into Dep_Curso (Cod_dep, Cod_curso) values (1,4);
insert into Dep_Curso (Cod_dep, Cod_curso) values (2,5);
insert into Dep_Curso (Cod_dep, Cod_curso) values (2,6);
insert into Dep_Curso (Cod_dep, Cod_curso) values (3,7);
insert into Dep_Curso (Cod_dep, Cod_curso) values (3,7);
insert into Dep_Curso (Cod_dep, Cod_curso) values (4,8);
insert into Dep_Curso (Cod_dep, Cod_curso) values (4,9);
insert into Dep_Curso (Cod_dep, Cod_curso) values (5,10);
insert into Dep_Curso (Cod_dep, Cod_curso) values (5,11);
insert into Dep_Curso (Cod_dep, Cod_curso) values (6,11);
insert into Dep_Curso (Cod_dep, Cod_curso) values (6,12);
insert into Dep_Curso (Cod_dep, Cod_curso) values (7,13);
insert into Dep_Curso (Cod_dep, Cod_curso) values (7,14);
insert into Dep_Curso (Cod_dep, Cod_curso) values (8,15);
insert into Dep_Curso (Cod_dep, Cod_curso) values (8,16);
insert into Dep_Curso (Cod_dep, Cod_curso) values (9,17);
insert into Dep_Curso (Cod_dep, Cod_curso) values (9,18);

insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (388999, 'Evita Sandbach', 9);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (362425, 'Ruthe Haresnape', 7);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (872307, 'Emmet Iggalden', 14);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (552692, 'Manuel Blenkiron', 15);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (584829, 'Smith Joss', 8);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (547055, 'Bell Soloway', 5);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (185603, 'Weber Mugleston', 14);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (948724, 'Boigie Burrage', 3);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (841602, 'Wald Lorence', 18);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (699075, 'Russell Beyn', 7);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (957780, 'Wakefield Noor', 4);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (178390, 'Tedd Bidewell', 13);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (296222, 'Sarajane Rubinshtein', 9);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (306166, 'Joellyn Linguard', 16);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (784756, 'Ermentrude Justis', 10);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (939019, 'Ladonna Begbie', 3);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (951391, 'Ade Taggett', 6);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (539316, 'Sadye McHugh', 1);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (136190, 'Dorolisa Stanett', 12);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (352979, 'Mathian Bedham', 4);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (586364, 'Gabby Wimpeney', 11);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (377004, 'Westleigh LAbbet', 15);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (932907, 'Hashim Brisseau', 15);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (785434, 'Clint Wiggington', 13);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (462533, 'Timmie Partner', 1);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (424876, 'Josh Snelson', 4);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (467960, 'Helli Kippling', 13);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (119348, 'Morganica Gyver', 16);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (750405, 'Lane Conroy', 15);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (476855, 'Edith Golsworthy', 10);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (666371, 'Lily Ziehms', 6);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (529952, 'Leoine Aaronson', 18);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (381097, 'Hugo Fetters', 4);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (841817, 'Mikol Kendred', 5);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (476713, 'Eryn Selwyne', 11);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (500516, 'Ina Seydlitz', 15);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (353996, 'Tish Rasor', 11);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (379905, 'Ramsay Gerrels', 17);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (497333, 'Elenore Espinos', 8);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (658002, 'Ravi Kilmurry', 14);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (853680, 'Lorena Sturdey', 14);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (445865, 'Noelle Sarath', 9);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (971612, 'Cristie Crolly', 11);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (112262, 'Karon Muat', 9);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (735603, 'Stanly Wynn', 8);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (438560, 'Ninnetta Wadge', 13);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (526104, 'Leta Pember', 18);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (122610, 'Babbie Coulman', 5);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (412045, 'Liane Minguet', 12);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (827349, 'Rosene Paireman', 13);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (792487, 'Helsa Fishbourn', 13);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (123048, 'Roosevelt Caccavale', 11);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (274546, 'Weston Andrew', 18);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (352297, 'Adolpho McComish', 1);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (242400, 'Sidney Cawood', 2);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (673070, 'Nevins Gordon', 3);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (530405, 'Howard Lighten', 2);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (720711, 'Ronica McAlinden', 2);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (688420, 'Cynthy Menci', 17);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (180313, 'Raff Gontier', 6);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (429355, 'Fergus McGourty', 16);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (402132, 'Alyss Kleinhaus', 11);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (577762, 'Zelig Kohring', 6);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (190055, 'Ab Jedrych', 5);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (484370, 'Calli Quillinane', 11);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (945686, 'Niles Strangman', 1);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (433504, 'Cletus Carous', 2);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (182399, 'Nissa Addis', 9);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (817307, 'Rhianon Menis', 2);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (639514, 'Minda McCadden', 1);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (553075, 'Maurits Gerrietz', 5);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (444467, 'Millicent Maletratt', 3);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (142674, 'Terrance Torregiani', 16);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (816763, 'Lukas Steagall', 4);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (184088, 'Daffie Loveman', 11);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (883384, 'Stavros Keijser', 5);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (274923, 'Ginevra Skudder', 13);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (848241, 'Naoma Trott', 13);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (668614, 'Morissa Swainsbury', 18);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (870757, 'Nevile Vondruska', 15);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (446036, 'Rebecca Mion', 18);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (937708, 'Esta Petriello', 13);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (940100, 'Jocelyn Joslyn', 8);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (460475, 'Wolfgang George', 17);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (697190, 'Sabra Wimsett', 3);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (436933, 'Harry Coie', 16);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (951824, 'Halley Summergill', 6);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (672154, 'Nessie Philippeaux', 14);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (354742, 'Alisander Melwall', 5);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (854403, 'Melisse Lequeux', 3);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (347208, 'Lukas Robertis', 2);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (272271, 'Blaire Drewry', 14);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (574844, 'Udale O''Docherty', 7);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (725833, 'Aldis Rhymer', 16);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (203868, 'Felicity Dayly', 12);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (655133, 'Christian Layland', 15);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (822693, 'Cad Jarrelt', 18);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (161865, 'Chery Gasperi', 10);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (837442, 'Anabella Walling', 1);
insert into Aluno (matr_aluno, nome_aluno, Cod_curso) values (829122, 'Ariadne Cavilla', 4);

--2.a:

SELECT nome, COUNT(DISTINCT Departamento.Cod_dep) AS qnt_dep, 
COUNT(DISTINCT Curso.Cod_curso) AS qnt_curso, COUNT(DISTINCT Aluno.matr_aluno) as qnt_Alunos
FROM Unidade_Academica
INNER JOIN Departamento
ON Unidade_Academica.Cod_UA = Departamento.Cod_UA
INNER JOIN Dep_Curso
ON Departamento.Cod_dep = Dep_Curso.Cod_dep
INNER JOIN Curso
ON Curso.Cod_curso = Dep_Curso.Cod_curso
INNER JOIN Aluno
ON Aluno.Cod_curso = Curso.Cod_curso
GROUP BY nome
ORDER BY qnt_Alunos DESC


insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (1, 'banco de dados', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (2, 'algoritimos', 4);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (3, 'matematica fundamental', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (4, 'matematica analitica', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (5, 'algebra linear', 4);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (6, 'estatistica', 4);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (7, 'desvolvimento web', 4);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (8, 'teoria dos numeros', 4);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (9, 'construção de algoritimos', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (10, 'estrutura de dados', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (11, 'desenvolvimento de software', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (12, 'programação basica', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (13, 'compgenerico1', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (14, 'compgenerico2', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (15, 'compgenerico3', 6);
insert into Disciplina (cod_disc, nome_disc, qnt_creditos) values (16, 'compgenerico4', 6);

insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2019.2, 1, 136190, 4.4, 5.41, 0.85);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2016.1, 2, 136190, 0.68, 6.63, 3.75);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2016.1, 3, 136190, 5.16, 9.14);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2018.1, 4, 136190, 8.36, 8.09);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2017.1, 5, 136190, 0.91, 3.18, 8.92);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2020.1, 6, 136190, 10, 7.72);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2019.2, 7, 136190, 7.8, 0.83, 1.22);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2020.1, 8, 136190, 9.79, 7.25);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2017.2, 9, 136190, 6.17, 4.14, 3.3);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2020.2, 10, 136190, 7.43, 9.82);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2017.2, 11, 136190, 8.35, 8.32);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2018.2, 12, 136190, 9.71, 4.85);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2018.2, 13, 136190, 7.95, 1.6, 8.06);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2020.1, 14, 136190, 7.28, 2.65, 9.26);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2020.1, 15, 136190, 2.61, 3.44, 6.91);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2017.2, 16, 136190, 2.86, 4.04, 3.51);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2016.2, 1, 203868, 5.93, 0.47, 7.39);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2016.1, 2, 203868, 6.21, 2.62, 0.2);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2017.2, 3, 203868, 4.04, 5.98, 6.44);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2018.1, 4, 203868, 2.83, 7.38, 4.15);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2017.1, 5, 203868, 1.69, 8.19, 4.93);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2020.1, 6, 203868, 1.39, 9.69, 5.72);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2019.1, 7, 203868, 7.03, 9.79);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2018.1, 8, 203868, 0.52, 2.24, 4.82);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2018.1, 9, 203868, 8.08, 4.06, 8.33);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2019.2, 10, 203868, 0.22, 4.21, 0.3);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2019.2, 11, 203868, 2.78, 4.51, 9.48);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2019.1, 12, 203868, 2.05, 7.97, 7.69);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2016.1, 13, 203868, 9.97, 9.01);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2017.1, 14, 203868, 3.15, 7.7, 6.66);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2017.1, 15, 203868, 6.96, 8.75);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2019.1, 16, 203868, 8.8, 9.34);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2020.2, 1, 412045, 6.08, 2.2, 0.07);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2016.2, 2, 412045, 4.39, 9.19, 10);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2017.1, 3, 412045, 1.36, 4.01, 9.21);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2020.1, 4, 412045, 8.39, 6.61);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2020.1, 5, 412045, 7.99, 5.61, 1.41);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2018.1, 6, 412045, 3.88, 6.75, 4.68);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2017.2, 7, 412045, 5.74, 9.13);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP) values (2019.1, 8, 412045, 9.99, 7.25);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2018.1, 9, 412045, 1.53, 0.85, 1.32);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2018.1, 10, 412045, 1.19, 9.91, 2.37);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2019.1, 11, 412045, 0.33, 6.77, 2.74);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2017.2, 12, 412045, 5.32, 2.02, 3.59);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2020.2, 13, 412045, 3.98, 4.66, 3.22);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2018.2, 14, 412045, 1.73, 1.13, 5.89);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2020.1, 15, 412045, 6.94, 6.69, 9.8);
insert into Aluno_Disc (semestre, cod_disc, matr_aluno, primeiraAP, segundaAP, AF) values (2017.1, 16, 412045, 9.16, 1.21, 6.3);

--2.b:

SELECT nome_aluno, nome_disc, qnt_creditos, semestre, primeiraAP, segundaAP,
CASE WHEN Aluno_Disc.AF IS NULL THEN '--'
ELSE CAST(Aluno_Disc.AF AS varchar(10)) END AS AF 
FROM Curso
LEFT OUTER JOIN Aluno
ON Curso.Cod_curso = Aluno.Cod_curso
INNER JOIN Aluno_Disc
ON Aluno_Disc.matr_aluno = Aluno.matr_aluno
LEFT OUTER JOIN Disciplina
ON Disciplina.cod_disc = Aluno_Disc.cod_disc
WHERE Curso.nome_curso = 'Ciência da computação'




insert into Professor (Matr_prof, nome_professor, lotacao, diretor_cod_UA) values (652520, 'Rona Turpie', 1, 1);
insert into Professor (Matr_prof, nome_professor, lotacao, chefe_cod_dep) values (535833, 'Katey McAughtrie', 1, 1);
insert into Professor (Matr_prof, nome_professor, lotacao, chefe_cod_dep) values (762101, 'Kathie Dooler', 1, 2);
insert into Professor (Matr_prof, nome_professor, lotacao) values (159971, 'Bard Tweddle', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (359363, 'Maximilian Kase', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (365501, 'Auberon Pauley', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (119092, 'Ingaberg Upston', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (881875, 'Katya Goodsall', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (751076, 'Sibel Wolfe', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (919411, 'Cesaro Lidden', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (754507, 'Ada McArt', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (677036, 'Moreen Athey', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (656013, 'Carmelina Trehearn', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (497917, 'Sephira Moles', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (877769, 'Maybelle Masseo', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (414748, 'Joyous Walkey', 1);
insert into Professor (Matr_prof, nome_professor, lotacao) values (173462, 'Hildagarde Ovenden', 1);
insert into Professor (Matr_prof, nome_professor, lotacao, diretor_cod_UA) values (602547, 'Osbert Sebborn', 6, 2);
insert into Professor (Matr_prof, nome_professor, lotacao, chefe_cod_dep) values (204544, 'Ali Dencs', 6, 5);
insert into Professor (Matr_prof, nome_professor, lotacao, chefe_cod_dep) values (462856, 'Cassandry Kochs', 6, 6);
insert into Professor (Matr_prof, nome_professor, lotacao, coordenador_cod_curso) values (402426, 'Marya Bussens', 6, 12);
insert into Professor (Matr_prof, nome_professor, lotacao) values (987602, 'Sal Dark', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (959552, 'Arlinda Swiffan', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (182514, 'Vincents Pyburn', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (490036, 'Demetri Purvess', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (573387, 'Glenden Martini', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (828211, 'Marthe Rennicks', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (584073, 'Kalil Moorcraft', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (472780, 'Nickolai Tatnell', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (705995, 'Dunc Sille', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (304557, 'Ellis Jedraszek', 6);
insert into Professor (Matr_prof, nome_professor, lotacao) values (700140, 'Cordula Dailey', 3);
insert into Professor (Matr_prof, nome_professor, lotacao) values (415701, 'Alyss Roberti', 3);
insert into Professor (Matr_prof, nome_professor, lotacao) values (565148, 'Orlan Rudgard', 3);
insert into Professor (Matr_prof, nome_professor, lotacao) values (241066, 'Patsy Colum', 3);
insert into Professor (Matr_prof, nome_professor, lotacao) values (739588, 'Heriberto Gann', 3);
insert into Professor (Matr_prof, nome_professor, lotacao) values (543129, 'Marge Blesing', 3);
insert into Professor (Matr_prof, nome_professor, lotacao) values (914162, 'Hammad Scanderet', 3);
insert into Professor (Matr_prof, nome_professor, lotacao) values (191901, 'Virginia Shawel', 3);
insert into Professor (Matr_prof, nome_professor, lotacao) values (102122, 'Jeannie Downing', 3);

insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (987602, 1, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (705995, 1, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (182514, 2, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (182514, 12, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (987602, 9, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (304557, 9, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (472780, 13, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (959552, 15, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (705995, 7, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (584073, 16, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (304557, 1, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (304557, 6, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (182514, 10, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (705995, 6, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (987602, 15, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (959552, 4, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (304557, 8, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (490036, 10, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (182514, 1, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (959552, 14, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (959552, 13, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (987602, 12, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (472780, 11, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (573387, 5, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (987602, 13, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (182514, 12, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (959552, 5, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (705995, 6, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (472780, 5, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (959552, 5, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (987602, 12, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (959552, 11, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (987602, 11, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (182514, 2, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (182514, 7, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (304557, 5, 2018.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (987602, 5, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (959552, 1, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (304557, 5, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (472780, 1, 2018.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (182514, 7, 2019.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (304557, 5, 2019.2);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (987602, 5, 2019.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (959552, 1, 2019.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (304557, 5, 2019.1);
insert into Prof_Disc (Matr_prof, cod_disc, semestre) values (472780, 1, 2019.1);


--2.c:

SELECT Professor.nome_professor
FROM Unidade_Academica
INNER JOIN Departamento
ON Departamento.Cod_UA = Unidade_Academica.Cod_UA
INNER JOIN Professor
ON Professor.lotacao = Departamento.Cod_dep
INNER JOIN Prof_Disc
ON Prof_Disc.Matr_prof = Professor.Matr_prof
INNER JOIN Disciplina
ON Disciplina.cod_disc = Prof_Disc.cod_disc
WHERE nome = 'Centro de ciências' 
AND Prof_Disc.Semestre IN (2018.1, 2018.2)
GROUP BY nome_professor, semestre
HAVING SUM(Disciplina.qnt_creditos) < 8


--2.d:

SELECT nome_aluno, 
CAST(AVG(media_semestre) as decimal(10, 2)) as media_global
FROM (
	SELECT nome_aluno, 
	CASE WHEN primeiraAP+segundaAP >= 14 THEN (primeiraAP+segundaAP)/2 
	ELSE (primeiraAP+segundaAP+AF)/3 END AS media_semestre
	FROM Unidade_Academica
	INNER JOIN Departamento
	ON Departamento.Cod_UA = Unidade_Academica.Cod_UA
	INNER JOIN Dep_Curso
	ON Dep_Curso.Cod_dep = Departamento.Cod_dep
	INNER JOIN Curso
	ON Curso.Cod_curso = Dep_Curso.Cod_curso
	INNER JOIN Aluno
	ON Aluno.Cod_curso = Curso.Cod_curso
	INNER JOIN Aluno_Disc
	ON Aluno_Disc.matr_aluno = Aluno.matr_aluno
	WHERE Unidade_Academica.nome = 'Centro de Ciências'
) AS tabela_media_semestre
GROUP BY nome_aluno
ORDER BY media_global DESC

--1.a:

SELECT nome_aluno
FROM (
SELECT matr_aluno
FROM Aluno
INTERSECT
SELECT matr_aluno
FROM Aluno_Disc
WHERE semestre= '2018.2'
) AS Aluno_Disc
INNER JOIN Aluno
ON Aluno.matr_aluno = Aluno_Disc.matr_aluno

--1.b:

SELECT nome 
FROM Unidade_Academica ua 
INNER JOIN Departamento d ON d.Cod_UA != ua.Cod_UA 
INNER JOIN Dep_Curso c ON c.Cod_curso != d.Cod_dep 
and d.Cod_UA = ua.Cod_UA 








