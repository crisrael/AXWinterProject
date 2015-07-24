Drop procedure spRegisterUser

DELIMITER $$
Create Procedure spRegisterUser (IN UserName varchar(45), IN UserPass varchar(45), IN FullName varchar(100))
Begin
	Declare Count int;
    
    Set Count = (Select COUNT(User_Name) as Count from Users where User_Name = UserName);
    
    Select Count;
    
	if Count = 0 Then
		Insert into Users (User_Name, User_Pass, Full_Name)
		values (UserName, UserPass, FullName);
	End If;
End$$
