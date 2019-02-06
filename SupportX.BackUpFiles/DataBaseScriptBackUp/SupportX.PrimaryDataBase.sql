use master;
Go
create database SupportX_PrimaryDatabase;
go
use SupportX_PrimaryDatabase;
go
/*
   miércoles, 6 de febrero de 201909:45:39 AM
   User: 
   Server: DESKTOP-GSN3PJ0
   Database: SupportX_PrimaryDatabase
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Costumer
	(
	idCostumer int NOT NULL,
	name varchar(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Costumer ADD CONSTRAINT
	PK_Costumer PRIMARY KEY CLUSTERED 
	(
	idCostumer
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Costumer SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Costumer', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Costumer', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Costumer', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Category
	(
	idCategory int NOT NULL,
	name varchar(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Category ADD CONSTRAINT
	PK_Category PRIMARY KEY CLUSTERED 
	(
	idCategory
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Category SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Category', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Category', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Category', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Role
	(
	IdRole int NOT NULL,
	roleName varchar(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Role ADD CONSTRAINT
	PK_Role PRIMARY KEY CLUSTERED 
	(
	IdRole
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Role SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Role', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Role', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Role', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Employee
	(
	idEmployee int NOT NULL,
	name varchar(10) NULL,
	lastName varchar(20) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT
	PK_Employee PRIMARY KEY CLUSTERED 
	(
	idEmployee
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Employee', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Employee_Role
	(
	EmployeeidEmployee int NULL,
	RoleidRole int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Employee_Role ADD CONSTRAINT
	FK_Employee_Role_Employee FOREIGN KEY
	(
	EmployeeidEmployee
	) REFERENCES dbo.Employee
	(
	idEmployee
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Employee_Role ADD CONSTRAINT
	FK_Employee_Role_Role FOREIGN KEY
	(
	RoleidRole
	) REFERENCES dbo.Role
	(
	IdRole
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Employee_Role SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Employee_Role', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Employee_Role', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Employee_Role', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Ticket
	(
	idCode int NOT NULL,
	description varchar(1000) NULL,
	state varchar(100) NULL,
	hour time(7) NULL,
	idCategory int NULL,
	idCostumer int NULL,
	idCordinator int NULL,
	idEmployee int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Ticket ADD CONSTRAINT
	PK_Ticket PRIMARY KEY CLUSTERED 
	(
	idCode
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Ticket ADD CONSTRAINT
	FK_Ticket_Cordinator FOREIGN KEY
	(
	idCordinator
	) REFERENCES dbo.Employee
	(
	idEmployee
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Ticket ADD CONSTRAINT
	FK_Ticket_Costumer FOREIGN KEY
	(
	idCostumer
	) REFERENCES dbo.Costumer
	(
	idCostumer
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Ticket ADD CONSTRAINT
	FK_Ticket_Funtionary FOREIGN KEY
	(
	idEmployee
	) REFERENCES dbo.Employee
	(
	idEmployee
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Ticket ADD CONSTRAINT
	FK_Ticket_Category FOREIGN KEY
	(
	idCategory
	) REFERENCES dbo.Category
	(
	idCategory
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Ticket SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Ticket', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Ticket', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Ticket', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Team
	(
	idTeam int NULL,
	idCordinator int NULL,
	idFuntionary int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Team ADD CONSTRAINT
	FK_Team_Cordinator FOREIGN KEY
	(
	idCordinator
	) REFERENCES dbo.Employee
	(
	idEmployee
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Team ADD CONSTRAINT
	FK_Team_Employee FOREIGN KEY
	(
	idFuntionary
	) REFERENCES dbo.Employee
	(
	idEmployee
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Team SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Team', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Team', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Team', 'Object', 'CONTROL') as Contr_Per 