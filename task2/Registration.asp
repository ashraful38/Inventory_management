<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <h3 style="color:blue;text-align:center;"> Registration from </h3>
  <div class=input-area>
  
    	<form method="post"  action="">
			<table>
			    <tr>
					<td>Name:</td>
					<td><input name="name" id="name" required></td>
				</tr>
				<tr>
					<td>UserName:</td>
					<td><input name="userName" id="userName" required></td>
				</tr>
				
				<tr>
					<td>Phone:</td>
					<td><input type="number" name="phone" id="phone"></td>
				</tr>
				
				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" id="email"></td>
				</tr>
				<tr>
					<td>UserType:</td>
					<td>
					   <select name="usertype" class="dropdowitem" id="usertype">    
						   
							<option value="user"> user </option>    
							 
						</select> 
					 </td>
				</tr>
				
				<tr>
					<td>Password:</td>
					<td><input type="Password" name="password" id="Password"></td>
				</tr>
				<tr>
					<td>Confirm Password:</td>
					<td><input type="Password" name="cpassword" id="cpassword"></td>
				</tr>
				
			</table>
			<br><br>
			<!--<input type="submit" name="submit" value="Add New"> -->
			<!-- tag before the code and a -->
			 <input type="submit" name="submit" id="rform" >
			<input type="reset" value="Cancel">
			
			
		</form>
		<br>
		<a class="loginst" href="Login1.asp">login</a>
  </div>
  
</body>
</html>

<%


    dim db_connection
	db_connection = "Provider=MSDASQL; DRIVER={SQL Server}; SERVER=ASHRAFUL_MIS; DATABASE=product1; Trusted_Connection=yes;"

	set conn = Server.CreateObject("ADODB.Connection")
	conn.open(db_connection)
	
	' Check if the form has been submitted
If Request.Form("submit") <> "" then
    ' Retrieve form data
    Dim name , username, phone , email, usertype, password
    name = Trim(Request.Form("name"))
    username = Trim(Request.Form("userName"))
    phone = Trim(Request.Form("phone"))
    email = Trim(Request.Form("email"))
    usertype = Trim(Request.Form("usertype"))
    password = Trim(Request.Form("password"))
   

    ' Validate the data (you can add more validation as needed)
   

        ' Check if the username already exists in the database
        sql = "SELECT COUNT(*) FROM Registration WHERE UserName = '" & Replace(username, "'", "''") & "'"
        Dim count
        count = conn.Execute(sql).Fields(0).Value

        If count > 0 Then
            Response.Write("<p>Username already exists. Please choose a different one.</p>")
        Else
            ' Insert the new user into the database
            sql = "INSERT INTO Registration (Name , UserName, Phone, Email, UserType, Password) VALUES ('" & Replace(name, "'", "''") & "', '" & Replace(username, "'", "''") & "',  '" & Replace(phone, "'", "''") & "', '" & Replace(email, "'", "''") & "', '" & Replace(usertype, "'", "''") & "', '" & Replace(password, "'", "''") & "')"
            conn.Execute(sql)

            Response.Write("<p>Registration successful!</p>")
            ' You can redirect the user to a different page after successful registration if needed.
        End If

        ' Clean up
        conn.Close
        Set conn = Nothing
   
End If
	
	
	


%>