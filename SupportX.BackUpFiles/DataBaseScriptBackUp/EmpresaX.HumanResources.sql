use master;
Go
create database EmpresaX_HumanResources;
go
use EmpresaX_HumanResources;
go
/*
   miércoles, 6 de febrero de 201910:03:57 AM
   User: 
   Server: DESKTOP-GSN3PJ0
   Database: EmpresaX_ClientDB
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
CREATE TABLE dbo.Employee
	(
	idEmployee int NULL,
	name varchar(10) NULL,
	lastname varchar(20) NULL,
	nickname varchar(20) NULL,
	pass varchar(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Employee', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Employee', 'Object', 'CONTROL') as Contr_Per 