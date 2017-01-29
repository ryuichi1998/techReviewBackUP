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
    <script>

        function validateForm() {
            // set error catcher
            var error = 0;

            if (!validateName('productName')) { document.getElementById('productNameError').style.display = 'block'; error++ }
            if (!validateSelect('productType')) { document.getElementById('productTypeError').style.display = 'block'; error++ }
            if (!validateSelect('productUnit')) { document.getElementById('productUnitError').style.display = 'block'; error++ }
            if (!validateValue('productQuantity')) { document.getElementById('productQuantityError').style.display = 'block'; error++ }
            if (!validateName('productDetails')) { document.getElementById('productDetailsError').style.display = 'block'; error++ }
            if (!validateName('supplierName')) { document.getElementById('supplierNameError').style.display = 'block'; error++ }
            if (!validateValue('supplierPartNo')) { document.getElementById('supplierPartNoError').style.display = 'block'; error++ }
            if (!validateValue('supplierPrice')) { document.getElementById('supplierPriceError').style.display = 'block'; error++ }
            if (!validateValue('productPrice')) { document.getElementById('productPriceError').style.display = 'block'; error++ }

            if(error > 0) { return false; }


        }




        function validateName(x) {
            var re = /[A-Za-z - ']$/;

            if(re.test(document.getElementById(x).value)) {
                document.getElementById(x).style.background = '#ccffcc';
                return true;
            } else {
                document.getElementById(x).style.background = '#e35152';
                document.getElementById(x + 'Error').style.display = "block";
                return false;
            }

        }


        function validateValue(x) {
            var re = /[A-Za-z - ']$/;

            if(re.test(document.getElementById(x).value)) {
                document.getElementById(x).style.background = '#ccffcc';
                return true;
            } else {
                document.getElementById(x).style.background = '#e35152';
                document.getElementById(x + 'Error').style.display = "block";
                return false;
            }

        }

        function validateSelect(x){
            if(document.getElementById(x).selectedIndex !== 0){
                document.getElementById(x).style.background ='#ccffcc';
                document.getElementById(x + 'Error').style.display = "none";
                return true;
            }else{
                document.getElementById(x).style.background ='#e35152';
                return false;
            }
        }

        function validateValue(x) {
            if (document.getElementById(x).length() == 0) {
                document.getElementById(x).style.background = '#ccffcc';
                document.getElementById(x + 'Error').style.display = "none";
                return true;
            } else {
                document.getElementById(x).style.background = '#e35152';
                return false;
            }
        }



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

        <form onsubmit="return validateForm()" action="/newProduct" method="post" name="newProduct">
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
                                            <input type="text" class="form-control" placeholder="Enter name" id="productname" name="productname" onblur="validateName(productName)">
                                            <span class="validateError" id="productNameError" style="display: none;">You must enter a product name</span>
                                        </div>

                                        <div class="form-group">
                                            <label>Product type</label>
                                            <select class="form-control" name="producttype" id="producttype" onblur="validateSelect(productType)">
                                                <option>Capsule</option>
                                                <option>Liquid</option>
                                                <option>Ointment</option>
                                            </select>
                                            <span class="validateError" id="productTypeError" style="display: none;">You must select a product type</span>
                                        </div>

                                        <div class="form-group">
                                            <label>Product unit</label>
                                            <select class="form-control" name="productunit" id="productunit" onblur="validateSelect(productUnit)">
                                                <option>Grams (gm)</option>
                                                <option>Piece (pc)</option>
                                                <option>Litres (l)</option>
                                            </select>
                                            <span class="validateError" id="productUnitError" style="display: none;">You must select a product unit</span>
                                        </div>

                                    <div class="form-group">
                                        <label>Product quantity</label>
                                        <input type="text" class="form-control" placeholder="Enter quantity" name="productquantity" id="productquantity" onblur="validateValue(productQuantity)">
                                        <span class="validateError" id="productQuantityError" style="display: none;">You must enter a product quantity</span>
                                    </div>

                                    <div class="form-group">
                                        <label>Product details</label>
                                        <textarea class="form-control" placeholder="Enter details" name="productdetails" id="productdetails" onblur="validateName(productDetails)"></textarea>
                                        <span class="validateError" id="productDetailsError" style="display: none;">You must enter a product details</span>
                                    </div>



                                    </div>
                                <!-- /. 1.2 Left col md-6 -->

                                <div class="col col-md-6">
                                    <div class="form-group">
                                        <label>Supplier name</label>
                                        <input type="text" class="form-control" placeholder="Enter supplier name" name="suppliername" id="suppliername" onblur="validateName(supplierName)">
                                        <span class="validateError" id="supplierNameError" style="display: none;">You must enter the supplier name</span>
                                    </div>
                                    <div class="form-group">
                                        <label>Supplier part number</label>
                                        <input type="text" class="form-control" placeholder="Enter supplier part no" name="supplierpartno" id="supplierpartno" onblur="validateValue(supplierPartNo)">
                                        <span class="validateError" id="supplierPartNoError" style="display: none;">You must enter the supplier part no</span>
                                    </div>
                                    <div class="form-group">
                                        <label>Supplier Price</label>
                                        <input type="text" class="form-control" placeholder="Enter supplier price" name="supplierprice" id="supplierprice" onblur="validateValue(supplierPrice)">
                                        <span class="validateError" id="supplierPriceError" style="display: none;">You must enter the supplier price</span>
                                    </div>

                                    <div class="form-group">
                                        <label>Product price</label>
                                        <input type="text" class="form-control" placeholder="Enter price" name="productprice" id="productprice" onblur="validateValue(productPrice)">
                                        <span class="validateError" id="productPriceError" style="display: none;">You must enter the product price</span>
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
