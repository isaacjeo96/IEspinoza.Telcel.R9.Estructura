--Creacion de BD
CREATE DATABASE IEspinozaEstructura
GO
--Uso de BD
USE IEspinozaEstructura
GO
--Comienza Tabla Puesto
CREATE TABLE Puesto 
(
	IdPuesto INT IDENTITY(1,1) PRIMARY KEY,
	Descripcion VARCHAR(20)
)
GO

INSERT INTO Puesto (Descripcion) VALUES ('Gerente')
INSERT INTO Puesto (Descripcion) VALUES ('Jefe')
INSERT INTO Puesto (Descripcion) VALUES ('Supervisor')
INSERT INTO Puesto (Descripcion) VALUES ('Analista')
INSERT INTO Puesto (Descripcion) VALUES ('Secretaria')

GO

CREATE PROCEDURE PuestoGetAll
AS
	SELECT 
		   IdPuesto
		  ,Descripcion
    FROM Puesto
GO
--Termina tabla Puesto


--Comienza tabla Departamento
CREATE TABLE Departamento 
(
	IdDepartamento INT IDENTITY(1,1) PRIMARY KEY,
	Descripcion VARCHAR(20)
)
GO

INSERT INTO Departamento(Descripcion) VALUES ('Soporte Técnico')
INSERT INTO Departamento(Descripcion) VALUES ('Administración')
INSERT INTO Departamento(Descripcion) VALUES ('Compras')
INSERT INTO Departamento(Descripcion) VALUES ('Ventas')
INSERT INTO Departamento(Descripcion) VALUES ('Recursos Humanos')

GO

CREATE PROCEDURE DepartamentoGetAll
AS
	SELECT 
		   IdDepartamento
		  ,Descripcion
    FROM Departamento
GO
--Termina Tabla Departamento


--Comienza Tabla Empleado
CREATE TABLE Empleado 
(
	IdEmpleado INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(20),
	ApellidoPaterno VARCHAR(20),
	ApellidoMaterno VARCHAR(20),
	IdPuesto INT REFERENCES Puesto(IdPuesto),
	IdDepartamento INT REFERENCES Departamento(IdDepartamento)

)
GO

INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Alfredo','Pérez ','Torres',1,1)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Fernando ','Gonzalez ','Jiménez',1,2)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Luis','Martinez','Pérez',1,3)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('José','Robles','Torres',2,2)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Karla','Garcia','Higareda',2,3)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Lorena','Duran','Castro',2,4)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Jessica','Ramírez','Estrada',3,3)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Jimena','Zarate','Vélez',3,4)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Daniel','Garcia','Buendía',3,5)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Rubén','Núñez','López',4,1)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Jorge','Franco','Quiroz',4,3)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Gloria','Velazquez','Pérez',4,5)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Wendy','Salgado','Olguín',5,2)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Arturo','Frías','Robles',5,4)
INSERT INTO Empleado(Nombre,ApellidoPaterno,ApellidoMaterno,IdPuesto,IdDepartamento)VALUES('Francisco','Torres','Duran',5,1)

GO

CREATE PROCEDURE EmpleadoGetAll 
@Nombre VARCHAR(20),
@ApellidoPaterno VARCHAR(20),
@ApellidoMaterno VARCHAR(20)
AS
BEGIN
	IF (@Nombre = '' AND @ApellidoPaterno ='' AND @ApellidoMaterno='')
		BEGIN
			SELECT 
				   IdEmpleado
				  ,Nombre
				  ,ApellidoPaterno
				  ,ApellidoMaterno
				  ,Puesto.IdPuesto
				  ,Puesto.Descripcion AS Puesto
				  ,Departamento.IdDepartamento
				  ,Departamento.Descripcion AS Departamento
			  FROM Empleado
			  INNER JOIN Puesto ON Empleado.IdPuesto = Puesto.IdPuesto
			  INNER JOIN Departamento ON Empleado.IdDepartamento = Departamento.IdDepartamento
		  END
	  ELSE 
		BEGIN
		SELECT 
				   IdEmpleado
				  ,Nombre
				  ,ApellidoPaterno
				  ,ApellidoMaterno
				  ,Puesto.IdPuesto
				  ,Puesto.Descripcion AS NombrePuesto
				  ,Departamento.IdDepartamento
				  ,Departamento.Descripcion AS NombreDepartamento
			  FROM Empleado
			  INNER JOIN Puesto ON Empleado.IdPuesto = Puesto.IdPuesto
			  INNER JOIN Departamento ON Empleado.IdDepartamento = Departamento.IdDepartamento
			  WHERE Nombre LIKE '%' + @Nombre + '%' AND ApellidoPaterno LIKE '%' + @ApellidoPaterno + '%' AND ApellidoMaterno LIKE '%' + @ApellidoMaterno +'%'
			
		END
END
GO

CREATE PROCEDURE EmpleadoDelete
@IdEmpleado INT
AS
	DELETE FROM	Empleado 
		WHERE IdEmpleado = @IdEmpleado
GO

CREATE PROCEDURE EmpleadoAdd
@Nombre VARCHAR(20),
@ApellidoPaterno VARCHAR(20),
@ApellidoMaterno VARCHAR(20),
@IdPuesto INT,
@IdDepartamento INT
AS
	INSERT INTO Empleado
	(Nombre
	,ApellidoPaterno
	,ApellidoMaterno
	,IdPuesto
	,IdDepartamento)
	VALUES(@Nombre,
			@ApellidoPaterno,
			@ApellidoMaterno,
			@IdPuesto,
			@IdDepartamento)
GO
--- Termina tabla empleado


-- Comienza Vista 
CREATE VIEW Empleados
AS
	SELECT 
	   IdEmpleado
      ,Nombre
      ,ApellidoPaterno
      ,ApellidoMaterno
      ,Puesto.IdPuesto
	  ,Puesto.Descripcion AS Puesto
      ,Departamento.IdDepartamento
	  ,Departamento.Descripcion AS Departamento
  FROM Empleado
  INNER JOIN Puesto ON Empleado.IdPuesto = Puesto.IdPuesto
  INNER JOIN Departamento ON Empleado.IdDepartamento = Departamento.IdDepartamento
GO


SELECT  * FROM Empleados
--Termina vista Empleados 

CREATE TABLE Usuario
(
	UserName VARCHAR(50),
	Password VARCHAR(50)
)
GO
INSERT INTO Usuario([UserName],[Password]) VALUES ('espoc0596','12345')
INSERT INTO Usuario([UserName],[Password]) VALUES ('priscy1489','12345')
INSERT INTO Usuario([UserName],[Password]) VALUES ('mary2691','12345')
GO
CREATE PROCEDURE GetByUserName 'espoc0596'
@UserName VARCHAR(50)
AS
	SELECT
		UserName,
		Password
		FROM Usuario
			WHERE UserName = @UserName

GO