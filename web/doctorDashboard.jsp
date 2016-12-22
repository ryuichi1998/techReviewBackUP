<%--
  Created by IntelliJ IDEA.
  User: chial
  Date: 6/11/2016
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%@page import="Entity.*" %>

<head>
    <title>Dashboard</title>
    <%--morris chart--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <%@include file="common/html/commonLinks.html" %>
</head>

<%@include file="common/html/scripts.html" %>
<%--morris chart--%>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>

<script type="text/javascript">

    $(document).ready(function () {

            var monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];

            $(window).resize(function () {
//            to resize the chart
                heartBeatChart.redraw();
            })

            var heartBeatChart = Morris.Line({
                element: 'heart-beat-chart',
                data: [
                    {y: '2012-02-24 15:00:00', a: 87, b: 90},
                    {y: '2012-02-25 15:00:00', a: 75, b: 65},
                    {y: '2012-02-26 15:00:00', a: 50, b: 40},
                    {y: '2012-02-27 15:00:00', a: 75, b: 65},
                    {y: '2012-02-28 15:00:00', a: 50, b: 40},
                    {y: '2012-02-29 15:00:00', a: 75, b: 65},
                    {y: '2012-03-01 15:00:00', a: 67, b: 71}
                ],
                xkey: 'y',
                ykeys: ['a', 'b'],
                labels: ['Actual', 'Average'],
                xLabelFormat: function (x) {
                    var datef = x.toDateString();
                    datef = datef.substring(0, datef.length - 4);
                    return datef;
                },
                hoverCallback: function (index, options, content) {
                    var top = "<div class='morris-hover-row-label'>" + monthNames[options.data[index].y.substring(6, 7)] + " " + options.data[index].y.substring(8, 10) + "</div>";
                    var middle = "<div class='morris-hover-point' style='color: #0b62a4'>" + "Actual: " + options.data[index].a + "</div>";
                    var bottom = "<div class='morris-hover-point' style='color: #7A92A3'>" + "Average: " + options.data[index].b + "</div>";
                    return top + middle + bottom;

                }
            });

        });
</script>

