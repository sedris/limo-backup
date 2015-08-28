<%@ Page Language="C#" AutoEventWireup="true" smartNavigation="true"%>
<%@ Import namespace="System.Web.Mail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Adam Limousine Service | Reservations | Online Reservations</title>
<link rel="stylesheet" type="text/css" href="css/al_styles.css"  />
<link rel="stylesheet" type="text/css" href="css/calendar-win2k-cold-1.css" />
<script src="js/calendar.js" type="text/javascript"></script>
<script src="js/calendar-en.js" type="text/javascript"></script>
<script src="js/calendar-setup.js" type="text/javascript"></script>
<script type ="text/javascript">

// opening calendar makes these hidden on Chrome for some reason - force visible
function forceVisible()
{	
	document.getElementById("cmbHourPickUpTime").style.visibility = "visible";
	document.getElementById("cmbPickUpTime").style.visibility = "visible";
	document.getElementById("cmbAMPMPickUpTime").style.visibility = "visible";
	
	document.getElementById("cmbHourDropOffTime").style.visibility = "visible";
	document.getElementById("cmbMinutesDropOffTime").style.visibility = "visible";
	document.getElementById("cmbAMPMDropOffTime").style.visibility = "visible";
}
function CancelClick()
{
document.forms[0].reset();
return false;
}
function CheckEmail(strEmail) {
email = strEmail
AtPos = email.indexOf("@")
StopPos = email.lastIndexOf(".")
Message = ""

if (email == "") {
return false;
}

if (AtPos == -1 || StopPos == -1) {
return false;
}

if (StopPos < AtPos) {
return false;
}

if (StopPos - AtPos == 1) {
return false;
} 

return true;
}

