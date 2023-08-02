<%
'Declare a variable to store the connection string    
    Dim connstr    
    connstr = "Provider=MSDASQL; DRIVER={SQL Server}; SERVER=ASHRAFUL_MIS; DATABASE=product1; Trusted_Connection=yes;" 
	
	 'Create a new ADODB connection     
    Set conn = Server.CreateObject("ADODB.Connection")     
    
    'Open the connection using the connection string      
    conn.open connstr    
	
    
%>

<%      
        
    'Create a new ADODB recordset      
    set rsSelectedProduct = Server.CreateObject("ADODB.recordset")     
           
    'Store  the query in a variable , in real world scenario we should be using a stored procedure with parameters    
    QuerySQL = "Select  ProductName from product11 where ProductId = ProductId "     
    
    'Execute the query     
    set rsSelectedProduct = conn.Execute(QuerySQL)      
    
    'Check if recordset is empty , if not then store the value     
    if not rsSelectedProduct.EOF then      
      product = rsSelectedProduct("ProductName")      
    else      
      product = ""      
    end if    
	

       
    Function selectProduct(vProduct)      
      if vProduct = product then      
          Response.Write("selected=""selected""")           
     end if      
    End Function    
  
      

    
    'Create Recordset object    
    Set rsProductList = Server.CreateObject("ADODB.recordset")    
    
        
    QueryProduct = "select ProductName,ProductId from product11 order by ProductName asc"    
  
     'Execute the query   
    set rsProductList = conn.Execute(QueryProduct)    
     'Declare the array  
    Dim arrProducts   
    
    if not rsProductList.EOF then    
          arrProducts = rsProductList.GetRows()  ' Convert recordset to 2D Array  
    end if   
      
 
%>

<%      
     
   
    'Create a new ADODB recordset      
    set rsSelectedcatagory = Server.CreateObject("ADODB.recordset")     
    
    
    'Store  the query in a variable , in real world scenario we should be using a stored procedure with parameters    
    QuerySQL = "Select  SupplierName from Suppliers where SupplierId =  SupplierId "     
    
    'Execute the query     
    set rsSelectedcatagory = conn.Execute(QuerySQL)      
    
    'Check if recordset is empty , if not then store the value     
    if not rsSelectedcatagory.EOF then      
      Catagory = rsSelectedcatagory("SupplierName")      
    else      
      Catagory = ""      
    end if    
         
  
    'Declare a function to set the selected text     
    Function selectCatagory(vcatagory)      
      if vcatagory = Catagory then      
          Response.Write("selected=""selected""")           
     end if      
    End Function    
  
    'Create Recordset object    
    Set rsCatagorytList = Server.CreateObject("ADODB.recordset")    
       
    
     'Declare a variable to store the query to be excuted. Here we are using a hardcoded query.We can also use a stored procedure    
    QueryProduct = "select SupplierName,  SupplierId from Suppliers order by SupplierName asc"    
  
     'Execute the query   
    set rsCatagorytList = conn.Execute(QueryProduct)    
     'Declare the array  
    Dim arrProducts1   
    
    if not rsCatagorytList.EOF then    
          arrProducts1 = rsCatagorytList.GetRows()  ' Convert recordset to 2D Array  
    end if   
  
     
%>  



  <%
	    
	   If Request.Form("submit") <> "" then
			
			
                Dim objTable, objRows, objRow
				Set objTable = Request.Form("htmlTableData")
				Set objRows = objTable.getElementsByTagName("tr")
				
				For i = 1 To objRows.length - 1 
				Set objRow = objRows(i)
				ProductName = objRow.getElementsByTagName("td")(0).value
				SupplierName = objRow.getElementsByTagName("td")(2).value
				color = objRow.getElementsByTagName("td")(4).value
				Quantity = objRow.getElementsByTagName("td")(5).value
				
				' Dim table
				' Set table = Server.CreateObject("MSXML2.DOMDocument")
				' table.loadXML(Request.Form("htmlTableData"))

				' Dim name, age
				' Dim rows, row, cols
				' Set rows = table.getElementsByTagName("tr")

				' For Each row In rows
					' cols = row.getElementsByTagName("td")
					' ProductName = cols(0).innerText
					' SupplierName = cols(2).innerText
					' color = cols(4).innerText
					' Quantity = cols(5).innerText
					



                
                ' ProductName = Trim(request.form("productSelect"))
			    ' SupplierName = Trim(request.form("SupplierSelect"))
			    ' color = Trim(request.form("color"))
			    ' Quantity = Trim(request.form("quantity"))
				
				conn.execute  "INSERT INTO Purchase VALUES('" & ProductName & "', '" & SupplierName& "' , '" &  color& "' , '" &  Quantity& "')"
				Next
				If Err.Number <> 0 Then
					Response.Write("Error: " & Err.Description)
				Else
					Response.Write("Data has been submitted.")
				End If
			    

				'On Error Resume Next
				'conn.execute(ssSQL)
		
			'conn.Close()
			'set conn = Nothing
		 END IF
		 set rs=conn.execute("ViewPurchaseGrid2")
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
	
	.display td,th{
		border:1px solid blue;
		padding:4px;
		text-align:center;
		margin-left:10px;
		border-collapse: collapse;
	}

    .input-area1{
		display:flex;
	    justify-content:space-around;
	    align-items:center;
	}	
	
