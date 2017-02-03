<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mi2 - Product Dashboard</title>
    <!-- Select2 -->
    <link rel="stylesheet" href="common/plugins/select2/select2.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="common/plugins/datepicker/datepicker3.css">
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet"
          type="text/css"/>
    <%@include file="common/html/commonLinks.html" %>
</head>

<%
    List<Invoice> invoiceList = (List<Invoice>)request.getAttribute("invoices");
%>

<%@include file="common/html/scripts.html" %>

<script type="text/javascript">

    $(document).ready(function() {
        var panels = $('.user-infos');
        var panelsButton = $('.dropdown-user');
        panels.hide();

        //Click dropdown
        panelsButton.click(function() {
            //get data-for attribute
            var dataFor = $(this).attr('data-for');
            var idFor = $(dataFor);

            //current button
            var currentButton = $(this);
            idFor.slideToggle(400, function() {
                //Completed slidetoggle
                if(idFor.is(':visible'))
                {
                    currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
                }
                else
                {
                    currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
                }
            })
        });


        $('[data-toggle="tooltip"]').tooltip();

        $('button').click(function(e) {
            e.preventDefault();
            alert("This is a demo.\n :-)");
        });
    });

    $(document).ready(function(){

        <%for (Invoice invoice : invoiceList)%>  {
            var elmnt = $('#template2');
            elmnt.clone().insertAfter("#template2");
        }
    });

</script>

<style>
    .user-row {
        margin-bottom: 14px;
    }

    .user-row:last-child {
        margin-bottom: 0;
    }

    .dropdown-user {
        margin: 13px 0;
        padding: 5px;
        height: 100%;
    }

    .dropdown-user:hover {
        cursor: pointer;
    }

    .table-user-information > tbody > tr {
        border-top: 1px solid rgb(221, 221, 221);
    }

    .table-user-information > tbody > tr:first-child {
        border-top: 0;
    }


    .table-user-information > tbody > tr > td {
        border-top: 0;
    }

</style>