function IsValid()
{
	/* Contact Deatails Start*/
    if (document.getElementById("txtFirstName").value == '')
    {
        alert('Please enter First Name');
        document.getElementById("txtFirstName").focus();
        return false;
    }
	if (document.getElementById("txtLastName").value == '')
    {
        alert('Please enter Last Name');
        document.getElementById("txtLastName").focus();
        return false;
    }

	if (document.getElementById("txtYourPhoneNumber").value == '')
    {
        alert('Please enter Phone Number');
        document.getElementById("txtYourPhoneNumber").focus();
        return false;
    }
	if (document.getElementById("txtEmail").value == '')
    {
        alert('Please enter Your Email');
        document.getElementById("txtEmail").focus();
        return false;
    }

    if ( CheckEmail(document.getElementById("txtEmail").value) == false )
    {
        alert('Please enter Valid Email');
        document.getElementById("txtEmail").focus();
        return false;
    } 
	if (document.getElementById("txtBillingAddress").value == '')
    {
        alert('Please enter Billing Address');
        document.getElementById("txtBillingAddress").focus();
        return false;
    }
	if (document.getElementById("txtBillingCity").value == '')
    {
        alert('Please enter Billing City');
        document.getElementById("txtBillingCity").focus();
        return false;
    }
	if (document.getElementById("cmbBillingState").value == '')
    {
        alert('Please select Billing State');
        document.getElementById("cmbBillingState").focus();
        return false;
    }
	if (document.getElementById("txtBillingZip").value == '')
    {
        alert('Please enter Billing Zip');
        document.getElementById("txtBillingZip").focus();
        return false;
    }
	
	/* Contact Deatails End*/
	
	
	/* Reservation Details Start*/

	if (document.getElementById("cmbOccasion").value == '')
    {
        alert('Please select Occasion');
        document.getElementById("cmbOccasion").focus();
        return false;
    }
	if (document.getElementById("txtPickupDate").value == '')
    {
        alert('Please enter Pick-up Date');
        document.getElementById("txtPickupDate").focus();
        return false;
    }
	if (document.getElementById("cmbHourPickUpTime").value == '')
    {
        alert('Please Select Hour');
        document.getElementById("cmbHourPickUpTime").focus();
        return false;
    }
	if (document.getElementById("cmbPickUpTime").value == '')
    {
        alert('Please Select Min');
        document.getElementById("cmbPickUpTime").focus();
        return false;
    }
	if (document.getElementById("cmbAMPMPickUpTime").value == '')
    {
        alert('Please Select AM / PM');
        document.getElementById("cmbAMPMPickUpTime").focus();
        return false;
    }
	
	if (document.getElementById("txtPickupLocation").value == '')
    {
        alert('Please enter Pick-up Location');
        document.getElementById("txtPickupLocation").focus();
        return false;
    }
	if (document.getElementById("cmbVehicleType").value == '')
    {
        alert('Please select VehicleType');
        document.getElementById("cmbVehicleType").focus();
        return false;
    }
	if (document.getElementById("txtNumberofPassengers").value == '')
    {
        alert('Please enter Number of Passengers');
        document.getElementById("txtNumberofPassengers").focus();
        return false;
    }
	
	if (document.getElementById("txtDropoffDate").value == '')
    {
        alert('Please enter Drop-off Date');
        document.getElementById("txtDropoffDate").focus();
        return false;
    }
	if (document.getElementById("cmbHourDropOffTime").value == '')
    {
        alert('Please Select Hour');
        document.getElementById("cmbHourDropOffTime").focus();
        return false;
    }
	if (document.getElementById("cmbMinutesDropOffTime").value == '')
    {
        alert('Please Select Min');
        document.getElementById("cmbMinutesDropOffTime").focus();
        return false;
    }
	if (document.getElementById("cmbAMPMDropOffTime").value == '')
    {
        alert('Please Select AM / PM');
        document.getElementById("cmbAMPMDropOffTime").focus();
        return false;
    }
	
	if (document.getElementById("txtDropoffLocation").value == '')
    {
        alert('Please enter Drop-off Location');
        document.getElementById("txtDropoffLocation").focus();
        return false;
    }
	
	
	
	/* Reservation Details End*/
	
//	alert('Thank you for contacting us. Our staff will be in touch with you soon.');
	//return true;
	
}
</script>
<script runat=server>
   
     
	private void Page_Load(object sender, System.EventArgs e)
    {
		SendMail.Attributes.Add("onClick", "return IsValid();");
		
	}

	protected void SendMail_Click(object sender, ImageClickEventArgs e)
    {
		string str = "<table  border=0 cellspacing=0 cellpadding=0 align=center>	<tr><td colspan=5><h3>Contact Information</h3></td></tr><tr><td colspan=5 height=10></td></tr><tr><td colspan=5><table  border=0 cellspacing=0 cellpadding=0>"+
"<tr><td width=40>&nbsp;</td><td width=285 align=left valign=top><table width=340 border=0 cellspacing=0 cellpadding=0><tr><td width=165><label>First Name :</label></td><td width=150>" + txtFirstName.Value +"</td></tr>"+
"<tr><td colspan=2 height=5></td></tr><tr><td width=165><label>Last Name :</label></td><td width=150>" + txtLastName.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>" +
"<tr><td width=165><label>Company:</label></td><td width=150>" + txtCompany.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Phone :</label></td><td width=150>" + txtYourPhoneNumber.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Email :</label></td><td width=150>" + txtEmail.Value + "</td></tr></table></td><td width=48>&nbsp;</td><td width=285 align=left valign=top>"+
"<table width=340 border=0 cellspacing=0 cellpadding=0><tr><td width=165><label>Billing Address :</label></td><td width=150>" + txtBillingAddress.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Billing City :</label></td><td width=150>" + txtBillingCity.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Billing State :</label></td><td width=150>" + cmbBillingState.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Billing Zip :</label></td><td width=150>" + txtBillingZip.Value + "</td></tr></table></td></tr></table></td></tr>"+
"<tr><td colspan=5><BR><h3>Reservation Information</h3></td></tr><tr><td colspan=5 height=10></td></tr><tr><td colspan=5><table  border=0 cellspacing=0 cellpadding=0><tr>"+
"<td width=40>&nbsp;</td><td width=285 align=left valign=top><table width=340 border=0 cellspacing=0 cellpadding=0>"+
"<tr><td width=165><label>Occasion :</label></td><td width=150>" + cmbOccasion.Value + "</td></tr><tr><td colspan=2 height=5></td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Occasion Other:</label></td><td width=150>" + txtOccasionOther.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Pick-up Date :</label></td><td width=150 align=left valign=top>" + txtPickupDate.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Pick-up Time :</label></td><td width=150 align=left valign=top><table width=150 border=0 cellspacing=0 cellpadding=0 align=center><tr>"+
"<td width=50 align=center><label>&nbsp;&nbsp;Hour</label><br>" + cmbHourPickUpTime.Value + "</td><td width=50 align=center><label>&nbsp;&nbsp;&nbsp;Min</label><br>" + cmbPickUpTime.Value + "</td>"+
"<td width=50 align=center><label class=time_type>AM/PM</label><br>" + cmbAMPMPickUpTime.Value + "</td></tr></table></td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Pick-up Location :</label></td><td width=150>" + txtPickupLocation.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Airline:</label></td><td width=150>" + txtAirLine.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Flight Number:</label></td><td width=150>" + txtFlightNumber.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=185><label>How Did You Find Us?:</label></td><td width=150>" + cmbHowDidYouFindUs.Value + "</td></tr></table></td> <td width=48>&nbsp;</td><td width=285 align=left valign=top><table width=340 border=0 cellspacing=0 cellpadding=0>"+
"<tr><td><label>Vehicle Type :</label></td><td width=150>" + cmbVehicleType.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=180><label>Number of Passengers :</label></td><td width=150>" + txtNumberofPassengers.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Drop-off Date :</label></td><td width=150 align=left valign=top>" + txtDropoffDate.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Drop-off Time :</label></td><td width=150 align=left valign=top><table width=150 border=0 cellspacing=0 cellpadding=0 align=center><tr>"+
"<td width=50 align=center><label>&nbsp;&nbsp;Hour</label><br>" + cmbHourDropOffTime.Value + "</td><td width=50 align=center><label>&nbsp;&nbsp;&nbsp;Min</label><br>" + cmbMinutesDropOffTime.Value + "</td>"+
"<td width=50 align=center><label class=time_type>AM/PM</label><br>" + cmbAMPMDropOffTime.Value + "</td></tr></table></td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Drop-off Location :</label></td><td width=150>" + txtDropoffLocation.Value + "</td></tr><tr><td colspan=2 height=5></td></tr>"+
"<tr><td width=165><label>Special Instructions:</label></td><td width=150>" + txtSpecialInstructions.Value + "</td></tr></table></td></tr></table></td></tr></table>";
					 
					 
		String jScript1;
		String Subject;
		
		if (txtFirstName.Value == "") {
		jScript1 = "<script language='JavaScript'>alert('Please enter First Name.')<"+"/script>";
        this.RegisterClientScriptBlock("", jScript1);
		
		}
		else
		{
		Subject="Reservation Request for " + txtFirstName.Value +" " + txtLastName.Value + " on " + txtPickupDate.Value;

      	SendEmail(txtEmail.Value, "info@adamlimodallas.com", Subject, str, "relay-hosting.secureserver.net");		
		
		String jScript;
		
		jScript = "<script language='JavaScript'>alert('Thank you for contacting us. Our staff will be in touch with you soon.');CancelClick();this.location='reservations.aspx';<"+"/script>";
        this.RegisterClientScriptBlock("", jScript);
		
		
	
		}
		
		
    }


    public void SendEmail(string strFromAddress, string strToAddress, string strSubject,
                                string strBody, string strSmtpServer)
    {
        MailMessage _msg = new MailMessage();
        _msg.BodyFormat = MailFormat.Html;
        _msg.From = strFromAddress;
        _msg.To = strToAddress;
        _msg.Subject = strSubject;
        _msg.Body = strBody;
        SmtpMail.SmtpServer = "relay-hosting.secureserver.net";   
	    SmtpMail.Send(_msg);
		
		
    }
	
