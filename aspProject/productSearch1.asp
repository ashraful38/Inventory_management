<%@ Language=VBScript %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Purchase List Search</title>
	 <style>
	 table{
		border:1px solid blue;
		padding:4px;
		text-align:center;
		margin-left:10px;
		border-collapse: collapse;
	}
	
	 th,td{
		border:1px solid blue;
		padding:4px;
		text-align:center;
		margin-left:10px;
		border-collapse: collapse;
	}	
	
</style>
</head>
<body>
    <h1>Product Purchase List Search</h1>
    <form method="GET" action="">
        Start Date: <input type="date" name="start_date">
        End Date: <input type="date" name="end_date">
        <input type="submit" name="submit" value="Search">
    </form>
	<br>

    <% 
    ' Check if the form has been submitted
If Request.QueryString("submit") <> "" then
        Dim start_date, end_date
        start_date = Request.QueryString("start_date")
        end_date = Request.QueryString("end_date")

        ' Connect to MySQL database
       ' Connect to MySQL server
		Dim db_connection, conn
		db_connection = "Provider=MSDASQL; DRIVER={SQL Server}; SERVER=ASHRAFUL_MIS; DATABASE=product1; Trusted_Connection=yes;"
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.open(db_connection)

            ' Execute the stored procedure
        Dim cmd
        Set cmd = Server.CreateObject("ADODB.Command")
        cmd.ActiveConnection = conn
        cmd.CommandType = 4 ' adCmdStoredProc

        ' Replace "sp_search_product_purchase_by_date" with the name of your stored procedure
        cmd.CommandText = "sp_search_purchase_by_date"
        cmd.Parameters.Append cmd.CreateParameter("@StartDateParam", 129, 1, -1, start_date)
        cmd.Parameters.Append cmd.CreateParameter("@EndDateParam", 129, 1, -1, end_date)


        ' Execute the query
        Dim rs
        Set rs = cmd.Execute

        ' Display the results
        If rs.EOF Then
            Response.Write("<p>No purchases found between the specified dates.</p>")
        Else
            Response.Write("<table>")
            Response.Write("<tr><th>PurchaseId</th><th>ProductName</th><th>SupplierName</th><th>Color</th><th>Quantity</th><th>Purchase Date</th></tr>")
            Do While Not rs.EOF
                Response.Write("<tr>")
                Response.Write("<td>" & rs("PurchaseId") & "</td>")
                Response.Write("<td>" & rs("ProductName") & "</td>")
				Response.Write("<td>" & rs("SupplierName") & "</td>")
				Response.Write("<td>" & rs("Color") & "</td>")
				Response.Write("<td>" & rs("Qunatity") & "</td>")
				Response.Write("<td>" & rs("Date") & "</td>")
                Response.Write("</tr>")
                rs.MoveNext
            Loop
            Response.Write("</table>")
        End If

        ' Clean up
        rs.Close
        Set rs = Nothing
        conn.Close
        Set conn = Nothing
    End If
 %>
</body>
</html>