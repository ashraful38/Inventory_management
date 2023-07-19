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
    public partial class Purchase : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection(@"Data Source=Ashraful_MIS;Initial Catalog=UserRegistrationDB;Integrated Security=True");
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        DataTable dl1 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldropdownlist();
                FillGridView();
                addGridView();
            }
        }

        protected void filldropdownlist()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            //for product dropdown

            string productquery = "SELECT ProductId,ProductName FROM Product";
            cmd = new SqlCommand(productquery, sqlcon);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds, "product");
            DropDownProduct.DataSource = ds.Tables["product"];
            DropDownProduct.DataTextField = "ProductName";
            DropDownProduct.DataValueField = "ProductId";
            DropDownProduct.DataBind();

            //for supplier dropdownlist

            string supplierquery = "SELECT SupplierId,CompanyName FROM Supplier";
            cmd = new SqlCommand(supplierquery, sqlcon);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds, "supplier");
            DropDownSupplier.DataSource = ds.Tables["supplier"];
            DropDownSupplier.DataTextField = "CompanyName";
            DropDownSupplier.DataValueField = "SupplierId";
            DropDownSupplier.DataBind();

            sqlcon.Close();


        }

        void FillGridView()
        {
            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();

            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewPurchaseGrid1", sqlcon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlcon.Close();
            purchaseGrid.DataSource = dtbl;
            purchaseGrid.DataBind();

        }

        void addGridView() 
        {

           
            
            if (ViewState["add"] == null)
            {
                dl1.Columns.Add("ProductId");
                dl1.Columns.Add("ProductName");
                dl1.Columns.Add("SupplierId");
                dl1.Columns.Add("SupplierName");
                dl1.Columns.Add("Quantiry");
                ViewState["add"] = dl1;
                
            }
            

        }


        protected void btnsave_Click(object sender, EventArgs e)
        {

            if (sqlcon.State == ConnectionState.Closed)
                sqlcon.Open();
            SqlCommand sqlcmd = new SqlCommand("PurchasepSP", sqlcon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@PurchaseId", hfPurchaseId.Value == "" ? 0 : Convert.ToInt32(hfPurchaseId.Value));
            sqlcmd.Parameters.AddWithValue("@ProductId", Convert.ToInt32(DropDownProduct.SelectedValue));
            sqlcmd.Parameters.AddWithValue("@SupplierId", Convert.ToInt32(DropDownSupplier.SelectedValue));
            sqlcmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(txtQuantity.Text.Trim()));

            sqlcmd.ExecuteNonQuery();
            sqlcon.Close();
            string PurchaseId = hfPurchaseId.Value;


            if (PurchaseId == "")
                lblsuccessmassage.Text = "Saved Successfully";
            else
                lblsuccessmassage.Text = "Updated Successfully";
            FillGridView();
            clear();
            DropDownProduct.ClearSelection();
            DropDownSupplier.ClearSelection();



            

        }

        protected void btndelete_Click(object sender, EventArgs e)
        {

        }

       

        protected void lnk_onClick(object sender, EventArgs e)
        {
            


        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            this.clear();
        }
        public void clear()
        {
            hfPurchaseId.Value = "";
            txtQuantity.Text = "";
            DropDownProduct.ClearSelection();
            DropDownSupplier.ClearSelection();

            lblerrormessage.Text = lblsuccessmassage.Text = "";
            btnsave.Text = "Save";
            btndelete.Enabled = true;

        }

        public void gridClear()
        {
            ViewState["add"] = null;
            GridView2.DataSource = (DataTable)ViewState["add"];
            GridView2.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            

            dl1 = (DataTable)ViewState["add"];
            //dl1.Rows.Add(DropDownProduct.SelectedItem.Text, DropDownSupplier.SelectedItem.Text, txtQuantity.Text);
            dl1.Rows.Add(DropDownProduct.Text,DropDownProduct.SelectedItem.Text, DropDownSupplier.Text, DropDownSupplier.SelectedItem.Text, txtQuantity.Text);
            GridView2.DataSource = dl1;
            GridView2.DataBind();
        }

        protected void btnAllsave_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gr in GridView2.Rows)
            {
                if (sqlcon.State == ConnectionState.Closed)
                    sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("PurchasepSP", sqlcon);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@PurchaseId", hfPurchaseId.Value == "" ? 0 : Convert.ToInt32(hfPurchaseId.Value));
                sqlcmd.Parameters.AddWithValue("@ProductId", (gr.Cells[0].Text));
                sqlcmd.Parameters.AddWithValue("@SupplierId",(gr.Cells[2].Text));
                sqlcmd.Parameters.AddWithValue("@Quantity", (gr.Cells[4].Text));


                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
                string PurchaseId = hfPurchaseId.Value;


                if (PurchaseId == "")
                    lblsuccessmassage.Text = "Saved Successfully";
                else
                    lblsuccessmassage.Text = "Updated Successfully";
                FillGridView();
                gridClear();



            }
        }
           
    }
}