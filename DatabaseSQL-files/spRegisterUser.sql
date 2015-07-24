Create Procedure spRegisterUser
@UserName varchar(100),
@Password varchar(200)
as 
Begin
	Declare @Count int
	Declare @ReturnCode int
	
	Select @Count = COUNT([User_Name])
	from Users where User_Name = @UserName
	if @Count > 0
	Begin
		Set @ReturnCode = -1
	End
	Else
	Begin
		Set @ReturnCode = 1
		Insert into Users
		values (@UserName, @Password)
	End
	Select @ReturnCode as ReturnValue
End