<!-- ADD THE CLASS layout-boxed TO GET A BOXED LAYOUT -->
<body class="hold-transition skin-blue layout-boxed sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <%@include file="common/html/doctorNavigation.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Dashboard
                <small>This is the dashboard</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>

        <!--header statistic-->
        <section class="content">

            <div class="callout callout-danger">
                <h4>Critical!</h4>
                <p>Mr Lim Chong Kuo's heart beat ...</p>
            </div>

            <div class="row">

                <div class="col-md-4">
                    <div class="info-box bg-red">
                        <span class="info-box-icon"><i class="fa fa-exclamation"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text">Critical Patients</span>
                            <span class="info-box-number">18</span>
                            <!-- The progress section is optional -->
                            <%--<div class="progress">--%>
                                <%--<div class="progress-bar" style="width: 70%"></div>--%>
                            <%--</div>--%>
                            <%--<span class="progress-description">--%>
      <%--70% Increase in 30 Days--%>
    <%--</span>--%>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-blue">
                        <span class="info-box-icon"><i class="fa fa-calendar-o"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text">Appointments Today</span>
                            <span class="info-box-number">8</span>
                            <!-- The progress section is optional -->
                            <%--<div class="progress">--%>
                                <%--<div class="progress-bar" style="width: 70%"></div>--%>
                            <%--</div>--%>
                            <%--<span class="progress-description">--%>
      <%--70% Increase in 30 Days--%>
    <%--</span>--%>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="info-box bg-yellow">
                        <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>
                        <div class="info-box-content">
                            <span class="info-box-text">---</span>
                            <span class="info-box-number">---</span>
                            <!-- The progress section is optional -->
                            <%--<div class="progress">--%>
                                <%--<div class="progress-bar" style="width: 70%"></div>--%>
                            <%--</div>--%>
                            <%--<span class="progress-description">--%>
      <%--70% Increase in 30 Days--%>
    <%--</span>--%>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                </div>

            </div>

            <%--main-content--%>
            <div class="row">
                <div class="col-md-8">
                    <!-- Default box -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">My Schedule</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"
                                        data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"
                                        data-toggle="tooltip" title="Remove">
                                    <i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div id="calendar"></div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!--endbox-->

                    <%--<div class="box">--%>
                        <%--<div class="box-header with-border">--%>
                            <%--<h3 class="box-title">Title</h3>--%>

                            <%--<div class="box-tools pull-right">--%>
                                <%--<button type="button" class="btn btn-box-tool" data-widget="collapse"--%>
                                        <%--data-toggle="tooltip" title="Collapse">--%>
                                    <%--<i class="fa fa-minus"></i></button>--%>
                                <%--<button type="button" class="btn btn-box-tool" data-widget="remove"--%>
                                        <%--data-toggle="tooltip" title="Remove">--%>
                                    <%--<i class="fa fa-times"></i></button>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="box-body">--%>
                            <%--Start creating your amazing application!--%>
                        <%--</div>--%>
                        <%--<!-- /.box-body -->--%>
                        <%--<div class="box-footer">--%>
                            <%--Footer--%>
                        <%--</div>--%>
                        <%--<!-- /.box-footer-->--%>
                    <%--</div>--%>
                    <%--<!-- /.box -->--%>
                </div>
                <!--endbox-->

                <%--Critcal Patients--%>
                <div class="col-md-4">

                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title"><a href="#">Mr Lim Wee Shong</a></h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"
                                        data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"
                                        data-toggle="tooltip" title="Remove">
                                    <i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            Critical Status
                            <div id="heart-beat-chart"></div>
                            <%--<div class="demo-container">--%>
                                <%--<div id="placeholder" class="demo-placeholder" style="padding: 0; position: relative;">--%>
                                    <%--<canvas class="flot-base" width="200" height="200"></canvas>--%>
                                    <%--<div class="flot-text"--%>
                                         <%--style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; font-size: smaller; color: rgb(84, 84, 84);">--%>
                                        <%--<div class="flot-y-axis flot-y1-axis yAxis y1Axis"--%>
                                             <%--style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; display: block;">--%>
                                            <%--<div class="flot-tick-label tickLabel"--%>
                                                 <%--style="position: absolute; top: 397px; left: 14px; text-align: right;">--%>
                                                <%--0--%>
                                            <%--</div>--%>
                                            <%--<div class="flot-tick-label tickLabel"--%>
                                                 <%--style="position: absolute; top: 318px; left: 8px; text-align: right;">--%>
                                                <%--20--%>
                                            <%--</div>--%>
                                            <%--<div class="flot-tick-label tickLabel"--%>
                                                 <%--style="position: absolute; top: 238px; left: 8px; text-align: right;">--%>
                                                <%--40--%>
                                            <%--</div>--%>
                                            <%--<div class="flot-tick-label tickLabel"--%>
                                                 <%--style="position: absolute; top: 159px; left: 8px; text-align: right;">--%>
                                                <%--60--%>
                                            <%--</div>--%>
                                            <%--<div class="flot-tick-label tickLabel"--%>
                                                 <%--style="position: absolute; top: 79px; left: 8px; text-align: right;">80--%>
                                            <%--</div>--%>
                                            <%--<div class="flot-tick-label tickLabel"--%>
                                                 <%--style="position: absolute; top: 0; left: 2px; text-align: right;">100--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<canvas class="flot-overlay" width="818" height="413"--%>
                                            <%--style="direction: ltr; position: absolute; left: 0; top: 0; width: 818px; height: 413px;"></canvas>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                    <%--<div class="box box-danger">--%>
                        <%--<div class="box-header with-border">--%>
                            <%--<h3 class="box-title"><a href="#">Mr Kelvin Tan</a></h3>--%>

                            <%--<div class="box-tools pull-right">--%>
                                <%--<button type="button" class="btn btn-box-tool" data-widget="collapse"--%>
                                        <%--data-toggle="tooltip" title="Collapse">--%>
                                    <%--<i class="fa fa-minus"></i></button>--%>
                                <%--<button type="button" class="btn btn-box-tool" data-widget="remove"--%>
                                        <%--data-toggle="tooltip" title="Remove">--%>
                                    <%--<i class="fa fa-times"></i></button>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="box-body">--%>
                            <%--Critical Status--%>
                            <%--<div id="placeholder2" class="demo-placeholder" style="padding: 0; position: relative;">--%>
                                <%--<canvas class="flot-base" width="200" height="200"></canvas>--%>
                                <%--<div class="flot-text"--%>
                                     <%--style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; font-size: smaller; color: rgb(84, 84, 84);">--%>
                                    <%--<div class="flot-y-axis flot-y1-axis yAxis y1Axis"--%>
                                         <%--style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; display: block;">--%>
                                        <%--<div class="flot-tick-label tickLabel"--%>
                                             <%--style="position: absolute; top: 397px; left: 14px; text-align: right;">0--%>
                                        <%--</div>--%>
                                        <%--<div class="flot-tick-label tickLabel"--%>
                                             <%--style="position: absolute; top: 318px; left: 8px; text-align: right;">20--%>
                                        <%--</div>--%>
                                        <%--<div class="flot-tick-label tickLabel"--%>
                                             <%--style="position: absolute; top: 238px; left: 8px; text-align: right;">40--%>
                                        <%--</div>--%>
                                        <%--<div class="flot-tick-label tickLabel"--%>
                                             <%--style="position: absolute; top: 159px; left: 8px; text-align: right;">60--%>
                                        <%--</div>--%>
                                        <%--<div class="flot-tick-label tickLabel"--%>
                                             <%--style="position: absolute; top: 79px; left: 8px; text-align: right;">80--%>
                                        <%--</div>--%>
                                        <%--<div class="flot-tick-label tickLabel"--%>
                                             <%--style="position: absolute; top: 0; left: 2px; text-align: right;">100--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<canvas class="flot-overlay" width="818" height="413"--%>
                                        <%--style="direction: ltr; position: absolute; left: 0; top: 0; width: 818px; height: 413px;"></canvas>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<!-- /.box-body -->--%>
                    <%--</div>--%>
                    <!-- /.box -->

                </div>
            </div>

        </section>

        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <%@include file="common/html/footer.html" %>

    <!-- Add the sidebar's background. This div must be placed
   immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