</style>
</head>
<body>
 <nav class="header cheader">
    <h1 class="logo">Inventory Management</h1>
    <div>
	   	<ul style="text-align:center"  class="ul-item">
			<li><a class="active" href="Home.asp">Home</a></li>
			<li><a href="Product.asp">Product</a></li>
			<li><a href="Supplier.asp">Supplier</a></li>
			<li><a href="purchase.asp">Purchase</a></li>
	    </ul>
	</div>
	
 </nav>
 
 <div>
    <h3 style="color:blue;text-align:center;">Purchase view</h3>
 </div>
 
 <div class="input-area1">
 
	 <div class=input-area>
	    <h5>Input Area</h5>
		<br>
		<form method="post"  action="">
			<table>
				<tr>
					<td>ProductName:</td>
					<td>
					   <select name="productSelect" class="dropdowitem" id="productSelect">    
						  <%    
							  'Check whether it's a proper array or not    
								if IsArray(arrProducts) then    
							
									For i = 0 to ubound(arrProducts, 2) %>    
							
									<option value="<%= arrProducts(1,i)%>" <%= selectCatagory(arrProducts(0,i)) %>> <%= arrProducts(0,i) %> </option>    
							
								   <% next %>    
							
								<% else %>    
							
									<option value=""> Select </option>    
							
								<% end if %>    
							
							</select> 
					 </td>
				</tr>
				<tr>
					<td>SupplierName:</td>
					<td>
					  <select name="SupplierSelect" class="dropdowitem" id="SupplierSelect">    
						  <%    
							  'Check whether it's a proper array or not    
								if IsArray(arrProducts) then    
							
									For i = 0 to ubound(arrProducts1, 2) %>    
							
									<option value="<%= arrProducts1(1,i)%>" <%= selectProduct(arrProducts1(0,i)) %>> <%= arrProducts1(0,i) %> </option>    
							
								   <% next %>    
							
								<% else %>    
							
									<option value=""> Select </option>    
							
								<% end if %>    
							
							</select> 
				
					</td>
				</tr>
				<tr>
					<td>Color:</td>
					<td><input name="color" id="color"></td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td><input name="quantity" id="quantity"></td>
				</tr>
				
			</table>
			<br><br>
			<!--<input type="submit" name="submit" value="Add New"> -->
			<!-- tag before the code and a -->
			 <input type="submit" id="productForm" value="Add Product">
			<input type="reset" value="Cancel">
		</form>

	 </div>
 
 
	 <div>
		<h5>Selected Product</h5>
		<br>
		<div class="display">
	 
				 <form   action="">
					 <table  name="htmlTableData" id="productTable">
						 <tr id="producttr">
						    <!--<td>ProductId</td>
							<td>ProductName</td>
							<td>SupplierId</td>
							<td>SupplierName</td>
							<td>Color</td>
							<td>Quantity</td>-->
							
							<th>ProductId</th>
							<th>ProductName</th>
							<th>SupplierId</th>
							<th>SupplierName</th>
							<th>Color</th>
							<th>Quantity</th>
							
						</tr>
						

					</table>
					<input type="submit" name="submit" value="Add New">
				</form>
			 </div>
	 
	 </div>
</div>
 
  <br>
<h3>display data table</h3>
</br>

 
  <div class="display">
 
     <form  action="">
		 <table>
			 <tr>
				<td>PurchaseId</td>
				<td>ProductName</td>
				<td>SupplierName</td>
				<td>Color</td>
				<td>Quantity</td>
				
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


  <script>
    document.getElementById("productForm").onclick = function (e) {
    e.preventDefault();
		
		const ProductId = document.getElementById("productSelect").value;
		const productName = productSelect.options[productSelect.selectedIndex].text;
		const SupplierId = document.getElementById("SupplierSelect").value;
		const SupplierName = SupplierSelect.options[SupplierSelect.selectedIndex].text;
		const Color = document.getElementById("color").value;
		const Quantity = document.getElementById("quantity").value;
		
		const table = document.getElementById("productTable");
		const newRow = table.insertRow(-1);
		const cell1 = newRow.insertCell(0);
		const cell2 = newRow.insertCell(1);
		const cell3 = newRow.insertCell(2);
		const cell4 = newRow.insertCell(3);
		const cell5 = newRow.insertCell(4);
		const cell6 = newRow.insertCell(5);
		
		
		cell1.innerHTML = ProductId;
		cell2.innerHTML = productName;
		cell3.innerHTML = SupplierId;
		cell4.innerHTML = SupplierName;
		cell5.innerHTML = Color;
		cell6.innerHTML = Quantity;
		
		
		
		

		document.getElementById("productForm").reset();
    };
  </script>

</body>
</html>


