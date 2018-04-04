using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            setcolorstate();
        }


        private void setcolorstate()
        {
            try
            {
                if (DB.Cn == null || DB.Cn.State != ConnectionState.Open)
                {
                    lblColorState.BackColor = Color.Red;
                    lblColorState.Text = "Close";
                }
                else
                {
                    lblColorState.BackColor = Color.Green;
                    lblColorState.Text = "Open";
                }
            }
            catch { }
        }

        private void btnConn_Click(object sender, EventArgs e)
        {
            try
            {
                DB.Connect(txtServer.Text, txtPort.Text, txtUser.Text, txtPwd.Text);
            }
            finally { setcolorstate(); };
            if (DB.Cn.State == ConnectionState.Open)
            {
                //this.Close();
            }
        }

        private void btnDisc_Click(object sender, EventArgs e)
        {
            try
            {
                DB.Disconnect();
            }
            finally { setcolorstate(); };
        }
    }
}
