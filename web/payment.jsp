<%@ page import="java.util.List" %>
<%@ page import="DAO.ServiceDAO" %>
<%@ page import="DAO.InvoiceDAO" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="common/html/commonLinks.html" %>
</head>
<%@include file="common/html/scripts.html" %>
<%
    ServiceDAO db = new ServiceDAO();
//    List<Service> serviceList = (List<Service>) request.getAttribute("services");
    List<Service> serviceList = db.retrieveAllService("P001", "false");
    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    Date date = new Date();

    System.out.println(dateFormat.format(date));
%>
<body class="hold-transition skin-blue layout-boxed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/patientNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Invoice
                <small>#</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Examples</a></li>
                <li class="active">Invoice</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <div class="pad margin no-print">
            <div class="callout callout-info" style="margin-bottom: 0!important;">
                <h4><i class="fa fa-info"></i> Note:</h4>
                This page has been enhanced for printing. Click the print button at the bottom of the invoice to test.
            </div>
        </div>

        <section class="content">
            <!-- title row -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <h2 class="page-header">
                                <i class="fa fa-globe"></i> AdminLTE, Inc.
                                <small class="pull-right">Date: 2/10/2014</small>
                            </h2>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info">
                        <div class="col-sm-4 invoice-col">
                            <address>
                                <strong>Billing Information</strong><br>
                                Invoice Number: <br>
                                Patient Number: <br>
                                Admission Date: <br>
                                Discharged Date:
                            </address>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- Table row -->
                    <div class="row">
                        <div class="col-xs-12 table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Service Date</th>
                                    <th>Description</th>
                                    <th>Qty</th>
                                    <th>Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    double total = 0;
                                    for (Service service : serviceList) {
                                        total = total + service.getServiceFee();
                                %>
                                <tr>
                                    <td><%= service.getServiceDate()%></td>
                                    <td><%= service.getServiceDesc()%></td>
                                    <td><%= service.getServiceQty()%></td>
                                    <td><%= service.getServiceFee()*service.getServiceQty()%></td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <!-- accepted payments column -->
                        <div class="col-xs-6">
                            <p class="lead">Payment Methods:</p>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-6">
                            <p class="lead">Amount Due 2/22/2014</p>

                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th style="width:50%">Subtotal:</th>
                                        <td><%=total%></td>
                                    </tr>
                                    <tr>
                                        <th>Tax (7%)</th>
                                        <% double tax = total*0.07; %>
                                        <td><%=  tax %></td>
                                    </tr>
                                    <tr>
                                        <th>Subsidy</th>
                                        <%  double sub = total * 0.4; %>
                                        <td><%=sub%></td>
                                    </tr>
                                    <tr>
                                        <th>Total Payable</th>
                                        <% double tPayable = total + tax - sub; %>
                                        <td><%=tPayable%></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                    <!-- this row will not appear when printing -->
                    <div class="row no-print">
                        <div class="col-xs-12">
                            <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
                            <button type="button" class="btn btn-success pull-right"><i class="fa fa-credit-card"></i> Submit Payment
                            </button>
                            <button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
                                <i class="fa fa-download"></i> Generate PDF
                            </button>
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
