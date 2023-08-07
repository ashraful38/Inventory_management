<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <h3 style="color:blue;text-align:center;"> login form </h3>
  <div class=input-area>
  
    	<form method="post"  action="">
			<table>
			   
				<tr>
					<td>UserName:</td>
					<td><input name="userName" id="userName" required></td>
				</tr>
				
				<tr>
					<td>Password:</td>
					<td><input type="Password" name="password" id="Password" required></td>
				</tr>
			
				
			</table>
			<br><br>
			<!--<input type="submit" name="submit" value="Add New"> -->
			<!-- tag before the code and a -->
			 <input type="submit" name="submit" value="Login" id="rform" >
			<input type="reset" value="Cancel">
			
		</form>
  </div>
  
</body>
</html>

<%
dim db_connection
	db_connection = "Provider=MSDASQL; DRIVER={SQL Server}; SERVER=ASHRAFUL_MIS; DATABASE=product1; Trusted_Connection=yes;"

	set conn = Server.CreateObject("ADODB.Connection")
	conn.open(db_connection)

' Function to check the credentials against the database
Function ValidateUser(username, password)
    ' Replace this connection string with your database connection

    ' Replace "users" with the name of your user table
    Dim sql, rs
    sql = "SELECT UserType FROM Registration WHERE UserName = '" & username & "' AND Password = '" & password & "';"

    

    Set rs = conn.Execute(sql)
    If Not rs.EOF Then
        ValidateUser = rs("UserType")
    Else
        ValidateUser = ""
    End If

    rs.Close
    Set rs = Nothing

    conn.Close
    Set conn = Nothing
End Function

' Get the submitted username and password
Dim submittedUsername, submittedPassword
submittedUsername = Trim(Request.Form("userName"))
submittedPassword = Trim(Request.Form("password"))

' Perform the authentication
Dim userType
If Len(submittedUsername) > 0 And Len(submittedPassword) > 0 Then
    userType = ValidateUser(submittedUsername, submittedPassword)
    If Len(userType) > 0 Then
        ' Authentication successful, redirect to the appropriate page based on user type
        Select Case userType
            Case "admin"
                
				Session("loginIn")=True
				Session("userName")=submittedUsername
				Response.Redirect "productText1.asp"
            Case "user"
			    Session("loginIn")=True
				Session("userName")=submittedUsername
                Response.Redirect "Supplier.asp"
            Case Else
                ' Redirect to a default page or show an error message
                'Response.write ("<p> invalie Username and password .</p>")
				'Response.Redirect "login.asp?error=1"
        End Select
   
    End If
Else
    ' Redirect back to the login page if the username or password is empty
     'Response.Redirect "login1.asp"
    
End If


%>