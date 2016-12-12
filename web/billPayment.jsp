<%--
  Created by IntelliJ IDEA.
  User: liyun
  Date: 10/12/16
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="common/html/commonLinks.html" %>
</head>
<%@include file="common/html/scripts.html" %>

<body class="hold-transition skin-blue layout-boxed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/patientNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
               BILL INVOICE <span class="label label-default">Pending</span>
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
                    <h5>Invoice Number:0001</h5>
                    <h5>Patient Number:0001</h5>
                    <h5>NRIC:0001</h5>
                    <h5>Admission Date:0001</h5>
                    <h5>Discharged Date:0001</h5>
                    <h5>Billing Date:0001</h5>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Billing Details</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Description</th>
                                    <th>Charges Before GOVT Grant</th>
                                    <th>Amount Payable</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>Upper Jaw Surgery</td>
                                    <td>60000.00</td>
                                    <td>21000.00</td>
                                </tr>
                                <tr>
                                    <td>Drugs</td>
                                    <td>156.70</td>
                                    <td>98.66</td>
                                </tr>
                                <tr>
                                    <td>Surgeon Fee</td>
                                    <td>648.00</td>
                                    <td>648.00</td>
                                </tr>
                                </tbody>
                            </table>
                            <br></br>
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th>Subsidies</th>
                                    <td>2200.00</td>
                                </tr>
                                <tr>
                                    <th>Total Amount Payable Before Tax</th>
                                    <td>19546.66</td>
                                </tr>
                                <tr>
                                    <th>Total Amount Payable After Tax</th>
                                    <td>20914.9262</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" style="float: right">Make Payment</button>
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
