<%@ Language=VBScript %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List Search</title>
</head>
<body>
    <h1>Product List Search</h1>
    <form method="post" action="">
        <label for="search_query">Search:</label>
        <input type="text" name="search_query" id="search_query" >
        <input type="submit" name="submit" value="Search">
    </form>

    <% 
    If Request.Form("submit") <> "" then
        Dim sql, search_query
        search_query = Trim(Request.Form("search_query"))

        ' Connect to MySQL server
		Dim db_connection, conn, rs
		db_connection = "Provider=MSDASQL; DRIVER={SQL Server}; SERVER=ASHRAFUL_MIS; DATABASE=product1; Trusted_Connection=yes;"
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.open(db_connection)

        ' Construct SQL query
        sql = "SELECT * FROM Product11 WHERE ProductName LIKE '%" & Replace(search_query, "'", "''") & "%'"
		
		'sql = "SELECT * FROM Product11 WHERE MATCH (ProductName) AGAINST ('" & search_query & "' IN BOOLEAN MODE)"

        ' Execute the query
        Set rs = conn.Execute(sql)
		'set rs=conn.execute("viewproductlist1")

        ' Display search results
        If Not rs.EOF Then
            Response.Write "<h2>Search Results:</h2>"
            Response.Write "<ul>"
            Do While Not rs.EOF
                Response.Write "<li>"
                Response.Write "Product ID: " & rs("ProductId") & "<br>"
                Response.Write "Product Name: " & rs("ProductName") & "<br>"
                Response.Write "Product Catagory: " & rs("CatagoryId") & "<br>"
                Response.Write "</li>"
                rs.MoveNext
            Loop
            Response.Write "</ul>"
        Else
            Response.Write "<p>No products found.</p>"
        End If

        ' Close connections and release objects
        rs.Close
        conn.Close
        Set rs = Nothing
        Set conn = Nothing
    End If
    %>
</body>
</html>