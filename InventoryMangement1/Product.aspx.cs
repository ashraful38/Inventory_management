using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryMangement1
{
    public partial class Product : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=Ashraful_MIS;Initial Catalog=UserRegistrationDB;Integrated Security=True");
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btndelete.Enabled = false;
                filldropdownlist();
                FillGridView();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
                if (sqlcon.State == ConnectionState.Closed)

                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("Productsp", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@ProductId", Convert.ToInt32(hfProductId.Value == "" ? "0" : hfProductId.Value));
                sqlcmd.Parameters.AddWithValue("@ProductName", txtproname.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Color", Txtcolor.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@CatagoryId", Convert.ToInt32(DropDownCatagory.SelectedValue));

            sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
                string ProductId = hfProductId.Value;
                clear();

                if (ProductId == "")
                    lblsuccessmassage.Text = "Saved Successfully";
                else
                    lblsuccessmassage.Text = "Updated Successfully";
                FillGridView();
            
                //if (sqlcon.State == ConnectionState.Closed)
            
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {

        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlcmd = new SqlCommand("Productdelete", sqlcon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ProductId", Convert.ToInt32(hfProductId.Value));
            
            sqlcmd.ExecuteNonQuery();
            sqlcon.Close();
            clear();
            FillGridView();
            lblsuccessmassage.Text = "Deleted Successfully";
        }

        protected void lnk_onClick(object sender, EventArgs e)
        {

            //int ProductId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            //if (sqlcon.State == ConnectionState.Closed)
            //    sqlcon.Open();
            //SqlDataAdapter sqlDa = new SqlDataAdapter("ProductList", sqlcon);
            //sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            //sqlDa.SelectCommand.Parameters.AddWithValue("@ProductId", ProductId);
            //DataTable dtbl = new DataTable();
            //sqlDa.Fill(dtbl);
            //sqlcon.Close();
            //hfProductId.Value = ProductId.ToString();
            //txtproname.Text = dtbl.Rows[0]["ProductName"].ToString();
           
            //btnsave.Text = "Update";
            //btndelete.Enabled = true;

        }

       

        public void clear()
        {
            hfProductId.Value = "";
            
            lblerrormessage.Text = lblsuccessmassage.Text = "";
            btnsave.Text = "Save";
            btndelete.Enabled = true;

        }

        void FillGridView()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("viewproductlist44", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            productGrid.DataSource = dtbl;
            productGrid.DataBind();
        }

        protected void DropDownSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void filldropdownlist()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            //for product dropdown

            string Catagoryquery = "SELECT CatagoryId,CatagoryName FROM Catagroy";
            SqlCommand cmd = new SqlCommand(Catagoryquery, sqlcon);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Catagroy");
            DropDownCatagory.DataSource = ds.Tables["Catagroy"];
            DropDownCatagory.DataTextField = "CatagoryName";
            DropDownCatagory.DataValueField ="CatagoryId";
            DropDownCatagory.DataBind();

          

            sqlcon.Close();


        }

        
    }
}