Use AXLAF

Create Table Users (
	ID	int identity (1,1) primary key
	,[User_Name] varchar(50) not null
	,[Password]	varchar(100) not null
)

Create Table Users (
	ID	int identity (1,1) primary key
	,[User_Name] varchar(50) not null
	,[Password]	varchar(100) not null
)

drop table checkedItems

Create Table checkedItems (
	Item_ID				int IDENTITY(1,1) primary key
	, Checked_Time		varchar(25)
	, Turned_In			varchar(25)
	, [Type]			varchar(25)
	, Color				varchar(10)
	, Location_Found	varchar(25)
	, [Description]		varchar(255)
	, Stored_Location	varchar(25)
	, Entered_By		varchar(25)
	, Full_Name			varchar(50)
	, Contact_Info		varchar(20)
	, Taken_Out_BY		varchar(25)
)

Create Table reports (
	Item_ID				varchar(25) primary key
	, Full_Name			varchar(50)
	, Contact_Info		varchar(25)
	, [Type]			varchar(25)
	, Color				varchar(10)
	, [Description]		varchar(255)
	, Entered_By		varchar(25)
)

select * from data

select * from checkedItems
