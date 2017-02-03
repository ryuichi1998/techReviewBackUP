<%--
  Created by IntelliJ IDEA.
  User: qingyutan
  Date: 2/2/17
  Time: 10:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    Faq article = (Faq) request.getAttribute("article");

%>
<head>
    <title>View Article <%= article.getSubject() %> Details</title>
    <%@include file="common/html/commonLinks.html" %>
</head>
<%@include file="common/html/scripts.html" %>



<body class="hold-transition skin-blue fixed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/nurseNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
               View article:  <%= article.getSubject() %>
                <small> <%= article.getShortdesc() %> </small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Article details</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content">
            <div class="row">

                <div class="col col-md-12">
                    <!-- general form elements -->


                        <!-- /.box-header -->

                            <div class="box-body">

                                <div class="col-sm-12">

                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">Subject title: <%= article.getSubject() %></h3>

                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body no-padding">
                                            <div class="mailbox-read-info">
                                                <h3 class="box-title">Brief description: <%= article.getShortdesc() %></h3>

                                            </div>
                                            <!-- /.mailbox-read-info -->
                                            <div class="mailbox-read-message">
                                                <%= article.getArticledesc() %>
                                            </div>
                                            <!-- /.mailbox-read-message -->
                                        </div>

                                        <!-- /.box-footer -->
                                        <div class="box-footer">
                                            <div class="pull-right">
                                                <button type="button" class="btn btn-normal" onclick="location.href='/updateArticle?id=<%= article.getArticleid() %>';"><i class="fa fa-edit"></i> Edit</button>
                                                <button type="button" class="btn btn-danger" onclick="location.href='http://google.com';"><i class="fa fa-remove"></i> Delete</button>
                                            </div>

                                        <!-- /.box-footer -->

                                    <!-- /. box -->





                </div>

                <!-- /. 1.2 End Left col-md 6 -->

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