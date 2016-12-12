<%--
  Created by IntelliJ IDEA.
  User: liyun
  Date: 11/12/16
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="common/html/commonLinks.html" %>
    <%--morris chart--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
</head>
<%@include file="common/html/scripts.html" %>

<%--morris chart--%>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>

<script type="text/javascript">

    $(document).ready(function () {

        $(window).resize(function () {
            heartBeatChart.redraw();
        })

        var heartBeatChart = Morris.Line({
            element: 'heart-beat-chart',
            data: [
                {y: '2006', a: 100, b: 90},
                {y: '2007', a: 75, b: 65},
                {y: '2008', a: 50, b: 40},
                {y: '2009', a: 75, b: 65},
                {y: '2010', a: 50, b: 40},
                {y: '2011', a: 75, b: 65},
                {y: '2012', a: 100, b: 90}
            ],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['Series A', 'Series B']
        });
        Morris.Line({
            element: 'blood-pressure-chart',
            data: [
                {y: '2006', a: 100, b: 90},
                {y: '2007', a: 75, b: 65},
                {y: '2008', a: 50, b: 40},
                {y: '2009', a: 75, b: 65},
                {y: '2010', a: 50, b: 40},
                {y: '2011', a: 75, b: 65},
                {y: '2012', a: 100, b: 90}
            ],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['Series A', 'Series B']
        });
        Morris.Line({
            element: 'glucose-level-chart',
            data: [
                {y: '2006', a: 100, b: 90},
                {y: '2007', a: 75, b: 65},
                {y: '2008', a: 50, b: 40},
                {y: '2009', a: 75, b: 65},
                {y: '2010', a: 50, b: 40},
                {y: '2011', a: 75, b: 65},
                {y: '2012', a: 100, b: 90}
            ],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['Series A', 'Series B']
        });
    })

</script>

<body class="hold-transition skin-blue layout-boxed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/doctorNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                Patient Details
                <small>Patient Name</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"><i class="fa fa-dashboard"></i> Patients</a></li>
                <li class="active">Patient Details</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content">

            <div class="row">
                <div class="col-md-12" id="profile-div">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">My Details</h3>
                        </div>
                        <div class="box-body">
                            <dl class="dl-horizontal">

                                <dt>
                                    NRIC:
                                </dt>
                                <dd>
                                    person.getNric()
                                </dd>

                                <dt>Phone No:</dt>
                                <dd>person.getPhoneNumber()
                                </dd>

                                <dt>Email:</dt>
                                <dd>person.getEmail()
                                </dd>

                                <dt>Citizenship:</dt>
                                <dd>person.getCitizenship()
                                </dd>

                                <dt>Langauge:</dt>
                                <dd>person.getLanguage()
                                </dd>

                            </dl>

                        </div>
                        <%--./box-body--%>
                    </div>
                    <%--./box--%>
                </div>
                <%--./col-12--%>
            </div>
            <%--end of details row--%>

            <div class="row">

                <div class="col-md-4 col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            Heart Beat Chart
                        </div>
                        <%--heart beat rate header--%>
                        <div class="box-body chart-responsive">
                            <div id="heart-beat-chart"></div>
                        </div>
                        <%--/.heartbeat rate box--%>
                    </div>
                    <%--/.heart beat rate box--%>
                </div>
                <%--/.heart beat rate col--%>
                <div class="col-md-4 col-xs-12">
                    <div id="blood-pressure-chart"></div>
                </div>
                <%--/.blood pressure graph--%>
                <div class="col-md-4 col-xs-12">
                    <div id="glucose-level-chart"></div>
                </div>
                <%--/.glucose level graph--%>

            </div>
            <%--/.Vital Sign Graph--%>

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
