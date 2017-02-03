<%@ page import="java.util.List" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Collection" %>
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

    });

//    $(document).ready(function(){
//
//        for (i= 0; i<10; i++)  {
//            var elmnt = $('#template2');
//            elmnt.set
//            elmnt.clone().insertAfter("#template2");
//        }
//    });

</script>

<style>
    .user-row {
        margin-bottom: 25px;
        margin-left: 5px;
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


                            <%
                                for (Invoice invoice : invoiceList) {
                                Collection<Servdetails> servdetailsList = invoice.getServdetailsListByInvoiceId();
                            %>

                            <div id="template">
                                <div class="row user-row">
                                    <div class="col-xs-8 col-sm-9 col-md-10 col-lg-10">
                                        <strong><%="Invoice Number# " + invoice.getInvoiceId()%></strong><br>
                                        <span class="text-muted">Status: <%=invoice.getStatus()%></span><br>
                                        <span class="text-muted">Billing Date: <%=invoice.getBillingDate()%></span>
                                        <span class="text-muted">Due Date: <%=invoice.getDueDate()%></span>
                                    </div>
                                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 dropdown-user pull-right" data-for=".<%=invoice.getInvoiceId()%>">
                                        <i class="glyphicon glyphicon-chevron-down text-muted"></i>
                                    </div>
                                </div>
                                <div class="row user-infos <%=invoice.getInvoiceId()%>">
                                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Invoice Information</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class=" col-md-12 col-lg-12">
                                                        <strong><h4><%="Invoice Number# " + invoice.getInvoiceId()%></h4></strong><br>
                                                        <table class="table table-striped">
                                                            <thead>
                                                            <tr>
                                                                <th>Qty</th>
                                                                <th>Product</th>
                                                                <th>Serial #</th>
                                                                <th>Subtotal</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <%
                                                                for (Servdetails servdetails1 : servdetailsList) {
                                                            %>
                                                                <tr>
                                                                            <td><%=servdetails1.getQnty()%></td>
                                                                            <td><%=servdetails1.getServiceByServiceId().getSerDesc()%></td>
                                                                            <td><%=servdetails1.getServiceByServiceId().getServiceId()%></td>
                                                                            <td><%=servdetails1.getSubtotal()%></td>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <a href="/invoice" class="btn btn-success pull-right" data-toggle="tooltip"
                                                   data-original-title="View this Invoice">View</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%
                                }
                            %>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
