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
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <%@include file="common/html/commonLinks.html" %>
</head>

<%
    List<Patient> patientList = (List<Patient>)request.getAttribute("patients");
    List<Service> serviceList = (List<Service>)request.getAttribute("services");
%>

<%@include file="common/html/scripts.html" %>
<!-- Select2 -->
<script src="common/plugins/select2/select2.full.min.js"></script>

<!-- date-picker -->
<script src="common/plugins/datepicker/bootstrap-datepicker.js"></script>

<script type="text/javascript">
    //Select2
    var patient;

    $(document).ready(function() {

        $('select').select2();
        $('#clickPatientId').on('select2:select', function () {
            var patientId = $("#clickPatientId").val();
            var clickPatientId = true;
            $.ajax({
                type: "POST",
                url: "/populateCreateInvoice",
                data: {patientId: patientId, clickPatientId: clickPatientId},
                dataType: "json",

                //if received a response from the server
                success: function (data) {
                    console.log(data);
                    document.getElementById('nameText').value = (data.name);
                    document.getElementById('nricText').value = (data.nric);
                    document.getElementById('addrText').value = (data.address);
                    document.getElementById('numText').value = (data.phoneNumber);
                    document.getElementById('emailText').value = (data.email);
                },
                error: function () {
                }
            });
        });

        $('#clickService').on('select2:select', function () {
            var serviceId = $("#clickService").val();
            dataString = "serviceId=" + serviceId;
            $.ajax({
                type: "POST",
                url: "/populateCreateInvoice",
                data: dataString,
                dataType: "json",

                //if received a response from the server
                success: function (data) {
                    console.log(data);
                    document.getElementById('servDate').value = (data.serDesc);
                    document.getElementById('price').value = (data.price);
                },
                error: function () {
                }
            });
        });

    });

    $(document).ready(function() {
        //Date picker
        $('#datepicker').datepicker({
            autoclose: true
        });
    });

    $(document).on('click', '.number-spinner button', function () {
        var btn = $(this),
            oldValue = btn.closest('.number-spinner').find('input').val().trim(),
            newVal = 0;

        if (btn.attr('data-dir') == 'up') {
            newVal = parseInt(oldValue) + 1;
        } else {
            if (oldValue > 1) {
                newVal = parseInt(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        btn.closest('.number-spinner').find('input').val(newVal);
    });

    $(document).ready(function () {

        var successfulDiv =  '<div class="pad margin padding alert alert-success alert-dismissible"><button type="button" class="close" ' +
            'data-dismiss="alert" aria-hidden="true">&times;</button> <h4><i class="icon fa fa-check"></i> Success!</h4>Invoice Successfully Created.</div>';

        $("#invoiceFormData").submit(function(event) {
            event.preventDefault();
            var invoiceFormData = $("#invoiceFormData").serialize();
            $.ajax({
                type: "POST",
                data: invoiceFormData,
                url: "/createInvoice",
                success: function () {
                    console.log(invoiceFormData);
                    alert("Success");
                    $('#messageInvoice').html(successfulDiv).delay(10000);
                },
                error: function () {

                }
            });
        });
    });

    $( function() {
        $( "#datepicker" ).datepicker();
    } );

    $(document).on('click', '#addBtn', function () {
        var counter = 1;
        var dupli =  $('#template');
        dupli.clone().insertAfter("#template");
    });

</script>

<body class="hold-transition skin-blue fixed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/patientNavigation.jsp" %>
    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                Create Billing Invoice
                <small>
                    <%--<%=patient.getName()%>--%>
                </small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            </ol>
        </section>
        <%--/.content-header--%>

            <div id="messageInvoice"></div>

            <!-- Main content -->
            <section class="content">
                <form id="invoiceFormData">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Patient Details</h3>

                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group" id="ajaxRequestPatientDetails">
                                                <label>Patient ID</label>
                                                <select class="form-control select2" name="patientId" id="clickPatientId" style="width: 100%;">
                                                    <%
                                                        for (Patient patient : patientList) {
                                                    %>
                                                    <option><%= patient.getPatientId()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" name="name" class="form-control" id="nameText" readonly >
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>NRIC</label>
                                                <input type="text" class="form-control" id="nricText" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input type="text" class="form-control"  id="addrText" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Phone Number</label>
                                                <input type="text" class="form-control"  id="numText" readonly >
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" class="form-control"  id="emailText" readonly >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" id="template">
                        <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Service#1</h3>

                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Service Number</label>
                                                <select class="form-control select2" name="code" id="clickService" style="width: 100%;">
                                                    <%
                                                        for (Service service : serviceList) {
                                                    %>
                                                    <option><%= service.getServiceId()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Description</label>
                                                <input type="text" id="servDate" class="form-control" readonly >
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Price</label>
                                                <input type="text" name="priceText" id="price" class="form-control" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Quantiy</label>
                                            <div class="input-group number-spinner">
                                                <span class="input-group-btn">
                                                <button class="btn btn-default" type="button" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
                                                </span>
                                                <input type="text" name="quantity" class="form-control text-center" value="1">
                                                <span class="input-group-btn">
                                                <button class="btn btn-default" type="button" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
                                            </span>
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label>Service Date</label>
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="text" class="form-control pull-right" name="servDate" id="datepicker">
                                                </div>
                                            </div>
                                            <!-- /.input group -->
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-danger pull-right"><i class="fa fa-close"></i> Delete</button>
                                    <button type="button" id="addBtn" class="btn btn-success pull-right" style="margin-right: 5px;"><i class="fa fa-plus"></i> Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="input" id="logGLBtn" class="btn btn-success pull-right">Save</button>
                    </div>
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
