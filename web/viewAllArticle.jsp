<%--
  Created by IntelliJ IDEA.
  User: qingyutan
  Date: 2/2/17
  Time: 7:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View all article</title>
    <%@include file="common/html/commonLinks.html" %>
</head>
<%@include file="common/html/scripts.html" %>
<%@ page import="java.util.List" %>
<%
    Staff nurse = (Staff) session.getAttribute("person");
    List<Faq> allArticles = (List<Faq>) request.getAttribute("articles");
%>



<body class="hold-transition skin-blue fixed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/nurseNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                Articles
                <small>view all articles</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">View all articles</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content">

            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Display all articles</h3>


                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tbody>
                                <tr>
                                    <th>Article name</th>
                                    <th>Brief description</th>
                                    <th>Options</th>


                                </tr>
                                <%
                                    for(Faq article : allArticles) {
                                %>
                                <tr>
                                    <td><a href="/viewArticleDetails?id=<%= article.getArticleid() %>"><%= article.getSubject() %></a></td>
                                    <td><%= article.getShortdesc() %></td>
                                    <td><div class="btn-group">
                                        <button type="button" class="btn btn-normal"  onclick="location.href='/updateArticle?id=<%= article.getArticleid() %>';"><i class="fa fa-edit"></i></button>
                                        <button type="button" class="btn btn-danger"  onclick="location.href='/deleteArticle?id=<%= article.getArticleid() %>';"><i class="fa fa-remove"></i></button>
                                    </div></td>
                                </tr>
                                <%
                                    }
                                %>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <!-- /.row -->



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