<body class="hold-transition skin-blue fixed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/patientNavigation.jsp" %>
    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                View Invoice
                <small>
                    <%--<%=patient.getName()%>--%>
                </small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            </ol>
        </section>
        <%--/.content-header--%>

        <!-- Main content -->
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <div class="template1">
                                    <div class="row user-row">
                                        <%--<div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">--%>
                                            <%--<img class="img-circle"--%>
                                                 <%--src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"--%>
                                                 <%--alt="User Pic">--%>
                                        <%--</div>--%>
                                        <div class="col-xs-8 col-sm-9 col-md-10 col-lg-10">
                                            <strong>Cyruxx</strong><br>
                                            <span class="text-muted">User level: Administrator</span>
                                        </div>
                                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 dropdown-user" data-for=".cyruxx">
                                            <i class="glyphicon glyphicon-chevron-down text-muted"></i>
                                        </div>
                                    </div>
                                    <div class="row user-infos cyruxx">
                                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                                            <div class="panel panel-primary">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">User information</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <%--<div class="col-md-3 col-lg-3 hidden-xs hidden-sm">--%>
                                                            <%--<img class="img-circle"--%>
                                                                 <%--src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"--%>
                                                                 <%--alt="User Pic">--%>
                                                        <%--</div>--%>
                                                        <div class="col-xs-2 col-sm-2 hidden-md hidden-lg">
                                                            <img class="img-circle"
                                                                 src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
                                                                 alt="User Pic">
                                                        </div>
                                                        <div class="col-xs-10 col-sm-10 hidden-md hidden-lg">
                                                            <strong>Cyruxx</strong><br>
                                                            <dl>
                                                                <dt>User level:</dt>
                                                                <dd>Administrator</dd>
                                                                <dt>Registered since:</dt>
                                                                <dd>11/12/2013</dd>
                                                                <dt>Topics</dt>
                                                                <dd>15</dd>
                                                                <dt>Warnings</dt>
                                                                <dd>0</dd>
                                                            </dl>
                                                        </div>
                                                        <div class=" col-md-9 col-lg-9 hidden-xs hidden-sm">
                                                            <strong>Cyruxx</strong><br>
                                                            <table class="table table-user-information">
                                                                <tbody>
                                                                <tr>
                                                                    <td>User level:</td>
                                                                    <td>Administrator</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Registered since:</td>
                                                                    <td>11/12/2013</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Topics</td>
                                                                    <td>15</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Warnings</td>
                                                                    <td>0</td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    <button class="btn btn-sm btn-primary" type="button"
                                                            data-toggle="tooltip"
                                                            data-original-title="Send message to user"><i class="glyphicon glyphicon-envelope"></i></button>
                                                    <span class="pull-right">
                                                        <button class="btn btn-sm btn-warning" type="button"
                                                                data-toggle="tooltip"
                                                                data-original-title="Edit this user"><i class="glyphicon glyphicon-edit"></i></button>
                                                        <button class="btn btn-sm btn-danger" type="button"
                                                                data-toggle="tooltip"
                                                                data-original-title="Remove this user"><i class="glyphicon glyphicon-remove"></i></button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 </div>

                            <div id="template2">
                                <div class="row user-row">
                                    <%--<div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">--%>
                                    <%--<img class="img-circle"--%>
                                    <%--src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"--%>
                                    <%--alt="User Pic">--%>
                                    <%--</div>--%>
                                    <div class="col-xs-8 col-sm-9 col-md-10 col-lg-10">
                                        <strong>Cyruxx</strong><br>
                                        <span class="text-muted">User level: Administrator</span>
                                    </div>
                                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 dropdown-user" data-for=".t2">
                                        <i class="glyphicon glyphicon-chevron-down text-muted"></i>
                                    </div>
                                </div>
                                <div class="row user-infos t2">
                                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">User information</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <%--<div class="col-md-3 col-lg-3 hidden-xs hidden-sm">--%>
                                                    <%--<img class="img-circle"--%>
                                                    <%--src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"--%>
                                                    <%--alt="User Pic">--%>
                                                    <%--</div>--%>
                                                    <div class="col-xs-2 col-sm-2 hidden-md hidden-lg">
                                                        <img class="img-circle"
                                                             src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
                                                             alt="User Pic">
                                                    </div>
                                                    <div class="col-xs-10 col-sm-10 hidden-md hidden-lg">
                                                        <strong>Cyruxx</strong><br>
                                                        <dl>
                                                            <dt>User level:</dt>
                                                            <dd>Administrator</dd>
                                                            <dt>Registered since:</dt>
                                                            <dd>11/12/2013</dd>
                                                            <dt>Topics</dt>
                                                            <dd>15</dd>
                                                            <dt>Warnings</dt>
                                                            <dd>0</dd>
                                                        </dl>
                                                    </div>
                                                    <div class=" col-md-9 col-lg-9 hidden-xs hidden-sm">
                                                        <strong>Cyruxx</strong><br>
                                                        <table class="table table-user-information">
                                                            <tbody>
                                                            <tr>
                                                                <td>User level:</td>
                                                                <td>Administrator</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Registered since:</td>
                                                                <td>11/12/2013</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Topics</td>
                                                                <td>15</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Warnings</td>
                                                                <td>0</td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel-footer">
                                                <button class="btn btn-sm btn-primary" type="button"
                                                        data-toggle="tooltip"
                                                        data-original-title="Send message to user"><i class="glyphicon glyphicon-envelope"></i></button>
                                                <span class="pull-right">
                                                        <button class="btn btn-sm btn-warning" type="button"
                                                                data-toggle="tooltip"
                                                                data-original-title="Edit this user"><i class="glyphicon glyphicon-edit"></i></button>
                                                        <button class="btn btn-sm btn-danger" type="button"
                                                                data-toggle="tooltip"
                                                                data-original-title="Remove this user"><i class="glyphicon glyphicon-remove"></i></button>
                                                    </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