<script type="text/javascript">

    $(function () {

        // We use an inline data source in the example, usually data would
        // be fetched from a server

        var data = [],
            totalPoints = 300;

        function getRandomData() {

            if (data.length > 0)
                data = data.slice(1);

            // Do a random walk

            while (data.length < totalPoints) {

                var prev = data.length > 0 ? data[data.length - 1] : 50,
                    y = prev + Math.random() * 10 - 5;

                if (y < 0) {
                    y = 0;
                } else if (y > 100) {
                    y = 100;
                }

                data.push(y);
            }

            // Zip the generated y values with the x values

            var res = [];
            for (var i = 0; i < data.length; ++i) {
                res.push([i, data[i]])
            }

            return res;
        }

        // Set up the control widget

        var updateInterval = 30;
        $("#updateInterval").val(updateInterval).change(function () {
            var v = $(this).val();
            if (v && !isNaN(+v)) {
                updateInterval = +v;
                if (updateInterval < 1) {
                    updateInterval = 1;
                } else if (updateInterval > 2000) {
                    updateInterval = 2000;
                }
                $(this).val("" + updateInterval);
            }
        });

        var plot = $.plot("#placeholder", [getRandomData()], {
            series: {
                shadowSize: 0 // Drawing is faster without shadows
            },
            yaxis: {
                min: 0,
                max: 100
            },
            xaxis: {
                show: false
            }
        });

        var plot2 = $.plot("#placeholder2", [getRandomData()], {
            series: {
                shadowSize: 0 // Drawing is faster without shadows
            },
            yaxis: {
                min: 0,
                max: 100
            },
            xaxis: {
                show: false
            }
        });

        function update() {

            plot.setData([getRandomData()]);
            plot2.setData([getRandomData()]);
            // Since the axes don't change, we don't need to call plot.setupGrid()

            plot.draw();
            plot2.draw();
            setTimeout(update, updateInterval);
        }

        update();


    });

</script>
</body>

</html>
