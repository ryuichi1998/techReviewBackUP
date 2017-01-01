<%--
  Created by IntelliJ IDEA.
  User: liyun
  Date: 11/12/16
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%--morris chart--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
    <%@include file="common/html/commonLinks.html" %>
    <link rel="stylesheet" href="css/patientDetails.css">
</head>
<%--<%@page import="Entity.*" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%@ page import="Utils.DateFormatter" %>
<%--<%--%>
<%--Staff doctor = (Staff) session.getAttribute("person");--%>
<%--Patient patient = (Patient) request.getAttribute("patient");--%>

<%--List<ConsultationRecord> consultationRecordList = (List<ConsultationRecord>) request.getAttribute("consultationList");--%>
<%--ConsultationRecord latestConsulationRecord = consultationRecordList.get(consultationRecordList.size() - 1);--%>
<%--List<Medication> medicationList = (List<Medication>) latestConsulationRecord.getMedicationsByConsultationId();--%>

<%--List<Medication> currentMedicationList = (List<Medication>) request.getAttribute("currentMedicationList");--%>
<%--%>--%>

<%@include file="common/html/scripts.html" %>

<%--morris chart--%>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>

<script type="text/javascript">

    $(document).ready(function () {

        $("#authorise").on("click", function () {
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/services/fitbit",
                success: function () {
                    alert("success ");
                },
                error: function () {
                    alert("Error");
                }
            })
        });

        $(window).resize(function () {
//            to resize the chart
            heartBeatChart.redraw();
            bloodPressureChart.redraw();
            glucoseLevelChart.redraw();
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
                var top = "<div class='morris-hover-row-label'>" + options.data[index].y.substring(5) + "</div>";
                var middle = "<div class='morris-hover-point' style='color: #0b62a4'>" + "Actual: " + options.data[index].a + "</div>";
                var bottom = "<div class='morris-hover-point' style='color: #7A92A3'>" + "Average: " + options.data[index].b + "</div>";
                return top + middle + bottom;

            }
        });
        var bloodPressureChart = Morris.Line({
            element: 'blood-pressure-chart',
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
                var top = "<div class='morris-hover-row-label'>" + options.data[index].y.substring(5) + "</div>";
                var middle = "<div class='morris-hover-point' style='color: #0b62a4'>" + "Actual: " + options.data[index].a + "</div>";
                var bottom = "<div class='morris-hover-point' style='color: #7A92A3'>" + "Average: " + options.data[index].b + "</div>";
                return top + middle + bottom;

            }
        });
        var glucoseLevelChart = Morris.Line({
            element: 'glucose-level-chart',
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
                var top = "<div class='morris-hover-row-label'>" + options.data[index].y.substring(5) + "</div>";
                var middle = "<div class='morris-hover-point' style='color: #0b62a4'>" + "Actual: " + options.data[index].a + "</div>";
                var bottom = "<div class='morris-hover-point' style='color: #7A92A3'>" + "Average: " + options.data[index].b + "</div>";
                return top + middle + bottom;

            }
        });
    })

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
                Dashboard
                <small>
                    <%--<%=patient.getName()%>--%>
                </small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content">


            <div class="row">
                <div class="col-md-4 pull-right">
                    <a class="pull-right btn btn-block btn-primary"
                       href="http://localhost:8080/services/fitbit">Click</a>
                <%--<a class="pull-right btn btn-block btn-primary"--%>
                       <%--href="https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=2287JM&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fservices%2Ffitbit%2Fcallback&scope=heartrate&expires_in=604800">Click</a>--%>
                </div>
            </div>

            <div class="row">

                <div class="col-md-4 col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Heart Beat Chart</h3>
                        </div>
                        <%--/.heart beat rate header--%>
                        <div class="box-body">
                            <div id="heart-beat-chart"></div>
                        </div>
                        <%--/.heartbeat rate body--%>
                        <div class="box-footer">
                            <div class="row">
                                <div class="col-md-4">

                                    <div class="description-block border-right">
                                        <h5 class="description-header">Max</h5>
                                        <span class="description-text">90</span>
                                    </div>
                                </div>
                                <div class="col-md-4">

                                    <div class="description-block border-right">
                                        <h5 class="description-header">Avg</h5>
                                        <span class="description-text">90</span>
                                    </div>

                                </div>
                                <div class="col-md-4">

                                    <div class="description-block">
                                        <h5 class="description-header">Min</h5>
                                        <span class="description-text">90</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--heart beat footer--%>
                    </div>
                    <%--/.heart beat rate box--%>
                </div>
                <%--/.heart beat rate col--%>
                <div class="col-md-4 col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Blood Pressure Chart</h3>

                        </div>
                        <%--/.blood pressure header--%>
                        <div class="box-body">
                            <div id="blood-pressure-chart"></div>
                        </div>
                        <%--/.blood pressure body--%>
                        <div class="box-footer">
                            <div class="row">
                                <div class="col-md-4">

                                    <div class="description-block border-right">
                                        <h5 class="description-header">Max</h5>
                                        <span class="description-text">90</span>
                                    </div>
                                </div>
                                <div class="col-md-4">

                                    <div class="description-block border-right">
                                        <h5 class="description-header">Avg</h5>
                                        <span class="description-text">90</span>
                                    </div>

                                </div>
                                <div class="col-md-4">

                                    <div class="description-block border-right">
                                        <h5 class="description-header">Min</h5>
                                        <span class="description-text">90</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--/.blood pressure footer--%>
                    </div>
                    <%--blood pressure box--%>
                </div>
                <%--/.blood pressure graph--%>
                <div class="col-md-4 col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Glucose Level Chart</h3>
                        </div>
                        <%--/.glucose level header--%>
                        <div class="box-body">
                            <div id="glucose-level-chart"></div>
                        </div>
                        <%--/.glucose level body--%>
                        <div class="box-footer">
                            <div class="row">
                                <div class="col-md-4">

                                    <div class="description-block border-right">
                                        <h5 class="description-header">Max</h5>
                                        <span class="description-text">90</span>
                                    </div>
                                </div>
                                <div class="col-md-4">

                                    <div class="description-block border-right">
                                        <h5 class="description-header">Avg</h5>
                                        <span class="description-text">90</span>
                                    </div>

                                </div>
                                <div class="col-md-4">

                                    <div class="description-block border-right">
                                        <h5 class="description-header">Min</h5>
                                        <span class="description-text">90</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--/.glucose level footer--%>
                    </div>
                    <%--/.glucose level box--%>
                </div>
                <%--/.glucose level graph--%>
            </div>
            <%--/.Vital Sign Graph--%>

            <div class="row">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">My Appointments</h3>
                        </div>

                        <div class="box-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <th>Date/Time</th>
                                    <th>Services</th>
                                    <th>Location</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>03 Oct 2016 21:46</td>
                                        <td>Check up</td>
                                        <td>Blk N239</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <%--currentMedicationTable--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Current Medications</h3>
                        </div>

                        <div class="box-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <th>Medications</th>
                                    <th>Dose</th>
                                    <th>Frequency</th>
                                    <th>Quantity</th>
                                    <th>Condition</th>
                                    <th>Doctor-In-Charge</th>
                                    <th>Date</th>
                                    <th>Further Instruction</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Panadol</td>
                                        <td>2 Grams (gm)</td>
                                        <td>every day</td>
                                        <td>3 Month</td>
                                        <td>Coronary Artery Disease</td>
                                        <td>Dr John Lee</td>
                                        <td>Since
                                            <em>03 Oct 2016 21:46:00</em></td>
                                        <td>Not to eat panadol when having the
                                            medication
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Aspirin</td>
                                        <td>1 Grams (gm)</td>
                                        <td>as needed</td>
                                        <td>6 Month</td>
                                        <td>Coronary Artery Disease</td>
                                        <td>Dr John Lee</td>
                                        <td>Since
                                            <em>03 Oct 2016 21:46:00</em></td>
                                        <td>Not to eat panadol when having the
                                            medication
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <%--currentMedicationTable--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <%--/.consultation col--%>

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