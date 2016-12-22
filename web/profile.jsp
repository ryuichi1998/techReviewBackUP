<%--
  Created by IntelliJ IDEA.
  User: chial
  Date: 6/11/2016
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%@page import="Entity.*" %>
<%@ page import="Utils.DateFormatter" %>

<head>
    <title>My Profile</title>
    <%@include file="common/html/commonLinks.html" %>
    <link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<%@include file="common/html/scripts.html" %>
<%
    Person person = (Person) session.getAttribute("person");
    Character personType = ((String) session.getAttribute("id")).charAt(0);
    Boolean isPatient = false;
    if (personType == 'P') {
        isPatient = true;
    } else {
        isPatient = false;
    }
%>
<style>
    .nav-pills > li.active > a {
        border-radius: 4px;
    }

    .profile-header {
        max-height: 20%;
        max-width: 100%;
    }

    .profile-header .profile-bg .profile-bg-image {
        object-fit: contain;
        width: 100%;
        height: 100%;
    }

    .profile-avatar {
        max-width: 28%;
        max-height: 28%;
        z-index: 2;
        top: 20%;
        left: 6%;
        position: absolute;
        transition: bottom .3s;
    }

    .profile-avatar .profile-avatar-placeholder {
        background: #ffffff;
        border: 4px solid #d2d6de;
        border-radius: 50%;
        box-shadow: 0 1px 1px rgba(136, 153, 166, 0.15);
    }

    .profile-avatar .profile-avatar-placeholder .profile-avatar-image {
        max-width: 100%;
        max-height: 100%;
    }

    .profile-nav {
        padding-top: 2%;
    }
</style>
<script>
    $(document).ready(function () {
        $("#edit-profile-btn").click(function () {
            $("#nric").replaceWith("<input class='form-control' placeholder='NRIC' value='<%=person.getNric()%>'>");
            $("#email").replaceWith("<input type='email' class='form-control' placeholder='Email' value='<%=person.getEmail()%>'>");
            $('#phone-num').replaceWith("<input type='number' class='form-control' placeholder='Phone Number' value='<%=person.getPhoneNumber()%>'>");
            $("#address").replaceWith("<textarea class='form-control' rows='2' placeholder='Address'><%=person.getAddress()%></textarea>");
            $("#language").replaceWith("<select class='form-control'>" +
                "<option>English</option>" +
                "<option>Chinese</option>" +
                "<option>Malay</option>" +
                "<option>Indian</option>" +
                "</select>");
            $("#citizenship").replaceWith("<input class='form-control' placeholder='Citizenship' value='<%=person.getCitizenship()%>'>");
            $("#date-of-birth").replaceWith("<input class='form-control' id='date-of-birth-picker' data-provide='datepicker'>");
            $("#profile-details-box").append("<div class='box-footer'>" +
                "<button type='submit' class='btn btn-default'>Cancel</button>" +
                "<button type='submit' class='btn btn-primary pull-right'>Update</button></div>");
        });

        $("#language").val("<%=person.getLanguage()%>");

        //Date-of-birth-picker settings
        $('#date-of-birth-picker').datepicker({
            autoclose: true,
            format: 'dd M yyyy'
        });
        $('#date-of-birth-picker').datepicker().datepicker('setDate', 'new Date()');

    });

</script>


<!-- ADD THE CLASS layout-boxed TO GET A BOXED LAYOUT -->
<body class="hold-transition skin-blue fixed sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <%@include file="common/html/doctorNavigation.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <%--Content Header--%>
        <section class="content-header">
            <h1>
                My Profile
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Profile</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <!--header statistic-->
        <section class="content">

            <div class="row">
                <div class="col-md-12">
                    <div class="profile-header">
                        <div class="profile-bg">
                            <%--<img class="profile-bg-image" src="common/images/profile-background.jpg">--%>
                            <img class="profile-bg-image" src="common/images/images.jpeg">
                            <div class="profile-avatar">
                                <div class="profile-avatar-placeholder">
                                    <img class="profile-avatar-image" src="common/images/defaultIcon.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--/.header--%>

            <div class="row profile-nav">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-10">
                            <h3 class="profile-username"><strong><%=person.getName()%>
                            </strong></h3>
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-block btn-primary pull-right" id="edit-profile-btn">
                                Edit Profile
                            </button>
                        </div>
                    </div>
                </div>
                <%--/.name edit col--%>
            </div>
            <%--/.name and edit row--%>

            <div class="row">

                <div class="col-md-12">
                    <div class="box" id="profile-details-box">
                        <div class="box-header with-border">
                            <h3 class="box-title">My Details</h3>
                        </div>
                        <%--/.box-header--%>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <span class="info-box-icon bg-blue"><i
                                                    class="ion ion-ios-person"></i></span>
                                            <div class="info-box-content">
                                                <span>NRIC</span>
                                                <br>
                                                <strong id="nric"><%=person.getNric()%>
                                                </strong>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <span class="info-box-icon bg-blue"><i
                                                    class="ion ion-ios-calendar"></i></span>
                                            <div class="info-box-content">
                                                <span>Date of Birth</span>
                                                <br>
                                                <strong id="date-of-birth"><%=DateFormatter.convertToDisplayDate(person.getDateOfBirth())%>
                                                </strong>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <span class="info-box-icon bg-blue"><i
                                                    class="ion ion-ios-location"></i></span>
                                            <div class="info-box-content">
                                                <span>Address</span>
                                                <br>
                                                <strong id="address"><%=person.getAddress()%>
                                                </strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--/.first half--%>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">

                                            <span class="info-box-icon bg-blue"><i
                                                    class="ion ion-android-call"></i></span>
                                            <div class="info-box-content">
                                                <span>Phone Number</span>
                                                <br>
                                                <strong id="phone-num"><%=person.getPhoneNumber()%>
                                                </strong>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <span class="info-box-icon bg-blue"><i
                                                    class="ion ion-ios-email"></i></span>
                                            <div class="info-box-content">
                                                <span>Email Address</span>
                                                <br>
                                                <strong id="email"><%=person.getEmail()%>
                                                </strong>
                                            </div>
                                        </div>
                                    </div>
                                    <%--/.row--%>

                                    <hr>

                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <span class="info-box-icon bg-blue"><i class="ion ion-ios-flag"></i></span>
                                            <div class="info-box-content">
                                                <span>Citizenship</span>
                                                <br>
                                                <strong id="citizenship"><%=person.getCitizenship()%>
                                                </strong>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <span class="info-box-icon bg-blue"><i class="ion ion-earth"></i></span>
                                            <div class="info-box-content">
                                                <span>Language</span>
                                                <br>
                                                <strong id="language"><%=person.getLanguage()%>
                                                </strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--/.2nd half--%>
                            </div>
                        </div>
                        <%--/.box-body--%>
                    </div>
                </div>

            </div>
            <%--/.details row--%>

        </section>

        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <%@include file="common/html/footer.html" %>

    <!-- Add the sidebar's background. This div must be placed
   immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

</body>

</html>
