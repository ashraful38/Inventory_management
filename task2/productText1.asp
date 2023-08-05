<%
'Declare a variable to store the connection string    
    Dim connstr    
    connstr = "Provider=MSDASQL; DRIVER={SQL Server}; SERVER=ASHRAFUL_MIS; DATABASE=product1; Trusted_Connection=yes;" 
	
	 'Create a new ADODB connection     
    Set conn = Server.CreateObject("ADODB.Connection")     
    
    'Open the connection using the connection string      
    conn.open connstr  

    if not Session("loginIn")= True then
         Response.redirect "Login1.asp"	
	end if
	

    
%>

<%
  If Request.Form("submit12") <> "" then
      Session("loginIn")= False
	  Session.Abandon
	  Response.redirect "Login1.asp"	
	  
   
  END IF
%>



  <%
	   If Request.Form("submit") <> "" then
			   
                ProductName = Trim(request.form("ProductName"))
			    productSelect = Trim(request.form("myDropDown"))
				' productSelect = Trim(request.form("cid"))
				
            		
			
			' Create XML data
				  Dim xmlData
				  Set xmlData = Server.CreateObject("MSXML2.DOMDocument")
				  xmlData.loadXML("<products><product><ProductName>" & ProductName & "</ProductName><CatagoryId>" &  productSelect & "</CatagoryId></product></products>")
			
			
                dim xmlParameter
				xmlParameter = xmlData.xml
			
			
			' Prepare the SQL command to call the stored procedure
			  Dim cmd
			  Set cmd = Server.CreateObject("ADODB.Command")
			  cmd.ActiveConnection = conn
			  cmd.CommandText = "InsertProductsFromXML14"
			  'cmd.CommandType = adCmdStoredProc
			  cmd.CommandType = 4 ' adCmdStoredProc
			  
			  cmd.Parameters.Append cmd.CreateParameter("@XmlData", 129, 1, -1, xmlParameter)
			  
			  
				cmd.Execute

				' Close the connection and clean up objects
				'conn.Close
				'Set cmd = Nothing
				'Set conn = Nothing
				'Set xmlDoc = Nothing
								
				
				
			     

		END IF
		
		 'productviewlist
			 'dim rs
				 'Set rs = Server.CreateObject("ADODB.Recordset")
		   set rs=conn.execute("select * from product11")
		 
		
%>


<!DOCTYPE html>
<html>
<head>
 
 <link rel="stylesheet" href="css/style.css">
  <style>
	.display table{
		border:1px solid blue;
		padding:4px;
		text-align:center;
		margin-left:10px;
		border-collapse: collapse;
	}
	
	.display td{
		border:1px solid blue;
		padding:4px;
		text-align:center;
		margin-left:10px;
		border-collapse: collapse;
	}	
	
</style>
</head>
<body>
 <nav class="header cheader">
    <h1 class="logo">Inventory Management</h1>
    <div>
	   	<ul style="text-align:center"  class="ul-item">
			<li><a class="active" href="Home.asp">Home</a></li>
			<li><a href="productText1.asp">Product</a></li>
			<li><a href="Supplier.asp">Supplier</a></li>
			<li><a href="purchase.asp">Purchase</a></li>
	    </ul>
	</div>
	<div>
	   	<ul class="ul-right-item">
		<form method="post">
			<input type="submit" name="submit12" value="Logout" id="rform" >
		</form>	
	    </ul>
	</div>
	
 </nav>
 
 <div>
    <h3 style="color:blue;text-align:center;">Product view</h3>
 </div>


<div class=input-area>
    <form method="post" action="">
		<table>
			<tr>
				<td>ProductName:</td>
				<td><input name="ProductName"></td>
			</tr>
			<tr>
				<td>Catagory:</td>
				<td>    
							
				 
					    <%    
						      dim xmlDoc
							  Set xmlDoc = Server.CreateObject("Microsoft.XMLDOM")
							  xmlDoc.async = False
							  xmlDoc.load(Server.MapPath("catagroy.xml"))
							  
							  

						
							  Set nodeList = xmlDoc.getElementsByTagName("catagory")
							  
							  dropDownHTML = "<select name='myDropDown' class='dropdowitem'>"
							For Each node In nodeList
								dropDownHTML = dropDownHTML & "<option value='" & node.getAttribute("value") & "'>" & node.text & "</option>"
							Next
							dropDownHTML = dropDownHTML & "</select>"

							' Output the drop-down list HTML
							Response.Write(dropDownHTML)
						
						%> 
						
						
			
				</td>
			</tr>
			
			
		</table>
		<br><br>
		<input type="submit" name="submit" value="Add New">
		<input type="reset" value="Cancel">
    </form>

 </div>
 
 <br>
<h3>display data table</h3>
</br>

 
  <div class="display">
 
     <form  action="product.asp">
		 <table>
			 <tr>
				<td>ProductId</td>
				<td>ProductName</td>
				<td>CatagoryId</td>
			</tr>
				<%
                dim x
				do until rs.EOF
					Response.Write("<tr>")
					  for each X in rs.Fields
						 Response.Write("<td>" & x.value & "</td>")
					  Next
					  
					Response.write("</tr>")
					rs.movenext
				loop

			     %>

		</table>
	</form>
 </div>

   
   

</body>
</html>

