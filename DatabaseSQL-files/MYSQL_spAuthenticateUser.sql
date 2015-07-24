DELIMITER $$
Create Procedure spAuthenticateUser (IN UserName varchar(45), IN UserPass varchar(45))
Begin
	Declare Count int;
    Declare ReturnCode varchar(45);
	
	Select COUNT(User_Name) As Count
	from Users
	where User_Name = UserName and User_Pass = UserPass;
End $$

drop procedure spAuthenticateUser
