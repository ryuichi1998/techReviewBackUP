<%--
  Created by IntelliJ IDEA.
  User: liyun
  Date: 10/12/16
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@page import="Entity.*" %>
<head>
    <title>My Profile</title>
    <%@include file="common/html/commonLinks.html" %>
    <%--<link rel="stylesheet" href="css/profile.css">--%>
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

<body class="hold-transition skin-blue layout-boxed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/doctorNavigation.jsp" %>

    <%--Content Wrapper    --%>
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
                                <img class="profile-bg-image" src="common/images/profile-background.jpg">
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
                    <div class="col-md-2">

                    </div>
                    <%--/.clear the way--%>
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-10">
                                <h3 class="profile-username"><strong>Chia Li Yun</strong></h3>
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
                                            <div class="col-md-6">
                                                <span class="info-box-icon bg-blue"><i class="ion ion-ios-person"></i></span>
                                                <div class="info-box-content">
                                                    <span>NRIC</span>
                                                    <br>
                                                    <strong id="nric">S989236256d</strong>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <span class="info-box-icon bg-blue"><i class="ion ion-ios-calendar"></i></span>
                                                <div class="info-box-content">
                                                    <span>Date of Birth</span>
                                                    <br>
                                                    <strong id="date-of-birth">23 November 1934</strong>
                                                </div>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <span class="info-box-icon bg-blue"><i class="ion ion-ios-location"></i></span>
                                                <div class="info-box-content">
                                                    <span>Address</span>
                                                    <br>
                                                    <strong id="address">Block 533 Serangoon North Avenue 5 Singapore 550512
                                                        #08-321</strong>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--/.first half--%>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <span class="info-box-icon bg-blue"><i class="ion ion-android-call"></i></span>
                                                <div class="info-box-content">
                                                    <span>Phone Number</span>
                                                    <br>
                                                    <strong id="phone-num">515932369</strong>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <span class="info-box-icon bg-blue"><i class="ion ion-ios-email"></i></span>
                                                <div class="info-box-content">
                                                    <span>Email Address</span>
                                                    <br>
                                                    <strong id="email">chia@gmail.com</strong>
                                                </div>
                                            </div>
                                        </div>
                                        <%--/.row--%>

                                        <hr>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <span class="info-box-icon bg-blue"><i class="ion ion-ios-flag"></i></span>
                                                <div class="info-box-content">
                                                    <span>Citizenship</span>
                                                    <br>
                                                    <strong id="citizenship">Singapore</strong>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <span class="info-box-icon bg-blue"><i class="ion ion-earth"></i></span>
                                                <div class="info-box-content">
                                                    <span>Language</span>
                                                    <br>
                                                    <strong id="language">English</strong>
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
    <%--/.Content--%>


</div>
<%--/.Content Wrapper--%>

<%--Footer--%>
<%@include file="common/html/footer.html" %>

<!-- Add the sidebar's background. This div must be placed
immediately after the control sidebar -->
<div class="control-sidebar-bg"></div>

</div>

</body>
</html>
