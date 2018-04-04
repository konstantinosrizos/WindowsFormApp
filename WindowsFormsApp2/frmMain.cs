using System;
using System.Data;
using System.Data.Odbc;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class frmMain : Form
    {

        OdbcCommand cmd;
        OdbcDataReader reader;

        string SQL;
        DataTable tblCustomers = new DataTable();
        DataTable tblServices = new DataTable();
        DataTable tblFix = new DataTable();

        public frmMain()
        {
            InitializeComponent();
            cmd = new OdbcCommand();
            cmd.Connection = DB.Cn;
        }

        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Return)
            {
                go();
            }
        }

        private void go()
        {
            string t = txtSearch.Text;
            getCustomers(t);
        }

        private void getCustomers(string t)
        {
            string SQL = "SELECT customerId, Fname, Lname, Phone, Email" +
                    " FROM customers WHERE Lname LIKE ?";
            try {
                cmd.Parameters.Clear();
                cmd.CommandText = SQL;
                cmd.Parameters.AddWithValue("@param", txtSearch.Text + "%");
                reader = cmd.ExecuteReader();

                tblCustomers.Clear();
                tblCustomers.Load(reader);
                this.dgv.CellClick -= new DataGridViewCellEventHandler(this.dgv_CellClick);
                dgv.DataSource = null;
                dgv.DataSource = tblCustomers;
                this.Text = tblCustomers.Rows.Count.ToString();
                this.dgv.CellClick += new DataGridViewCellEventHandler(this.dgv_CellClick);
            } catch (Exception ex)    {
                MessageBox.Show(ex.Message);
            }finally{
                try   {
                    if (reader != null)   {
                        reader.Close();
                    }
                } catch { }
            }
        }

        private void getService(string t)
        {

            string SQL = "SELECT servId, a.Lname, name, indate, outdate, notes FROM services b, customers a " +
                "WHERE a.customerId = b.customerId AND b.customerId LIKE ?";

            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = SQL;
                cmd.Parameters.Add ("@customerId", OdbcType.Int, 11);
                cmd.Parameters["@customerId"].Value = t;
                reader = cmd.ExecuteReader();

                tblServices.Clear();
                tblServices.Load(reader);
                this.dataGridView1.CellClick -= new DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
                dataGridView1.DataSource = null;
                dataGridView1.DataSource = tblServices;
                this.Text = tblServices.Rows.Count.ToString();
                this.dataGridView1.CellClick += new DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                try
                {
                    if (reader != null)
                    {
                        reader.Close();
                    }
                }
                catch { }
            }

        }

        private void getFix(string t)
        {

            string SQL = "SELECT servId, a.Lname, rdate, notes FROM rdetails b, emps a WHERE a.empid = b.empId " +
                "AND b.servId LIKE ?";

            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = SQL;
                cmd.Parameters.Add("@servId", OdbcType.Int, 11);
                cmd.Parameters["@servId"].Value = t;
                reader = cmd.ExecuteReader();

                tblFix.Clear();
                tblFix.Load(reader);
                this.dataGridView2.CellClick -= new DataGridViewCellEventHandler(this.dataGridView2_CellContentClick);
                dataGridView2.DataSource = null;
                dataGridView2.DataSource = tblFix;
                this.Text = tblFix.Rows.Count.ToString();
                this.dataGridView2.CellClick += new DataGridViewCellEventHandler(this.dataGridView2_CellContentClick);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                try
                {
                    if (reader != null)
                    {
                        reader.Close();
                    }
                }
                catch { }
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {

            tblCustomers.Clear();
            dgv.DataSource = null;

            tblServices.Clear();
            dataGridView1.DataSource = null;

            tblFix.Clear();
            dataGridView2.DataSource = null;

            go();
        }

        private void Main_Load(object sender, EventArgs e)
        {
            Form f = new Form1();
            f.ShowDialog();
        }

        private void btnMainConn_Click(object sender, EventArgs e)
        {
            Form f = new Form1();
            f.ShowDialog();
        }


        private void dgv_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            tblServices.Clear();
            dataGridView1.DataSource = null;

            tblFix.Clear();
            dataGridView2.DataSource = null;

            int r = e.RowIndex;
            string id = dgv.Rows[r].Cells[0].Value.ToString();
            MessageBox.Show("You are gonna see the last name of the customer the product of the customer when he give it for repair when he took it and some notes");

            string t = id;
            getService(t);

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

            tblFix.Clear();
            dataGridView2.DataSource = null;

            int r = e.RowIndex;
            string id = dataGridView1.Rows[r].Cells[0].Value.ToString();
            MessageBox.Show("You are gonna see the last name of the engineer the repair date and some notes");

            string t = id;
            getFix(t);
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }

}
