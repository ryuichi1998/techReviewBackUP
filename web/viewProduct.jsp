<%--
  Created by IntelliJ IDEA.
  User: qingyutan
  Date: 12/12/16
  Time: 6:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mi2 - View all medications</title>
    <%@include file="common/html/commonLinks.html" %>
</head>
<%@include file="common/html/scripts.html" %>
<%@ page import="DAO.ProductDAO" %>
<%@ page import="java.util.List" %>
<%
    ProductDAO db = new ProductDAO();
    //Product medications =  db.retrieveMedications();
    List<Product> products = db.retrieveAllProduct();


%>



<body class="hold-transition skin-blue layout-boxed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/nurseNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                Medications
                <small>view all medications</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content">

            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">View all medications</h3>

                            <div class="box-tools">
                                <div class="input-group input-group-sm" style="width: 150px;">
                                    <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tbody>
                                <tr>
                                    <th>Product Code</th>
                                    <th>Product Name</th>
                                    <th>Type</th>
                                    <th>Unit</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Details</th>
                                    <th>Imported Date</th>

                                </tr>
                                <%
                                    for(Product medications : products) {
                                %>
                                <tr>
                                    <td><a href="viewMedications?productcode=<%= medications.getProductCode() %>"><%= medications.getProductCode() %></a></td>
                                    <td><%= medications.getProductName() %></td>
                                    <td><%= medications.getProductType() %></td>
                                    <td><%= medications.getProductUnit() %></td>
                                    <td><span class="label label-default"><%= medications.getProductQuantity() %></span></td>
                                    <td><%= medications.getProductPrice() %></td>
                                    <td><%= medications.getProductDetails() %></td>
                                    <td><%= medications.getImportedDate() %></td>

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
