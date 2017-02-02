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
    <title>Add new products</title>
    <!-- Common links-->
    <%@include file="common/html/commonLinks.html" %>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <style>
        .field{
            position: relative;
        }
        .field i{
            position: absolute;
            right: 10px;
            top:10px;
            display: none;
        }

        /* --------------------------------------------------- */
        /*	Validation Styles
        /* --------------------------------------------------- */
        .success{
            background-color: #EAFFF8;
        }
        .success+i{
            color: #1C9D39;

        }
        .error+i{
            color: #B82020;

        }
        .error{
            background-color: #FFF1FF;
        }
    </style>
    <script type="text/javascript">

        $(function(){
            var pname = $("#productname");
            var pquantity = $("#productquantity");
            var sname = $("#suppliername");
            var spartno = $("#supplierpartno");
            var sprice = $("#supplierprice");
            var pprice = $("#productprice");

            function validate(field){
                if(field.val().length === 0){
                    field.addClass("error");
                    field.next().addClass("fa fa-warning");
                }else{
                    field.addClass("success");
                    field.next().addClass("fa fa-check");
                }
                return field;
            }

            $('input').blur(function(){
                validate($(this));
            });


        });

    </script>
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
                Add new products
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content">


            <div class="row">


        <form action="/newProduct" method="post" name="newProduct">
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
                                            <label>Product name</label>
                                            <div class="field"><input type="text" class="form-control" placeholder="Enter name" id="productname" name="productname">
                                          <i></i></div>
                                        </div>

                                        <div class="form-group">
                                            <label>Product type</label>
                                            <select class="form-control" name="producttype" id="producttype">
                                                <option>Capsule</option>
                                                <option>Liquid</option>
                                                <option>Ointment</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label>Product unit</label>
                                            <select class="form-control" name="productunit" id="productunit">
                                                <option>Grams (gm)</option>
                                                <option>Piece (pc)</option>
                                                <option>Litres (l)</option>
                                            </select>
                                        </div>

                                    <div class="form-group">
                                        <label>Product quantity</label>
                                        <div class="field"><input type="text" class="form-control" placeholder="Enter quantity" name="productquantity" id="productquantity">
                                        <i></i></div>
                                    </div>

                                    <div class="form-group">
                                        <label>Product details</label>
                                        <div class="field"><textarea class="form-control" placeholder="Enter details" name="productdetails" id="productdetails"></textarea>
                                        <i></i></div>
                                    </div>



                                    </div>
                                <!-- /. 1.2 Left col md-6 -->

                                <div class="col col-md-6">
                                    <div class="form-group">
                                        <label>Supplier name</label>
                                        <div class="field"><i></i><input type="text" class="form-control" placeholder="Enter supplier name" name="suppliername" id="suppliername">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Supplier part number</label>
                                        <div class="field"> <i></i><input type="text" class="form-control" placeholder="Enter supplier part no" name="supplierpartno" id="supplierpartno">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Supplier Price</label>
                                        <div class="field"><i></i><input type="text" class="form-control" placeholder="Enter supplier price" name="supplierprice" id="supplierprice">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Product price</label>
                                        <div class="field"><i></i><input type="text" class="form-control" placeholder="Enter price" name="productprice" id="productprice">
                                        </div>
                                    </div>



                                </div>
                            </div>

                               <!-- /. 1.2 End Left col-md 6 -->

                                </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                                <button type="submit" id="addMedication" class="btn btn-primary pull-right">Add new</button>
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

    <!-- Add the sidebar's background. This div must be placed
   immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>

</div>

</body>
</html>
