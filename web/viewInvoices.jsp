<%@ page import="DAO.InvoiceDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="common/html/commonLinks.html" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
        jQuery(document).ready(function($) {
            $(".clickable-row").click(function() {
                window.document.location = $(this).data("href");
            });
        });
    </script>
</head>
<%@include file="common/html/scripts.html" %>
<%
    InvoiceDAO invoiceDb = new InvoiceDAO();
    List<Invoice> invoiceList = invoiceDb.retrieveAllService("P001");
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
                Invoices
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>
        <%--/.content-header--%>

            <section class="content">
                <div class="row">
                    <div class="col-lg-12" style="background-color: snow; height: 100%">
                        <br>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Billing Details</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Billing Date</th>
                                        <th>Invoice Number</th>
                                        <th>Payment Method</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for (Invoice invoices : invoiceList) {
                                    %>
                                    <tr class="clickable-row" data-href='/payment.jsp'>
                                        <td><%= invoices.getBillingDate()%></td>
                                        <td><%= invoices.getInvoiceId()%></td>
                                        <td><%= invoices.getPaymentMethod()%></td>

                                        <td>
                                            <%
                                                String status;
                                                String label;
                                                if (invoices.getStatus().equalsIgnoreCase("false")) {
                                                 status = "Pending";
                                                 label = "<span class=\"label label-default\">";
                                                } else {
                                                 status = "Paid";
                                                 label = "<span class=\"label label-success\">";
                                            }
                                            %>
                                            <%=label%><%=status%></span></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <ul class="pagination" style="float: right">
                            <li><a href="#">1</a></li>
                            <li class="active"><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                        </ul>
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
