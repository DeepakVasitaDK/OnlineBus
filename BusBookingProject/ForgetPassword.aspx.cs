using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace BusBookingProject
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        SqlCommand sqlCmd = new SqlCommand();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            GeneratePassword();
        }
        private DataSet getUserData()
        {
            DataSet dsGetData = new DataSet();
            
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@EmailID", Convert.ToString(txtUserId.Text));
            sqlCmd.CommandText = "ispForgetPassword";
            sqlCmd.Connection = connString;
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(dsGetData);
            return dsGetData;

        }

        //private int RandomNumber(int min, int max)
        //{
        //    Random rd = new Random();
        //    return rd.Next(min, max);
        //}

        //private string RandomString(int length)
        //{
        //    StringBuilder sb = new StringBuilder();
        //    Random rn = new Random();
        //    char value;
        //    for (int i=0;i<length;i++)
        //    {
        //        value = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * rn.NextDouble() + 65)));
        //        sb.Append(value);
        //    }
        //    return rn.ToString();
        //}

        public string GeneratePassword()
        {
            string PasswordLength = "8";
            string NewPassword = string.Empty;
            string allowedChars = "";
            allowedChars = "1,2,3,4,5,6,7,8,9,0";
            allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
            allowedChars += "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";
            char[] sep = {
            ','
        };
            string[] arr = allowedChars.Split(sep);


            string IDString = "";
            string temp = "";

            Random rand = new Random();

            for (int i = 0; i < Convert.ToInt32(PasswordLength); i++)
            {
                temp = arr[rand.Next(0, arr.Length)];
                IDString += temp;
                NewPassword = IDString;

            }
            return NewPassword;
        }
        //private int UpdateData()
        //{
        //    int ResultCout = 0;
        //    SqlCommand sqlCmd = new SqlCommand();
        //    if (connString.State == ConnectionState.Closed)
        //    {
        //        connString.Open();
        //    }
        //    sqlCmd.CommandType = CommandType.StoredProcedure;
        //    //sqlCmd.Parameters.AddWithValue("@newpass", Convert.ToString());
        //    sqlCmd.Parameters.AddWithValue("@EmailID", Convert.ToString(txtUserId.Text));
        //    sqlCmd.CommandText = "ispUpdateUserPassword";
        //    sqlCmd.Connection = connString;
        //    ResultCout = sqlCmd.ExecuteNonQuery(); ;
        //    return ResultCout;
        //}
        protected void btnfp_Click(object sender, EventArgs e)
        {
            DataSet dsLogin = getUserData();
            //int result = UpdateData();
            if (dsLogin.Tables[0].Rows.Count > 0)
            {
                string strNewPassword = GeneratePassword().ToString();
                try
                {
                    MailMessage msg = new MailMessage("deepakvasita3998@gmail.com", txtUserId.Text);

                    msg.Subject = "Random Password for your Account";
                    msg.Body = "Your Random password is:" + strNewPassword;
                    msg.IsBodyHtml = true;

                    SmtpClient smt = new SmtpClient("smtp.gmail.com", 587);
                    
                    smt.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smt.Credentials = new NetworkCredential()
                    {
                        UserName = "vasitadeepak233@gmail.com",
                        Password = "Deepak@0803"
                    };
                    smt.EnableSsl = true;
                    smt.Send(msg);

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry')", true);
                    Response.Redirect("Home.aspx");
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Email successfully send.......Please LogIn again with new password')", true);
                if (connString.State == ConnectionState.Closed)
                {
                    connString.Open();
                }
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@newpass", Convert.ToString(strNewPassword));
             //   sqlCmd.Parameters.AddWithValue("@EmailID", Convert.ToString(txtUserId.Text));
                sqlCmd.CommandText = "ispUpdateUserPassword";
                sqlCmd.Connection = connString;
                sqlCmd.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
            }

        }
    }
}