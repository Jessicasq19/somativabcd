create database formativahogwarts;
use formativahogwarts;

create table tarefa(
	id bigint not null auto_increment,
    nome varchar(100) not null,
    descricao varchar(400) not null,
    prazoExecDias int not null,
    dataAbert datetime not null default now(),
    dataFim datetime,
    localFK bigint not null,
    usuarioFK bigint not null,
    foreign key(localFK) references locais(id),
    foreign key(usuarioFK) references usuarios(id),
    primary key(id)
);

create table responsaveis(
	id bigint not null auto_increment,
    tarefaFK bigint not null,
    responsavelFK bigint not null,
    foreign key(tarefaFK) references tarefa(id),
    foreign key(responsavelFK) references usuarios(id),
    primary key(id)
);

create table status(
	id bigint not null auto_increment,
    status varchar(20) not null,
    primary key(id)
);
alter table status modify status varchar (50) not null;

create table historicoTarefas(
	id bigint not null auto_increment,
    tarefaFK bigint not null,
	statusFK bigint not null,
    inicio datetime not null default now(),
    foreign key(tarefaFK) references tarefa(id),
    foreign key(statusFK) references status(id),
    primary key(id)
);

create table comentario(
	id bigint not null auto_increment,
    comentario varchar(200) not null,
    tarefaFK bigint not null,
    statusFK bigint not null,
    horaEnvio datetime not null default now(),
    foreign key(tarefaFK) references tarefa(id),
    foreign key(statusFK) references status(id),
    primary key(id)
);

alter table usuarios add column linkImagem varchar(200);

alter table usuarios add column celular varchar(14);

alter table tarefa modify dataFim datetime;

insert into tarefa (nome, descricao, prazoExecDias, localFK, usuarioFK) values ("Conserto computador", "Computador não está ligando",
3, 2, 4), ("Verificar ar condicionado", "Os alunos estão reclamando que o ar condicionado não refrigera a sala", 5, 1, 4), ("Tablet riscado",
 "A tela do tablet está riscada e interfere no uso", 2, 1, 1);
 insert into tarefa (nome, descricao, prazoExecDias, localFK, usuarioFK) values ("Conserto ventilador", "Ventilador não gira",
3, 2, 2), ("Teclado do PC", "Teclas Enter e Space do teclado do pc 1 não funcionam", 2, 3, 4);
insert into tarefa (nome, descricao, prazoExecDias, localFK, usuarioFK) values ("Conserto computador", "Computador não tem internet",
1, 2, 1);
 
 insert into responsaveis (tarefaFk, responsavelFK) values (1, 3), (1, 4), (2, 1), (2, 2), (2, 4), (3, 4);
 
 insert into status (status) values ("Não iniciada"), ("Em andamento"), ("Concluída"), ("Erro");
 
 insert into historicoTarefas (tarefaFK, statusFK, inicio) values (1, 2, "2023-06-03"), (2, 3, "2023-03-01"), (3, 4, "2023-05-29");
 
 insert into historicoTarefas (tarefaFK, statusFK, inicio) values (1, 1, "2023-06-03");
 
 insert into comentario (comentario, tarefaFK, statusFK) values ("Tarefa será realizada assim que possível", 1, 1), 
 ("Tarefa está sendo realizada", 2, 2), ("Tarefa finalizada", 2, 3), ("Ocorreu um problema", 3, 4);
 
 insert into eventos (nome, inicio,fim, inicioCheckin, fimCheckin, vagas, localFk)
values
('Workshop Cloud Básico', '2023-05-26 18:45:00', '2023-05-26 23:45:00', '2023-05-26 18:45:00', '2023-05-26 23:45:00', 30, 2), 
('Workshop Desenho SolidWorks', '2023-06-26 18:45:00', '2023-06-26 23:45:00', '2023-06-01 18:45:00', '2023-06-01 23:45:00', 16, 3),
('Blockchain Básico', '2023-08-12 18:45:00', '2023-08-15 23:45:00', '2023-05-26 18:45:00', '2023-05-26 23:45:00', 0, 1),
('Decolando sua carreira', '2023-12-12 18:45:00', '2023-12-12 23:45:00', '2023-08-26 18:45:00', '2023-08-26 23:45:00', 59, 4),
('Desmistificando Spring Framework', '2024-01-26 18:45:00', '2024-01-30 23:45:00', '2024-01-01 18:45:00', '2024-01-01 23:45:00', 16, 1),
('Criptomoedas e Web3', '2023-05-30 18:45:00', '2023-05-30 23:45:00', '2023-05-30 18:45:00', '2023-05-30 23:45:00', 10, 1);
 
###01###Crie uma consulta que mostre todas as tarefas ainda não iniciadas com as informações de seus 
#respectivos envolvidos no processo;

select s.status, t.nome, u.nome
from historicotarefas h
join tarefa t
on h.tarefaFK = t.id
join status s
on h.statusFK = s.id
join usuarios u
on t.usuarioFK = u.id 
where s.status = "Não iniciada"
order by s.status;

###02###Crie uma consulta que mostre todos os locais que tiveram associação a mais de duas tarefas;

select t.localFK, l.nome, count(*) totalTarefas from tarefa t
join locais l on l.id = t.localFK
group by t.localFK
having totalTarefas > 2;

###03###Crie uma consulta que mostre todos os usuários que tiveram associação a duas tarefas no mínimo;

select t.usuarioFK, u.nome, count(*) totalTarefas from tarefa t
join usuarios u on u.id = t.usuarioFK
group by t.usuarioFK
having totalTarefas >= 2;

###04###Crie uma consulta que mostre todos eventos que ainda acontecerão e as tarefas que ainda não
#foram executadas nos locais destes eventos (essa consulta ajudará a gestão visualizar se há algum 
#problema que pode impactar os eventos);

select s.status, t.nome, e.nome, l.nome
from tarefa t
join locais l
on t.localFK = l.id
join eventos e
on e.localFK = l.id
join historicotarefas h
on t.id = h.tarefaFK
join status s
on h.statusFK = s.id
where s.status != "Concluída" and e.inicio > now();

###05###Crie uma consulta que mostre os locais e a quantidade de tarefas existentes (independente do status);

select l.nome, count(*) totalTarefas from tarefa t
join locais l
on t.localFK = l.id
group by t.localFK;

###06###Crie uma consulta que mostre os locais e a quantidade de tarefas concluídas;

select l.nome, count(*) totalTarefasConcluidas from tarefa t
join locais l
on t.localFK = l.id
join historicotarefas h
on t.id = h.tarefaFK
join status s
on h.statusFK = s.id
where s.status = "Concluída"
group by t.localFK;

###07###Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas (independente do status)

select u.nome, count(*) totalTarefas from tarefa t
join usuarios u
on t.usuarioFK = u.id
group by t.usuarioFK;

###08###Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas concluídas;

select u.nome, count(*) totalTarefasConcluidas from tarefa t
join usuarios u
on t.usuarioFK = u.id
join historicotarefas h
on t.id = h.tarefaFK
join status s
on h.statusFK = s.id
where s.status = "Concluída"
group by t.usuarioFK;

###09###Crie uma consulta que mostre a média por mês de quantas tarefas são criadas por local;

#Não consegui realizar a consulta
