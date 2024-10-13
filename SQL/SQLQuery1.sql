CREATE TABLE Arleq_Camiones(
id_camion int not null identity(1,1),
marca varchar(50),
modelo varchar(50),
placas numeric default 'NA',
numero_serie varchar(50)
)

ALTER TABLE Arleq_Camiones
ALTER COLUMN placas varchar(50) 

insert into Arleq_Camiones
values ('Kenwort', 'T800', 'FXY9930', 'RS2303042817')
insert into Arleq_Camiones
values ('Kenwort', 'T800', null, 'RS2303042818')
insert into Arleq_Camiones (marca, modelo, numero_serie)
values ('Kenwort', 'T800', 'RS2303042819')
insert into Arleq_Camiones (marca, modelo, numero_serie)
values ('Kenwort', 'T800', 'RS2303042820')

select * from Arleq_Camiones

update Arleq_Camiones 
set  modelo = 'T810'
where id_camion = 2

update Arleq_Camiones
set marca = 'Kenworth'

select * from Arleq_Camiones
where marca = 'Kenworth' and modelo = 'T800'

Delete Arleq_Camiones
where modelo = 'T810'

select * from Arleq_Camiones
order by numero_serie asc
