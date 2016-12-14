<%--
  Created by IntelliJ IDEA.
  User: qingyutan
  Date: 13/12/16
  Time: 6:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mi2 - Add new medication</title>
    <!-- Common links-->
    <%@include file="common/html/commonLinks.html" %>
</head>
<%@include file="common/html/scripts.html" %>

<body class="hold-transition skin-blue layout-boxed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/nurseNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                Add new medications
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

                    <%--/. Box header --%>
                    <div class="callout callout-info lead">
                        <h4 class="callout-info">Under maintainance</h4>
                        <p>Still testing</p>

                    </div>
                    <%--/. Box  --%>
                </div>

        <form action="/addNewMedication" method="post">
                <%--/.1.1 Start col md 12  --%>
                <div class="col col-md-12">


                    <!-- general form elements -->
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Add new medications</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form">
                            <div class="box-body">

                                <!--/ 1.2 Left col md 6-->
                                <div class="col col-md-6">

                                    <div class="form-group">
                                        <label>Import date</label>
                                         <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                             <input type="text" class="form-control pull-right" id="datepicker">
                                         </div>
                                    </div>

                                        <div class="form-group">
                                            <label>Product name</label>
                                            <input type="text" class="form-control" placeholder="Enter name" name="productname">
                                        </div>

                                        <div class="form-group">
                                            <label>Product type</label>
                                            <select class="form-control" name="producttype">
                                                <option>Capsule</option>
                                                <option>Liquid</option>
                                                <option>Ointment</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label>Product unit</label>
                                            <select class="form-control" name="productunit">
                                                <option>Grams (gm)</option>
                                                <option>Piece (pc)</option>
                                                <option>Litres (l®®®¡)</option>
                                            </select>
                                        </div>

                                    <div class="form-group">
                                        <label>Product quantity</label>
                                        <input type="text" class="form-control" placeholder="Enter quantity" name="productquantity">
                                    </div>

                                    <div class="form-group">
                                        <label>Product details</label>
                                        <textarea class="form-control" placeholder="Enter details" name="productdetails"></textarea>
                                    </div>



                                    </div>
                                <!-- /. 1.2 Left col md-6 -->

                                <div class="col col-md-6">
                                    <div class="form-group">
                                        <label>Supplier name</label>
                                        <input type="text" class="form-control" placeholder="Enter supplier name" name="suppliername">
                                    </div>
                                    <div class="form-group">
                                        <label>Supplier part number</label>
                                        <input type="text" class="form-control" placeholder="Enter supplier part no" name="supplierpartno">
                                    </div>
                                    <div class="form-group">
                                        <label>Supplier Price</label>
                                        <input type="text" class="form-control" placeholder="Enter supplier price" name="supplierprice">
                                    </div>

                                    <div class="form-group">
                                        <label>Product code</label>
                                        <input type="text" class="form-control" placeholder="Enter product code" name="productcode">
                                    </div>

                                    <div class="form-group">
                                        <label>Product price</label>
                                        <input type="text" class="form-control" placeholder="Enter price" name="productprice">
                                    </div>



                                </div>
                            </div>

                               <!-- /. 1.2 End Left col-md 6 -->

                                </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary pull-right">Add new</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->



                </div>
                <%--/. 1.1 End Col md 12  --%>

        </form>




        </section>
        <%--/.Content--%>


    </div>
    <%--/.Content Wrapper--%>

    <%--Footer--%>
    <%@include file="common/html/footer.html" %>

     <!-- Script -->
        <script>
            $(function() {
                //Date picker
                $('#datepicker').datepicker({
                    autoclose: true
                });
                    }
                );



        </script>

    <!-- Add the sidebar's background. This div must be placed
   immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>

</div>

</body>
</html>
