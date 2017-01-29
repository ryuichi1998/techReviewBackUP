<%--
  Created by IntelliJ IDEA.
  User: qingyutan
  Date: 14/12/16
  Time: 3:05 AM
  To change this template use File | Settings | File Templates.
--%>

<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.ProductDAO" %>
<%
    Product medications = (Product) request.getAttribute("product");

%>

<head>
    <title><%= medications.getProductName() %> Details</title>
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
                <%= medications.getProductName() %> Details
                <small>This is the dashboard</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>
        <%--/.content-header--%>

<section class="content">
    <div class="row">

    <div class="col col-md-12">
        <!-- general form elements -->
        <div class="box box-info">

            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">
                <div class="box-body">

                    <div class="col-xs-6">
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th style="width:50%">Product Name</th>
                                    <td><%= medications.getProductName() %></td>
                                </tr>
                                <tr>
                                    <th>Product Type</th>
                                    <td><%= medications.getProductType() %></td>
                                </tr>
                                <tr>
                                    <th>Product Unit</th>
                                    <td><%= medications.getProductUnit() %></td>
                                </tr>
                                <tr>
                                    <th>Product Quantity</th>
                                    <td><%= medications.getProductQuantity() %></td>
                                </tr>
                                <tr>
                                    <th>Product Price</th>
                                    <td><%= medications.getProductPrice() %></td>
                                </tr>
                                <tr>
                                    <th>Product Details</th>
                                    <td><%= medications.getProductDetails() %></td>
                                </tr>


                            </table>
                        </div>
                    </div>



                <div class="col-xs-6">
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th style="width:50%">Supplier Name</th>
                                <td><%= medications.getSupplierName() %></td>
                            </tr>
                            <tr>
                                <th>Supplier Part no</th>
                                <td><%= medications.getSupplierPartNo() %></td>
                            </tr>
                            <tr>
                                <th>Supplier Price</th>
                                <td><%= medications.getSupplierPrice() %></td>
                            </tr>
                            <tr>
                                <th>Imported Date</th>
                                <td><%= medications.getImportedDate() %></td>
                            </tr>

                        </table>
                    </div>
                </div>


            </div>
        </div>
                </div>

                <!-- /. 1.2 End Left col-md 6 -->

        </div>
        <!-- /.box-body -->

        <div class="box-footer">
            <a href="updateProduct?productcode=<%= medications.getProductCode() %>" class="btn btn-success pull-right">Update Details</a>
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
