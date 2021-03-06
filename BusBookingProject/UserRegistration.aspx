<%@ Page Title="" Language="C#" MasterPageFile="~/BusBookingMaster.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="BusBookingProject.UserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="margin-top: 5%">
    </div>
    <div class="row centered-form" style="margin-top: 5%">
        <div class="col-lg-8 col-sm-8 col-md-2 col-sm-offset-2 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">New User Registration</h3>
                </div>
                <div class="panel-body">
                    <asp:ValidationSummary ID="vsRegister" runat="server" CssClass="alert alert-danger" ShowSummary="true" ValidationGroup="vgRegister" />
                    <div id="divMessage" runat="server" />
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblFirstName" runat="server" Text="First Name" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtFirstName" runat="server" class="form-control input-sm floatlabel"/>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" Display="None" ID="rfvFirstName" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="First Name is required." /><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^[A-Z]{1}[A-Za-z]{2,}$" ErrorMessage="First Letter should Capital in First Name Always." ValidationGroup="vgRegister" ControlToValidate="txtFirstName" Display="None" CssClass="text-danger"></asp:RegularExpressionValidator>

                        </div>
                       <div class="form-group">
                            <asp:Label ID="lblMobileNumber" runat="server" Text="Mobile No" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtMobileNo" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobileNo" Display="None" ID="rfVMobileNo" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Mobile No is required." /><br />
                           <asp:RegularExpressionValidator ID="regexmobileno" runat="server" ValidationExpression="^[6-9]{1}[0-9]{9}$" ErrorMessage="Enter valid Phone Number" ValidationGroup="vgRegister" ControlToValidate="txtMobileNo" Display="None" CssClass="text-danger"></asp:RegularExpressionValidator>
                           
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblLastName" runat="server" Text="Last Name" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtLastName" runat="server" class="form-control input-sm floatlabel"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" Display="None" ID="rfVLastName" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Last Name is required." /><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^[A-Z]{1}[A-Za-z]{2,}$" ErrorMessage="First Letter should Capital in Last Name Always." ValidationGroup="vgRegister" ControlToValidate="txtLastName" Display="None" CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Password" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" class="form-control input-sm floatlabel" TextMode="Password" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" Display="None" ID="rfvPassword" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Password  is required." />
                            <asp:RegularExpressionValidator ID="regexpass" runat="server" ValidationExpression="^^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$" ErrorMessage="Password must contain Atleast 1 Capital and 1 Small Alphabates,1 Special Character with minimum 8 characters" ValidationGroup="vgRegister" ControlToValidate="txtPassword" Display="None" CssClass="text-danger"></asp:RegularExpressionValidator>
                            <br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblEmail" runat="server" Text="Email ID" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtEmailID" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailID" Display="None" ID="rfVEmail" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Email Id is required." />
                            <asp:RegularExpressionValidator ID="regexmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter valid format for email" ValidationGroup="vgRegister" ControlToValidate="txtEmailID" Display="None" CssClass="text-danger"></asp:RegularExpressionValidator>
                            <br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblAddress" runat="server" Text="Address" Font-Bold="true"></asp:Label>
                            <asp:TextBox runat="server" ID="txtAddress" class="form-control input-sm" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" Display="None" ID="rfVAddress" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Address  is required." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblCity" runat="server" Text="City" Font-Bold="true"></asp:Label>
                            <asp:TextBox runat="server" ID="txtCity" class="form-control input-sm" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity" Display="None" ID="rfVCity" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="City Name is required." /><br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblPinCode" runat="server" Text="Pincode" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtPincode" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPincode" Display="None" ID="rfvPinCode" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Pin code is required." /><br />
                            <asp:RegularExpressionValidator ID="regexpincode" runat="server" ValidationExpression="^[0-9]{6}$" ErrorMessage="Enter valid Pincode" ValidationGroup="vgRegister" ControlToValidate="txtPincode" Display="None" CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Button ID="btnSave" runat="server" Text="Register" OnClick="btnSave_Click" class="btn btn-info " ValidationGroup="vgRegister"  CausesValidation="True" ViewStateMode="Inherit" />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <a href="Login.aspx" class="btn btn-info btn-block">Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
