<%--
  Created by IntelliJ IDEA.
  User: liyun
  Date: 11/12/16
  Time: 2:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <Title>Patient Overview</Title>
    <%@include file="common/html/commonLinks.html" %>
    <link rel="stylesheet" href="css/patientOverview.css">
</head>
<%@include file="common/html/scripts.html" %>
<script src="javascripts/patientOverview.js"></script>

<%@page import="Entity.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="Utils.ConstantValues" %>
<%
    List<Patient> patientList = (List<Patient>) session.getAttribute("patientList");
    HashMap<String, List<VitalSigns>> avgPatientVitalSignMap = (HashMap<String, List<VitalSigns>>) session.getAttribute("avgPatientVitalSignMap");
    List<VitalSigns> patientVitalSign;
    String heartBeatRate = "-";
    String bloodPressure = "-";
    String glucoseLevel = "-";
%>

<body class="hold-transition skin-blue fixed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/doctorNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                Patient Overview
                <small>Total: <%=patientList.size()%> Patients</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Patient Overview</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content">

            <%--<div class="row">--%>
                <%--<div class="col-md-12">--%>
                    <%--<div class="box box-solid">--%>
                        <%--<div class="box-body">--%>
                            <%--<div class="input-group col-md-6">--%>
                                <%--<input type="text" class="form-control input-sm"--%>
                                       <%--placeholder="Search...">--%>
                                <%--<span class="glyphicon glyphicon-search form-control-feedback"></span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--&lt;%&ndash;/.box body&ndash;%&gt;--%>
                    <%--</div>--%>
                    <%--&lt;%&ndash;/.box&ndash;%&gt;--%>
                <%--</div>--%>
                <%--&lt;%&ndash;/.col-md-12&ndash;%&gt;--%>
            <%--</div>--%>
            <%--&lt;%&ndash;/.row - search&ndash;%&gt;--%>

            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-body table-responsive">
                            <table class="table table-hover table-striped patient-list" id="patientList">
                                <thead>
                                <th>
                                    <span>Patient</span>
                                </th>
                                <th>
                                    <span>Heart Beat Rate</span>
                                </th>
                                <th>
                                    <span>Blood Pressure</span>
                                </th>
                                <th>
                                    <span>Glucose Level</span>
                                </th>
                                <th>
                                    <span>Status</span>
                                </th>
                                </thead>
                                <%--/.thead--%>
                                <tbody>

                                <%
                                    for (Patient patient : patientList) {
                                        System.out.println(patient.getPatientId());
                                        patientVitalSign = avgPatientVitalSignMap.get(patient.getPatientId());
                                        for(int i=0;i<patientVitalSign.size();i++){
                                            if(patientVitalSign.get(i).getType().equals(ConstantValues.HEART_BEAT_TYPE)){
                                                heartBeatRate = String.valueOf(patientVitalSign.get(i).getData());
                                            }else if(patientVitalSign.get(i).getType().equals(ConstantValues.BLOOD_PRESSURE_TYPE)){
                                                bloodPressure = String.valueOf(patientVitalSign.get(i).getData());
                                            }else
                                                glucoseLevel = String.valueOf(patientVitalSign.get(i).getData());
                                        }
                                %>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="col-md-3 col-sm-5 col-xs-12">
                                                <img src="common/images/defaultIcon.png" alt="Name">
                                            </div>
                                            <div class="col-md-9 col-sm-7 col-xs-12">
                                                <h4><a href="/patientDetails?patientId=<%=patient.getPatientId()%>" class="user-link"><%=patient.getName()%></a></h4>
                                                <span>Blood Type: <%=patient.getBloodType()%></span><br>
                                                <span>Weight: <%=patient.getWeight()%></span><br>
                                                <span>Height: <%=patient.getHeight()%></span>
                                            </div>
                                        </div>
                                    </td>
                                    <%--/.name col--%>
                                    <td class="data">
                                        <h4><strong><%=heartBeatRate%><br></strong></h4>
                                        <span class="unit">bpm</span>
                                    </td>
                                    <%--/.heart beat col--%>
                                    <td class="data">
                                        <h4><strong><%=bloodPressure%><br></strong></h4>
                                        <span class="unit">mmHg</span>
                                    </td>
                                    <%--/.blood pressure col--%>
                                    <td class="data">
                                        <h4><strong><%=glucoseLevel%><br></strong></h4>
                                        <span class="unit">mmol/L</span>
                                    </td>
                                    <%--/.glucose level col--%>
                                    <td>
                                        <a href="#" class="table-link">
                                            <span class="label label-warning">
                                                <i class="fa fa-exclamation-circle" id="status"></i>
                                            </span>
                                        </a>
                                    </td>
                                    <%--/.status col--%>
                                </tr>
                                <%--/.tr--%>
                                <%
                                    }
                                %>

                                </tbody>
                                <%--/.tbody--%>
                            </table>
                        </div>
                        <%--/.box-body--%>
                    </div>
                    <%--/.box--%>
                </div>
                <%--/.col-md-12--%>
            </div>
            <%--/.row - all patients--%>

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
