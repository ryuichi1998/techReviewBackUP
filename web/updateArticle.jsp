<%--
  Created by IntelliJ IDEA.
  User: qingyutan
  Date: 3/2/17
  Time: 9:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    Faq article = (Faq) request.getAttribute("article");

%>
<head>
    <title>Edit Article <%= article.getSubject() %> Details</title>
    <%@include file="common/html/commonLinks.html" %>

    <style>
        ul.wysihtml5-toolbar{margin:0;padding:0;display:block}ul.wysihtml5-toolbar::after{clear:both;display:table;content:""}ul.wysihtml5-toolbar>li{float:left;display:list-item;list-style:none;margin:0 5px 10px 0}ul.wysihtml5-toolbar a[data-wysihtml5-command=bold]{font-weight:700}ul.wysihtml5-toolbar a[data-wysihtml5-command=italic]{font-style:italic}ul.wysihtml5-toolbar a[data-wysihtml5-command=underline]{text-decoration:underline}ul.wysihtml5-toolbar a.btn.wysihtml5-command-active{background-image:none;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);background-color:#D9D9D9;outline:0}ul.wysihtml5-commands-disabled .dropdown-menu{display:none!important}ul.wysihtml5-toolbar div.wysihtml5-colors{display:block;width:50px;height:20px;margin-top:2px;margin-left:5px;position:absolute;pointer-events:none}ul.wysihtml5-toolbar a.wysihtml5-colors-title{padding-left:70px}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=black]{background:#000!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=silver]{background:silver!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=gray]{background:gray!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=maroon]{background:maroon!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=red]{background:red!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=purple]{background:purple!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=green]{background:green!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=olive]{background:olive!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=navy]{background:navy!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=blue]{background:#00f!important}ul.wysihtml5-toolbar div[data-wysihtml5-command-value=orange]{background:orange!important}.glyphicon-quote:before{content:"\201C";font-family:Georgia,serif;font-size:50px;position:absolute;top:-4px;left:-3px;max-height:100%}.glyphicon-quote:after{content:"\0000a0"}
    </style>
</head>
<%@include file="common/html/scripts.html" %>
<script src='common/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css'></script>



<body class="hold-transition skin-blue fixed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/nurseNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                Edit article:  <%= article.getSubject() %>
                <small> <%= article.getShortdesc() %> </small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li>Article details</li>
                <li class="active">Update article</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content">
            <div class="row">

                <div class="col col-md-12">
                    <form action="/createArticle" method="post" name="createArticle">
                        <%--/.1.1 Start col md 12  --%>
                        <div class="col col-md-12">


                            <!-- general form elements -->
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Edit article</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form role="form">
                                    <div class="box-body">

                                        <!--/ 1.2 Left col md 6-->
                                        <div class="col col-md-9">

                                            <div class="form-group">
                                                <label>Article subject</label>
                                                <div class="field"><input type="text" class="form-control" placeholder="Subject title" id="subjecttitle" name="subjecttitle" value="<%= article.getSubject() %>">
                                                    <i></i></div>
                                            </div>

                                            <div class="form-group">
                                                <label>Short description</label>
                                                <div class="field"><input type="text" class="form-control" placeholder="Enter short description" name="shortdesc" id="shortdesc" maxlength="45" value="<%= article.getShortdesc() %>">
                                                    <i></i></div>
                                            </div>

                                            <div class="form-group">
                                                <label>Article Description</label>
                                                <textarea class="form-control textarea" name="longdesc" placeholder="Place some text here" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><%= article.getArticledesc() %></textarea>
                                            </div>

                                        </div>
                                        <!-- /. 1.2 Left col md-6 -->


                                        <!-- /. 1.2 End Left col-md 6 -->

                                    </div>
                                    <!-- /.box-body -->

                                    <div class="box-footer">
                                        <button type="submit" id="createArticle" class="btn btn-primary pull-right">Save</button>
                                    </div>
                                </form>
                  </div>
                </div>


                                <!-- /. 1.2 End Left col-md 6 -->

        </section>
        <%--/.Content--%>


    </div>
    <%--/.Content Wrapper--%>

    <%--Footer--%>
    <%@include file="common/html/footer.html" %>
        <script src='common/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js'></script>
        <script>
            $(function () {
                //bootstrap WYSIHTML5 - text editor
                $(".textarea").wysihtml5();
            });
        </script>

</body>
</html>