</script></head>

<body>
<form action="" method="post" id="contact" runat="server">
<table width="908" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td valign="top">

    	<table width="908" border="0" cellspacing="0" cellpadding="0" align="center">
          	<tr><!--Header Starts-->
            	<td colspan="2" valign="top">
                	<table width="908" border="0" cellspacing="0" cellpadding="0">
                      	<tr>
                        	<td width="152" height="76" valign="top"><img src="images/logo.jpg" alt="" border="0" /></td>
                        	<td width="756" class="top-txt" valign="top">
                            	<p>
                                    Phone: 214-354-5148<br />
                                    Fax: 214-358-5518<br />
                                    Email: <a href="mailto:info@adamlimodallas.com">info@adamlimodallas.com</a> </p>                           
                        	</td>
                      	</tr>
                        
                        <tr>
                        	<td colspan="2" valign="middle" class="blank">
                            	<table width="780" border="0" cellspacing="0" cellpadding="0" align="center" >
                                  	<tr>
                                        <td valign="middle" align="center" class="home-unsel"><a href="index.html">Home</a></td>
                                        <td valign="middle" align="center" class="home-unsel"><a href="services.html">Services</a></td>
                                        <td valign="middle" align="center" class="home-unsel"><a href="fleet.html">Fleet</a></td>
                                        <td valign="middle" align="center" class="home-unsel"><a href="rates.html">Rates</a></td>
                                        <td valign="middle" align="center" class="pg-sel"><SPAN>Reservations</SPAN></td>
                                        <td valign="middle" align="center" class="pg-unsel"><a href="contact.html">Contact</a></td>
                                  	</tr>
                                </table>
                        	</td>
                        </tr>
                        <tr>
                        	<td colspan="2" valign="top" class="hdr-imgs">
								<p><img src="images/hdr-img1.jpg" alt="" border="0" /><img src="images/hdr-img2.jpg" alt="" border="0" /></p>                            
                            </td>
                        </tr>
                    </table>
            	</td>
          	</tr><!--Header Ends-->
            
            <tr><!--Body Starts-->
            	<td colspan="2" valign="top" class="body-bg">
                	<table width="908" border="0" cellspacing="0" cellpadding="0">
                      	<tr>
                        	<td valign="top" class="body-txt">
                            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                	<tr>
                                    	<td width="658" align="left" valign="top">
                                        	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                              	<tr>
                                                	<td colspan="5">
                                                    	<h2> Reservations</h2>
                                          <p>
                                                            Please fill out the form below to place a reservation or call us directly at 214-354-5148</p>
                                                  <p><em>* Indicates required field</em></p></td>
                                                </tr>
                                                <tr>
                                                	<td colspan="5"><h3>Contact Information</h3></td>
                                                </tr>
                                                <tr>
                                    				<td colspan="5" height="10"></td>
                           				  	  	</tr>
                                                <tr>
                                                	<td colspan="5">
                                                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          	<tr>
                                                                <td width="40">&nbsp;</td>
                                                              	
                                                                <td width="285" align="left" valign="top"><!--Left Table Starts-->
                                                                
                                                                	<table width="285" border="0" cellspacing="0" cellpadding="0">
                                                                      	<tr>
                                                                        	<td width="135"><label>First Name <span>*</span>:</label></td>
                                                                        	<td width="150"><input type="text" runat="server" name="txtFirstName" id="txtFirstName" class="txtfld" style="width:150px" /></td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Last Name <span>*</span>:</label></td>
                                                                            <td width="150"><input type="text" runat="server" name="txtLastName" id="txtLastName" class="txtfld" style="width:150px" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Company:</label></td>
                                                                            <td width="150"><input type="text" runat="server" name="txtCompany" id="txtCompany" class="txtfld" style="width:150px" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                       <tr>
                                                                        	<td width="135"><label>Phone <span>*</span>:</label></td>
                                                                            <td width="150"><input type="text" runat="server" name="txtYourPhoneNumber" id="txtYourPhoneNumber" class="txtfld" style="width:150px" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Email <span>*</span>:</label></td>
                                                                            <td width="150"><input type="text" runat="server" name="txtEmail" id="txtEmail" class="txtfld" style="width:150px" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    
                                                                </td><!--Left Table Ends-->
                                                                
                                                                <td width="48">&nbsp;</td>
                                                                
                                                                <td width="285" align="left" valign="top"><!--Right Table Starts-->
                                                                
                                                                <table width="285" border="0" cellspacing="0" cellpadding="0">
                                                                      	<tr>
                                                                        	<td width="135"><label>Billing Address <span>*</span>:</label></td>
                                                                        	<td width="150"><textarea runat="server" name="txtBillingAddress" id="txtBillingAddress" cols="30" rows="5" style="width:150px; height:48px"></textarea></td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Billing City <span>*</span>:</label></td>
                                                                        	<td width="150"><input type="text" runat="server" name="txtBillingCity" id="txtBillingCity" class="txtfld" style="width:150px" /></td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Billing State <span>*</span>:</label></td>
                                                                        	<td width="150">
                                                                            	<select name="cmbBillingState" id="cmbBillingState" runat="server" style="width:150px">
                                                                                    <option value="">Select State</option>
                                                                                    <option value="AL">Alabama</option>
                                                                                    <option value="AK">Alaska</option>
                                                                                    <option value="AZ">Arizona</option>
                                                                                    <option value="AR">Arkansas</option>
                                                                                    <option value="CA">California</option>
                                                                                    <option value="CO">Colorado</option>
                                                                                    <option value="CT">Connecticut</option>
                                                                                    <option value="DE">Delaware</option>
                                                                                    <option value="DC">District of Columbia</option>
                                                                                    <option value="FL">Florida</option>
                                                                                    <option value="GA">Georgia</option>
                                                                                    <option value="HI">Hawaii</option>
                                                                                    <option value="ID">Idaho</option>
                                                                                    <option value="IL">Illinois</option>
                                                                                    <option value="IN">Indiana</option>
                                                                                    <option value="IA">Iowa</option>
                                                                                    <option value="KS">Kansas</option>
                                                                                    <option value="KY">Kentucky</option>
                                                                                    <option value="LA">Louisiana</option>
                                                                                    <option value="ME">Maine</option>
                                                                                    <option value="MD">Maryland</option>
                                                                                    <option value="MA">Massachusetts</option>
                                                                                    <option value="MI">Michigan</option>
                                                                                    <option value="MN">Minnesota</option>
                                                                                    <option value="MS">Mississippi</option>
                                                                                    <option value="MO">Missouri</option>
                                                                                    <option value="MT">Montana</option>
                                                                                    <option value="N/A">National</option>
                                                                                    <option value="NE">Nebraska</option>
                                                                                    <option value="NV">Nevada</option>
                                                                                    <option value="NH">New Hampshire</option>
                                                                                    <option value="NJ">New Jersey</option>
                                                                                    <option value="NM">New Mexico</option>
                                                                                    <option value="NY">New York</option>
                                                                                    <option value="NC">North Carolina</option>
                                                                                    <option value="ND">North Dakota</option>
                                                                                    <option value="OH">Ohio</option>
                                                                                    <option value="OK">Oklahoma</option>
                                                                                    <option value="OR">Oregon</option>
                                                                                    <option value="Other">Other</option>
                                                                                    <option value="PA">Pennsylvania</option>
                                                                                    <option value="PR">Puerto Rico</option>
                                                                                    <option value="RI">Rhode Island</option>
                                                                                    <option value="SC">South Carolina</option>
                                                                                    <option value="SD">South Dakota</option>
                                                                                    <option value="TN">Tennessee</option>
                                                                                    <option value="TX">Texas</option>
                                                                                    <option value="UT">Utah</option>
                                                                                    <option value="VT">Vermont</option>
                                                                                    <option value="VA">Virginia</option>
                                                                                    <option value="WA">Washington</option>
                                                                                    <option value="WV">West Virginia</option>
                                                                                    <option value="WI">Wisconsin</option>
                                                                                    <option value="WY">Wyoming</option>
                                                                                 </select>
                                                                            </td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Billing Zip <span>*</span>:</label></td>
                                                                        	<td width="150"><input type="text" runat="server" name="txtBillingZip" id="txtBillingZip" class="txtfld" style="width:150px" /></td>
                                                                      	</tr>
                                                                    </table><!--Right Table Ends-->
                                                                    
                                                                </td>
                                                                
                                                       	  </tr>
                                                        </table>
                                                  </td>
                                                </tr>
                                                <tr>
                                                	<td colspan="5"><h3>Reservation Information</h3></td>
                                                </tr>
                                                <tr>
                                    				<td colspan="5" height="10"></td>
                           				  	  	</tr>
                                                <tr>
                                                	<td colspan="5">
                                                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          	<tr>
                                                                <td width="40">&nbsp;</td>
                                                              	
                                                                <td width="285" align="left" valign="top"><!--Left Table Starts-->
                                                                
                                                                	<table width="285" border="0" cellspacing="0" cellpadding="0">
                                                                      	<tr>
                                                                        	<td width="135"><label>Occasion <span>*</span>:</label></td>
                                                                        	<td width="150">
                                                                                <select name="cmbOccasion" id="cmbOccasion" style="width:150px" runat="server">
                                                                                    <option value="">Choose Occasion</option>
                                                                                    <option value="Airport Transfer">Airport Transfer</option>
                                                                                    <option value="Corporate Event">Corporate Event</option>
                                                                                    <option value="Wedding">Wedding</option>
                                                                                    <option value="Prom / School Related">Prom / School Related</option>
                                                                                    <option value="La Quinceanera">La Quinceanera</option>
                                                                                    <option value="Holiday Tour">Holiday Tour</option>
                                                                                    <option value="Corporate Event">Corporate Event</option>
                                                                                    <option value="Shopping">Shopping</option>
                                                                                    <option value="Sightseeing">Sightseeing</option>
                                                                                    <option value="Sporting / Concert Event">Sporting / Concert Event</option>
                                                                                    <option value="Point to Point">Point to Point</option>
                                                                                    <option value="Other">Other</option>
                                                                                </select>
                                                                        	</td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"></td>
                                                                            <td width="150"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Occasion Other:</label></td>
                                                                            <td width="150"><input type="text" runat="server" name="txtOccasionOther" id="txtOccasionOther" class="txtfld" style="width:150px" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                       <tr>
                                                                        	<td width="135"><label>Pick-up Date <span>*</span>:</label></td>
                                                                            <td width="150" align="left" valign="top">
                                                                            	<table width="150" border="0" cellspacing="0" cellpadding="0">
                                                                                  	<tr>
                                                                                        <td width="130" align="left"><input type="text" runat="server" name="txtPickupDate" id="txtPickupDate" class="txtfld" style="width:128px" /></td>
                                                                                        <td width="20" onclick="forceVisible()" align="right"><img id="imgH1" title="Date selector" style="cursor: pointer;"  src="images/cal.gif"  name="imgH1" alt="" border="0" />
																							<script type="text/javascript">							
                                                                                                Calendar.setup({
                                                                                                inputField     :    "txtPickupDate",    
                                                                                                ifFormat       :    "%m/%d/%Y",       
                                                                                                showsTime      :    false,            
                                                                                                button         :    "imgH1",   
                                                                                                singleClick    :    true,           
                                                                                                step           :    1        
                                                                                                });
                                                                                            </script>
                                                                                    	</td>
                                                                                  	</tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Pick-up Time <span>*</span>:</label></td>
                                                                            <td width="150" align="left" valign="top">
                                                                            	<table width="150" border="0" cellspacing="0" cellpadding="0" align="center">
                                                                                  	<tr>
                                                                                        <td width="45" align="left">
                                                                                        	<label class="hour"><b>Hour</b></label><br />
                                                                                        	<select name="cmbHourPickUpTime" id="cmbHourPickUpTime" style="width:45px" runat="server">
                                                                                                <option value="">-</option>
                                                                                                <option value="1">1</option>
                                                                                                <option value="2">2</option>
                                                                                                <option value="3">3</option>
                                                                                                <option value="4">4</option>
                                                                                                <option value="5">5</option>
                                                                                                <option value="6">6</option>
                                                                                                <option value="7">7</option>
                                                                                                <option value="8">8</option>
                                                                                                <option value="9">9</option>
                                                                                                <option value="10">10</option>
                                                                                                <option value="11">11</option>
                                                                                                <option value="12">12</option>
                                                                                            </select>
                                                                                        </td>
                                                                                        <td width="45" align="center">
                                                                                        	<label><b>&nbsp;&nbsp;&nbsp;&nbsp;Min</b></label><br />
                                                                                        	<select name="cmbPickUpTime" id="cmbPickUpTime" style="width:45px" runat="server">
                                                                                                <option value="">-</option>
                                                                                                <option value="00">00</option>
                                                                                                <option value="15">15</option>
                                                                                                <option value="30">30</option>
                                                                                                <option value="45">45</option>
                                                                                          </select>
                                                                                        </td>
                                                                                        <td width="50" align="right">
                                                                                        <label class="time_type"><b>AM/PM</b></label><br />
                                                                                        	<select name="cmbAMPMPickUpTime" id="cmbAMPMPickUpTime" style="width:50px" runat="server">
                                                                                                <option value="">-</option>
                                                                                                <option value="AM">AM</option>
                                                                                                <option value="PM">PM</option>
                                                                                            </select>
                                                                                        </td>
                                                                                  	</tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Pick-up Location <span>*</span>:</label></td>
                                                                        	<td width="150"><textarea runat="server" name="txtPickupLocation" id="txtPickupLocation" cols="30" rows="5" style="width:150px; height:48px"></textarea></td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Airline:</label></td>
                                                                        	<td width="150"><input type="text" runat="server" name="txtAirLine" id="txtAirLine" class="txtfld" style="width:150px" /></td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Flight Number:</label></td>
                                                                        	<td width="150"><input type="text" runat="server" name="txtFlightNumber" id="txtFlightNumber" class="txtfld" style="width:150px" /></td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>How Did You Find Us?:</label></label></td>
                                                                        	<td width="150">
                                                                            	<select name="cmbHowDidYouFindUs" id="cmbHowDidYouFindUs" style="width:150px" runat="server">
                                                                                    <option value="">Choose One</option>
                                                                                    <option value="Google">Google</option>
                                                                                    <option value="Yahoo">Yahoo</option>
                                                                                    <option value="Other Internet Search">Other Internet Search</option>
                                                                                    <option value="Yellow Pages">Yellow Pages</option>
                                                                                    <option value="Print Advertisements">Print Advertisement</option>
                                                                                    <option value="Brochure">Brochure</option>
                                                                                    <option value="Hotel">Hotel</option>
                                                                                    <option value="Referral">Referral</option>
                                                                                    <option value="Other">Other</option>
                                                                                  </select>
                                                                            </td>
                                                                      	</tr>
                                                                    </table>
                                                                    
                                                                </td><!--Left Table Ends-->
                                                                
                                                                <td width="48">&nbsp;</td>
                                                                
                                                                <td width="285" align="left" valign="top"><!--Right Table Starts-->
                                                                
                                                                <table width="285" border="0" cellspacing="0" cellpadding="0">
                                                                      	<tr>
                                                                        	<td width="135"><label>Vehicle Type <span>*</span>:</label></td>
                                                                        	<td width="150">
                                                                            	<select name="cmbVehicleType" id="cmbVehicleType" style="width:150px" runat="server">
                                                                                    <option value="">Choose Vehicle Type</option>
                                                                                    <option value="Sedan">Sedan</option>
                                                                                    <option value="Van">Van</option>
                                                                                    <option value="SUV">SUV</option>
                                                                                    <option value="Limousine">Limousine</option>
                                                                                    <option value="SUV Limousine">SUV Limousine</option>
                                                                                    <option value="Minibus">Minibus</option>
                                                                                  </select>
                                                                            </td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Number of Passengers <span>*</span>:</label></label></td>
                                                                        	<td width="150"><input type="text" runat="server" name="txtNumberofPassengers" id="txtNumberofPassengers" class="txtfld" style="width:150px" /></td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Drop-off Date <span>*</span>:</label></td>
                                                                            <td width="150" align="left" valign="top">
                                                                            	<table width="150" border="0" cellspacing="0" cellpadding="0">
                                                                                  	<tr>
                                                                                        <td width="130" align="left"><input type="text" runat="server" name="txtDropoffDate" id="txtDropoffDate" class="txtfld" style="width:128px" /></td>
                                                                                        <td width="20" onclick="forceVisible()" align="right"><img id="imgH2" title="Date selector" style="cursor: pointer;"  src="images/cal.gif"  name="imgH2" alt="" border="0" />
																							<script type="text/javascript">							
                                                                                                Calendar.setup({
                                                                                                inputField     :    "txtDropoffDate",    
                                                                                                ifFormat       :    "%m/%d/%Y",       
                                                                                                showsTime      :    false,            
                                                                                                button         :    "imgH2",   
                                                                                                singleClick    :    true,           
                                                                                                step           :    1        
                                                                                                });
                                                                                            </script>
                                                                                    	</td>
                                                                                  	</tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Drop-off Time <span>*</span>:</label></td>
                                                                            <td width="150" align="left" valign="top">
                                                                            	<table width="150" border="0" cellspacing="0" cellpadding="0" align="center">
                                                                                  	<tr>
                                                                                        <td width="45" align="left">
                                                                                        	<label class="hour"><b>Hour</b></label><br />
                                                                                        	<select name="cmbHourDropOffTime" id="cmbHourDropOffTime" style="width:45px" runat="server">
                                                                                                <option value="">-</option>
                                                                                                <option value="1">1</option>
                                                                                                <option value="2">2</option>
                                                                                                <option value="3">3</option>
                                                                                                <option value="4">4</option>
                                                                                                <option value="5">5</option>
                                                                                                <option value="6">6</option>
                                                                                                <option value="7">7</option>
                                                                                                <option value="8">8</option>
                                                                                                <option value="9">9</option>
                                                                                                <option value="10">10</option>
                                                                                                <option value="11">11</option>
                                                                                                <option value="12">12</option>
                                                                                            </select>
                                                                                        </td>
                                                                                        <td width="45" align="center">
                                                                                        	<label><b>&nbsp;&nbsp;&nbsp;&nbsp;Min</b></label><br />
                                                                                        	<select name="cmbMinutesDropOffTime" id="cmbMinutesDropOffTime" style="width:45px" runat="server">
                                                                                                <option value="">-</option>
                                                                                                <option value="00">00</option>
                                                                                                <option value="15">15</option>
                                                                                                <option value="30">30</option>
                                                                                                <option value="45">45</option>
                                                                                          </select>
                                                                                        </td>
                                                                                        <td width="50" align="right">
                                                                                        <label class="time_type"><b>AM/PM</b></label><br />
                                                                                        	<select name="cmbAMPMDropOffTime" id="cmbAMPMDropOffTime" style="width:50px" runat="server">
                                                                                                <option value="">-</option>
                                                                                                <option value="AM">AM</option>
                                                                                                <option value="PM">PM</option>
                                                                                            </select>
                                                                                        </td>
                                                                                  	</tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Drop-off Location  <span>*</span>:</label></td>
                                                                        	<td width="150"><textarea runat="server" name="txtDropoffLocation" id="txtDropoffLocation" cols="30" rows="5" style="width:150px; height:48px"></textarea></td>
                                                                      	</tr>
                                                                        <tr>
                                                                        	<td colspan="2" height="5"></td>
                                                                        </tr>
                                                                        <tr>
                                                                        	<td width="135"><label>Special Instructions:</label></td>
                                                                        	<td width="150"><textarea runat="server" name="txtSpecialInstructions" id="txtSpecialInstructions" cols="30" rows="5" style="width:150px; height:80px"></textarea></td>
                                                                      	</tr>
                                                                        
                                                                    </table><!--Right Table Ends-->
                                                                    
                                                                </td>
                                                                
                                                       	  </tr>
                                                        </table>
                                                  </td>
                                                </tr>
                                                <tr>
                                                	<td colspan="5" height="10"></td>
                                                </tr>
                                                <tr>
                                    				<td colspan="5" align="right"><input type="image" onClick="return CancelClick();" src="images/clear-btn.jpg" />&nbsp;&nbsp;
																	<asp:ImageButton ID="SendMail" OnClick="SendMail_Click" runat="server" ImageUrl="images/book-btn.jpg"/></td>
                           				  	  	</tr>
                                                 <tr>
                                                	<td colspan="5" height="10"></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="250" valign="top">
                                        	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                              	<tr>
                                                	<td width="10"></td>
                                                	<td>
                                                    	<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center" class="body-right-area1">
                                                            <tr>
                                                                <td align="left" valign="top"><h4 class="rDet">Note:</h4></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top">
                                                                	<p class="cDet">
                                                                    	1. If you would like to schedule a pickup in the next 24 hours please call <b>214-354-5148</b>. 
                                                                    </p>
                                                                    <p class="cDet">
                                                                    	2. After your reservation is submitted, an Adam Limousine representative will email or call with a price quote and confirmation. A credit card is required to hold a reservation; a deposit in the amount of 25% of the trip cost can be accepted in lieu of credit card information. 
                                                                    </p>
                                                                    <p class="cDet">
                                                                    	3. Full payments will be collected at the pickup.   
                                                                    </p>
                                                                    <p class="cDet">
                                                                    	4. Cancellation policy as follows unless otherwise specified;<br /><br />
																		&nbsp;&nbsp;&nbsp;&nbsp;a. Limos & Buses - Reservations &nbsp;&nbsp;&nbsp;&nbsp;cancelled less than 72 hours prior to &nbsp;&nbsp;&nbsp;&nbsp;pickup are non-refundable<br /><br />
																		&nbsp;&nbsp;&nbsp;&nbsp;b. Sedans &shy; Reservations cancelled &nbsp;&nbsp;&nbsp;&nbsp;less than 6 hours prior to pickup are &nbsp;&nbsp;&nbsp;&nbsp;non-refundable
 
                                                                    </p>
                                                                    <p class="cDet">
                                                                    	5. In the case that a passenger does not show up for the confirmed reservation, there will be a charge equal to a full amount of the trip. 
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td height="25"></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                              	</tr>
                                            </table>
                                        </td>
                            		</tr>
                            	</table>
                        	</td>
                       	</tr>
                    </table>                
           	  </td>
            </tr><!--Body Ends-->
            
            <tr><!--Footer Starts-->
            	<td width="568" height="50" valign="middle" class="footer-nav"><p><a href="index.html">Home</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="fleet.html">Services</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="fleet.html">Fleet</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="rates.html">Rates</a>&nbsp;&nbsp;|&nbsp;&nbsp;<span>Reservations</span>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="contact.html">Contact</a></p></td>
                <td width="340" valign="middle" class="footer-copy" align="right">
                	<p>
                    	All rights are reserved, <span>Adam Limousine Service</span><br />
                        Designed &amp; Developed by <a href="http://www.logoinn.com" target="_blank">Logoinn</a>
                    </p>
                </td>
            </tr><!--Footer Ends-->
        </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>
