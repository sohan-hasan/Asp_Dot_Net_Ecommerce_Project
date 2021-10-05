<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegistrationUserControl.ascx.cs" Inherits="ProjectZupree.User_Control.RegistrationUserControl" %>

		<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100" style="padding: 74px 130px 33px 95px;">
				<div class="login100-pic reg100-pic js-tilt" data-tilt>
						<img src="../App_Images/img-01.png" alt="IMG">
					</div>
					<div class="login100-form"">
						<span class="login100-form-title">
							User Registration
						</span>
						<div class="wrap-input100">
							<asp:TextBox ID="txtFirstName" runat="server" class="input100" type="text" name="FirstName" placeholder="First Name"></asp:TextBox>
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="far fa-user"></i>
							</span>
						</div>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name Required !" ControlToValidate="txtFirstName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
						<div class="wrap-input100">
							<asp:TextBox ID="txtLastName" runat="server" class="input100" type="text" name="LastName" placeholder="Last Name"></asp:TextBox>
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="far fa-user"></i>
							</span>
						</div>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name Required !" ControlToValidate="txtLastName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
						<div class="wrap-input100">
							<asp:TextBox ID="txtUserName" runat="server" class="input100" type="text" name="UserName" placeholder="User Name"></asp:TextBox>
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fas fa-user"></i>
							</span>
						</div>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="User Name Required !" ControlToValidate="txtUserName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
						<asp:Label ID="lblUserExist" runat="server" Text="" ForeColor="Red"></asp:Label>
						<div class="wrap-input100">
							<asp:TextBox ID="txtPhone" runat="server" class="input100" type="text" name="phone" placeholder="Phone"></asp:TextBox>
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fas fa-phone"></i>
							</span>
						</div>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone Number Required !" ControlToValidate="txtUserName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
						<div class="wrap-input100">
							<asp:TextBox ID="txtEmail" runat="server" class="input100" type="text" name="email" placeholder="Email"></asp:TextBox>
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</span>
						</div>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email Required !" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid email is required: ex@abc.xyz" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
						<div class="wrap-input100">
								<div class="_2_68">
									Gender&nbsp;&nbsp;<i class="fas fa-question-circle"></i>
								</div>
								<span class="_5k_2 _5dba">
									<label class="_58mt" for="u_5_4_Ta">Female&nbsp;&nbsp;</label>
									<asp:RadioButton ID="radioFemale" runat="server" class="_8esa" name="sex"  GroupName="Gender" Checked="true"/>
								</span>
								&nbsp;&nbsp;&nbsp;
								<span class="_5k_2 _5dba">
									<label class="_58mt" for="u_5_4_Ta">Male&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<asp:RadioButton ID="radioMale" runat="server" class="_8esa" name="sex"   GroupName="Gender"/>
								</span>
							</div>
						<div class="wrap-input100">
							<asp:Image ID="Image1" runat="server" Style="width:80px; height:80px;" /><br />
							<asp:FileUpload class="my-3" ID="FileUpload1" runat="server" Width="105px"  onchange="if(confirm('upload'+this.value+'?')) this.form.submit()" /><br />
							<asp:Label ID="lblMessage" runat="server" Text="Image uploaded successfully." ForeColor="Green" Visible="false" />        
							<asp:HiddenField ID="HiddenFieldImageName" runat="server" />
							<asp:HiddenField ID="HiddenFieldImageUrl" runat="server" />
						</div>
								<div class="wrap-input100">
							<asp:TextBox ID="txtPassword" runat="server" class="input100" type="password" name="password" placeholder="Password"></asp:TextBox>
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fa fa-lock" aria-hidden="true"></i>
							</span>
						</div>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password Required !" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
						<div class="wrap-input100">
							<asp:TextBox ID="txtConfirmPass" runat="server" class="input100" type="password" name="password" placeholder="Confirm Pass" TextMode="Password"></asp:TextBox>
							<span class="focus-input100"></span>
							<span class="symbol-input100">
									<i class="fa fa-lock" aria-hidden="true"></i>
								</span>
							</div>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Confirm Password Required !" ControlToValidate="txtConfirmPass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
							<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass" Display="Dynamic" ForeColor="#FF3300"></asp:CompareValidator>
						
								<div class="container-login100-form-btn">
									<asp:Button ID="btnSingUp" class="login100-form-btn" runat="server" Text="Sing Up" OnClick="btnSingUp_Click" />
								</div>
								<div class="text-center p-t-12">
									<a href="../LoginPage.aspx" class="txt2  cursor_pointer">
										Login your Account
									<i class="fas fa-long-arrow-alt-right  m-l-5" style="font-size: 12px;"></i>
								</a>
								</div>
					</div>
			</div>
		</div>
		</div>

