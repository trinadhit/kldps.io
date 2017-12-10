<%@ Page Title="" Language="C#" MasterPageFile="~/EduMaster.master" AutoEventWireup="true" CodeFile="ReachUs.aspx.cs" Inherits="ReachUs" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <link href="css/buttoncss.css" rel="stylesheet" type="text/css" />
        <title></title>

    </head>
    <body>
        <form action="ReachUs.aspx">
            <section id="contact-info">
     <br /> <br />  
        <div class="center">                
            <h2>How to Reach Us?</h2>
            <%--<p class="lead">Get In Touch. More Bootstrap Templates will Update soon only for dot.net users...</p>--%>
     
        </div>
        <div class="gmap-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-5 text-center">
                        <div class="gmap">
                            <%--<iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=JoomShaper,+Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=joomshaper&amp;sll=37.0625,-95.677068&amp;sspn=42.766543,80.332031&amp;ie=UTF8&amp;hq=JoomShaper,&amp;hnear=Dhaka,+Dhaka+Division,+Bangladesh&amp;ll=23.73854,90.385504&amp;spn=0.001515,0.002452&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=1073661719450182870&amp;output=embed"></iframe>--%>
                          <iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15301.652129025266!2d81.290307!3d16.505233!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xfe3e758b0dfa308a!2sKalidindi+public+school!5e0!3m2!1sen!2sin!4v1499533838560" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div class="col-sm-7 map-content">
                        <ul class="row">
                            <li class="col-sm-6">
                                <address>
                                    <h5>School Address</h5>
                                    <p>Bhimavaram Road <br>
                                   Door No:8/89/1, Kalidindi,</p>
                                    <p>Andhra Pradesh, 521344</p>
                                    <p>Phone: 09347712208 <br>
                                    www.kalidindipublicschool.com</p>
                                </address>

                                <%--<address>
                                    <h5>Zone2 Office</h5>
                                    <p>4587 Hitech Street <br>
                                    HYD, DS 75864</p>
                                    <p>Phone:123-456-7894 <br>
                                    Email Address:info@strap.com</p>
                                </address>--%>
                            </li>


                           <%-- <li class="col-sm-6">
                                <address>
                                    <h5>Zone1 Office</h5>
                                   <p>4587 Hitech Street <br>
                                    HYD, DS 75864</p>
                                    <p>Phone:123-456-7894 <br>
                                    Email Address:info@strap.com</p>
                                </address>

                                <address>
                                    <h5>Zone3 Office</h5>
                                  <p>4587 Hitech Street <br>
                                    HYD, DS 75864</p>
                                    <p>Phone:123-456-7894 <br>
                                    Email Address:info@strap.com</p>
                                </address>
                            </li>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
        </form>
    </body>
        </html>
</asp:Content>

