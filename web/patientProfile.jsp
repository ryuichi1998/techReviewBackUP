<%--
  Created by IntelliJ IDEA.
  User: liyun
  Date: 10/12/16
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Profile</title>
    <%@include file="common/html/commonLinks.html" %>
    <link rel="stylesheet" href="css/profile.css">
</head>
<%@include file="common/html/scripts.html" %>

<%@page import="Entity.*" %>
<%
    Person person = (Person) session.getAttribute("person");
%>

<body class="hold-transition skin-blue layout-boxed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/patientNavigation.jsp" %>

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

        <section class="content">


            <div class="row">
                <div class="col-md-2" id="profileHeadDiv">
                    <img src="common/images/defaultIcon.png" id="profileImage" style="max-width: 100%">
                </div>
                <div class="col-md-10">
                    <h2><%=person.getName().toUpperCase()%>
                    </h2>

                    <div class="row">
                        <div class="col-md-4 table-responsive">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td><strong>
                                        <i class="fa fa-calendar-o"></i>
                                        <span><%=request.getAttribute("age")%></span>

                                    </strong></td>
                                    <td><strong>
                                        <%
                                            String gender = person.getGender();
                                            if (gender.equalsIgnoreCase("female")) {
                                        %>
                                        <i class="fa fa-female text-center"></i>
                                        <%
                                        } else {
                                        %>
                                        <i class="fa fa-male"></i>
                                        <%
                                            }
                                        %>
                                    </strong></td>
                                </tr>
                                </tbody>
                            </table>
                            <%--<strong>--%>
                            <%--<i class="fa fa-calendar-o"></i>--%>
                            <%--<span><%=request.getAttribute("age")%></span>--%>

                            <%--</strong>--%>

                            <%--<strong>--%>
                            <%--<%--%>
                            <%--String gender = person.getGender();--%>
                            <%--if (gender.equalsIgnoreCase("female")) {--%>
                            <%--%>--%>
                            <%--<i class="fa fa-female"></i>--%>
                            <%--<%--%>
                            <%--} else {--%>
                            <%--%>--%>
                            <%--<i class="fa fa-male"></i>--%>
                            <%--<%--%>
                            <%--}--%>
                            <%--%>--%>
                            <%--</strong>--%>

                            <%--<%--%>
                            <%--if (!isPatient) {--%>
                            <%--%>--%>
                            <%--<strong>--%>
                            <%--<span><%=staff.getType()%></span>--%>
                            <%--</strong>--%>
                            <%--<%--%>
                            <%--}--%>
                            <%--%>--%>
                        </div>
                        <%--./col-md-12--%>
                    </div>
                    <%--./row--%>

                </div>
            </div>
            <%--./row--%>


            <div class="row">
                <div class="col-md-12" id="profile-div">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">My Details</h3>
                        </div>
                        <div class="box-body">
                            <dl>

                                <dt>
                                    NRIC:
                                </dt>
                                <dd>
                                    <%=person.getNric()%>
                                </dd>

                                <dt>Phone No:</dt>
                                <dd><%=person.getPhoneNumber()%>
                                </dd>

                                <dt>Email:</dt>
                                <dd><%=person.getEmail()%>
                                </dd>

                                <dt>Citizenship:</dt>
                                <dd><%=person.getCitizenship()%>
                                </dd>

                                <dt>Langauge:</dt>
                                <dd><%=person.getLanguage()%>
                                </dd>

                            </dl>

                        </div>
                        <%--./box-body--%>
                    </div>
                    <%--./box--%>
                </div>
                <%--./col-12--%>
            </div>
            <%--end of details row--%>

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
