Create Procedure spAuthenticateUser
@UserName varchar (50),
@Password varchar (100)
as
Begin
	Declare @Count int
	
	Select @Count = COUNT([User_Name])
	from Users
	where [USER_NAME] = @UserName and [Password] = @Password
	
	if (@Count = 1)
	Begin
		Select 1 as ReturnCode
	End
	Else
	Begin
		Select 0 as ReturnCode
	End
End
