<%--
  Created by IntelliJ IDEA.
  User: qingyutan
  Date: 12/12/16
  Time: 5:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.*, java.util.*" %>
<html>
<head>
    <title>Mi2 - Medication Dashboard</title>
    <%@include file="common/html/commonLinks.html" %>
</head>
<%@include file="common/html/scripts.html" %>

<body class="hold-transition skin-blue layout-boxed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/nurseNavigation.jsp" %>
        <script type="text/javascript">
            $(function() {

                var bar_data = {
                    data: [["January", 10], ["February", 8], ["March", 4], ["April", 13], ["May", 17], ["June", 9]],
                    color: "#3c8dbc"
                };
                $.plot("#bar-chart", [bar_data], {
                    grid: {
                        borderWidth: 1,
                        borderColor: "#f3f3f3",
                        tickColor: "#f3f3f3"
                    },
                    series: {
                        bars: {
                            show: true,
                            barWidth: 0.5,
                            align: "center"
                        }
                    },
                    xaxis: {
                        mode: "categories",
                        tickLength: 0
                    }
                });
                /* END BAR CHART */

        </script>
    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                Medication Management
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


                <!--

                NEW ORDER BOX

                -->

                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3>150</h3>

                            <p>New Orders</p>
                        </div>
                        <div class="icon" style="top:5px;">
                            <i class="fa fa-shopping-cart"></i>
                        </div>
                        <a href="#" class="small-box-footer">
                            More info <i class="fa fa-arrow-circle-right"></i>
                        </a>
                    </div>
                </div>


                <!--

                UNIQUE VISTORS

                -->

                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3>65</h3>

                            <p>Low Stocks</p>
                        </div>
                        <div class="icon" style="top:5px;">
                            <i class="ion ion-pie-graph"></i>
                        </div>
                        <a href="#" class="small-box-footer">
                            More info <i class="fa fa-arrow-circle-right"></i>
                        </a>
                    </div>
                </div>


                <!--

                 LOW ON STOCKS TABLE

                 -->
                <div class="col col-md-6 pull-right">
                    <!-- TABLE: PRODUCT ON LOW STOCKS -->
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">Low Stocks</h3>
                                <!-- TABLE: BUTTONS -->
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                <!-- TABLE: BODY -->
                                <div class="box-body">
                                    <div class="table-responsive">

                                        <table class="table no-margin">
                                            <%
                                                // for(Product product : product) {
                                            %>
                                            <thead>
                                                 <th>Product name</th>
                                                 <th>Type</th>
                                                 <th>Unit</th>
                                                 <th>Quantity</th>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <td> Panadol <% %> </td>
                                                    <td> Capsule <% %> </td>
                                                    <td> Grams (gm) <% %> </td>
                                                    <td> <span class="label label-danger">20%</span><% %> </td>
                                                </tr>
                                            </tbody>


                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>


                </div>
                <%--/. Col md 12  --%>
            </div>


                <!-- /.row -->
                <div class="row">
                    <div class="col col-md-12">

                        <!-- Bar chart -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>

                                <h3 class="box-title">Bar Chart</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body">
                                <div id="bar-chart" style="height: 300px;"></div>
                            </div>
                            <!-- /.box-body-->
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
