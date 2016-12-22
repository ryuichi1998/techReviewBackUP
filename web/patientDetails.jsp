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
<%@page import="Entity.*" %>
<%@ page import="java.util.List" %>
<%@ page import="Utils.DateFormatter" %>
<%
    Staff doctor = (Staff) session.getAttribute("person");
    Patient patient = (Patient) request.getAttribute("patient");

    List<ConsultationRecord> consultationRecordList = (List<ConsultationRecord>) request.getAttribute("consultationList");
    ConsultationRecord latestConsulationRecord = consultationRecordList.get(consultationRecordList.size() - 1);
    List<Medication> medicationList = (List<Medication>) latestConsulationRecord.getMedicationsByConsultationId();

    List<Medication> currentMedicationList = (List<Medication>) request.getAttribute("currentMedicationList");

    List<FamilyMedicalBackground> familyMedicalBackgroundList = (List<FamilyMedicalBackground>) request.getAttribute("familyMedicalBackgroundList");
%>

<%@include file="common/html/scripts.html" %>

<%--morris chart--%>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>

<script type="text/javascript">

    function viewConsultationDetails(parameters) {
        var consultationDiagnosis = document.getElementById("consultationDiagnosis");
        var consultationComment = document.getElementById("consultationComment");
        var medicationPrescribed = document.getElementById("medicationPrescribed");

        $.ajax({
            type: "GET",
            url: "http://localhost:8080/services/consultation/" + parameters,
            success: function (data) {
                consultationDiagnosis.textContent = data.diagnosis;
                consultationComment.textContent = data.comment;
                console.log(data.medications[0]);
                $("#medicationPrescribed tbody").html("");
                for (i in data.medications) {
                    $("#medicationPrescribed tbody").append("<tr><td>" + data.medications[i].medicationName
                        + "</td><td>" + data.medications[i].dose
                        + "</td><td>" + data.medications[i].freq
                        + "</td><td>" + data.medications[i].quantity
                        + "</td><td>" + data.medications[i].instruction + "</td></tr>");
                }
            }
        });
    }

    $(document).ready(function () {

        var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "June",
            "July", "Aug", "Sep", "Oct", "Nov", "Dec"];

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
                var top = "<div class='morris-hover-row-label'>" + monthNames[options.data[index].y.substring(6, 7)] + " " + options.data[index].y.substring(8, 10) + "</div>";
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
                var top = "<div class='morris-hover-row-label'>" + monthNames[options.data[index].y.substring(6, 7)] + " " + options.data[index].y.substring(8, 10) + "</div>";
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
                var top = "<div class='morris-hover-row-label'>" + monthNames[options.data[index].y.substring(6, 7)] + " " + options.data[index].y.substring(8, 10) + "</div>";
                var middle = "<div class='morris-hover-point' style='color: #0b62a4'>" + "Actual: " + options.data[index].a + "</div>";
                var bottom = "<div class='morris-hover-point' style='color: #7A92A3'>" + "Average: " + options.data[index].b + "</div>";
                return top + middle + bottom;

            }
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
                <small><%=patient.getName()%>
                </small>
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
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#myDetailsTab" data-toggle="tab">Patient Details</a></li>
                            <li><a href="#nextOfKinTab" data-toggle="tab">Next-Of-Kin</a></li>
                            <li><a href="#familyMedicalBackgroundTab" data-toggle="tab">Family Medical Background</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="myDetailsTab">
                                <div class="row">

                                    <div class="col-md-4">

                                        <dl>

                                            <dt>
                                                NRIC:
                                            </dt>
                                            <dd>
                                                <%=patient.getNric()%>
                                            </dd>

                                            <dt>Phone No:</dt>
                                            <dd><%=patient.getPhoneNumber()%>
                                            </dd>

                                            <dt>Email:</dt>
                                            <dd><%=patient.getEmail()%>
                                            </dd>

                                            <dt>Citizenship:</dt>
                                            <dd><%=patient.getCitizenship()%>
                                            </dd>

                                            <dt>Langauge:</dt>
                                            <dd><%=patient.getLanguage()%>
                                            </dd>

                                        </dl>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="row">

                                            <div class="col-md-6">

                                                <div class="info-box">
                                        <span class="info-box-icon bg-yellow">
                                            <i class="glyphicon glyphicon-scale"></i>
                                        </span>

                                                    <div class="info-box-content">
                                                        <span class="info-box-text">Weight</span>
                                                        <span class="info-box-number"><%=patient.getWeight()%> KG</span>
                                                    </div>

                                                </div>
                                                <div class="info-box">
                                        <span class="info-box-icon bg-yellow">
                                            <i class="ion ion-ios-body"></i>
                                        </span>

                                                    <div class="info-box-content">
                                                        <span class="info-box-text">Height</span>
                                                        <span class="info-box-number"><%=patient.getHeight()%> CM</span>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-md-6">

                                                <div class="info-box">
                                                            <span class="info-box-icon bg-red"><i
                                                                    class="ion ion-heart"></i></span>
                                                    <div class="info-box-content">
                                                        <span class="info-box-text">Blood Type</span>
                                                        <span class="info-box-number"><%=patient.getBloodType()%></span>

                                                    </div>
                                                    <!-- /.info-box-content -->
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                            </div>
                            <%--/.myDetailstab--%>
                            <div class="tab-pane" id="nextOfKinTab">
                                <dl>
                                    <dt>Name:</dt>
                                    <dd><%=patient.getNokName()%>
                                    </dd>
                                    <dt>Relationship:</dt>
                                    <dd><%=patient.getNokRelation()%>
                                    </dd>
                                    <dt>Phone No:</dt>
                                    <dd><%=patient.getNokPhoneNumber()%>
                                    </dd>
                                    <dt>Email:</dt>
                                    <dd><%=patient.getNokEmail()%>
                                    </dd>
                                </dl>
                            </div>
                            <%--/.nextOfKinTab--%>
                            <div class="tab-pane table-responsive" id="familyMedicalBackgroundTab">
                                <table class="table">
                                    <thead>
                                    <th>No.</th>
                                    <th>Relative</th>
                                    <th>Condition</th>
                                    </thead>
                                    <tbody>
                                    <%
                                        int count = 0;
                                        for (FamilyMedicalBackground familyMedicalBackground : familyMedicalBackgroundList) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%>
                                        </td>
                                        <td><%=familyMedicalBackground.getRelativeRelationship()%>
                                        </td>
                                        <td><%=familyMedicalBackground.getConditionName()%>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--end of details row--%>

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
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active box-title"><a href="#consultationTab" data-toggle="tab">Consultation
                                Record</a></li>
                            <li class="box-title"><a href="#currentMedicationTab" data-toggle="tab">Current
                                Medication</a></li>
                        </ul>
                        <%--tab nav--%>
                        <div class="tab-content">
                            <div class="tab-pane active" id="consultationTab">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-9 col-sm-12">
                                            <div class="row"> 
                                                <div class="col-md-12">
                                                    <button type="button"
                                                            class="btn btn-primary pull-right">Amend
                                                        Appointment 
                                                    </button>
                                                     
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <span id="appointmentDate" class="pull-left">Next Appointment Date: 02 Jan 2017</span> 
                                                     
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="pull-right">By <em>Dr <%=doctor.getName()%></em> on <em><%=DateFormatter.convertToDisplayDateTime(latestConsulationRecord.getDateTime())%></em></span> 
                                                      
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="box box-primary box-solid">
                                                        <div class="box-header">
                                                            <h3 class="box-title">Basic Information</h3>
                                                        </div>

                                                        <%--/.consultation record header--%>
                                                        <div class="box-body">

                                                            <%--<h5 class="consultationSubTitle text-center">Measurements</h5>--%>
                                                            <div class="table-responsive">
                                                                <table class="table"
                                                                       id="basicInformationTable">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td class="description-text">
                                                                            Height
                                                                        </td>
                                                                        <td class="description-text">
                                                                            183CM
                                                                        </td>
                                                                    </tr>
                                                                    <tr>

                                                                        <td class="description-text">
                                                                            Weight
                                                                        </td>
                                                                        <td class="description-text">
                                                                            78KG
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>


                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="box box-primary box-solid">
                                                        <div class="box-header">
                                                            <h3 class="box-title">Consultation Details</h3>
                                                        </div>

                                                        <div class="box-body">
                                                            <dl>
                                                                <dt>Diagnosis:</dt>
                                                                <dd id="consultationDiagnosis"><%=latestConsulationRecord.getDiagnosis()%>
                                                                </dd>
                                                                <dt>Comments:</dt>
                                                                <dd id="consultationComment"><%=latestConsulationRecord.getComment()%>
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                    </div>

                                                    <div class="box box-primary box-solid">
                                                        <div class="box-header">
                                                            <h3 class="box-title">Medication Prescribed</h3>
                                                        </div>

                                                        <div class="box-body">
                                                            <div class="table-responsive">
                                                                <table class="table" id="medicationPrescribed">
                                                                    <thead>
                                                                    <th>
                                                                        Medications
                                                                    </th>
                                                                    <th>
                                                                        Dose
                                                                    </th>
                                                                    <th>
                                                                        Frequency
                                                                    </th>
                                                                    <th>
                                                                        Quantity
                                                                    </th>
                                                                    <th>
                                                                        Further Instruction
                                                                    </th>
                                                                    </thead>
                                                                    <tbody>
                                                                    <%
                                                                        for (Medication medication : medicationList) {
                                                                    %>
                                                                    <tr>
                                                                        <td>
                                                                            <%=medication.getProductByProductId().getProductName()%>
                                                                        </td>
                                                                        <td>
                                                                            <%=medication.getDosage()%> <%=medication.getProductByProductId().getProductUnit()%>
                                                                        </td>
                                                                        <td>
                                                                            <%=medication.getFrequency()%>
                                                                        </td>
                                                                        <td>
                                                                            <%=medication.getQuantity()%>
                                                                        </td>
                                                                        <td>
                                                                            <%=medication.getRemarks()%>
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-12">
                                            <div class="box box-primary box-solid">
                                                <div class="box-header">
                                                    <h3 class="box-title">Other Consultation Records</h3>
                                                </div>
                                                <div class="box-body">
                                                    <div class="input-group col-md-12">
                                                        <input type="text" class="form-control input-sm"
                                                               placeholder="Search...">
                                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                                    </div>
                                                    <div class="table-responsive">
                                                        <table class="table table-hover"
                                                               id="consultationListTable">
                                                            <thead>
                                                            <th>
                                                                Consultation
                                                            </th>
                                                            <th>
                                                                Date
                                                            </th>
                                                            </thead>
                                                            <tbody>
                                                            <%
                                                                for (int i = (consultationRecordList.size() - 1); i >= 0; i--) {
                                                                    ConsultationRecord consultationRecord = consultationRecordList.get(i);
                                                            %>
                                                            <tr>
                                                                <td>
                                                                    <a href="javascript:;"
                                                                       onclick="viewConsultationDetails(<%=consultationRecord.getConsultationId()%>);"><%=consultationRecord.getDiagnosis()%>
                                                                    </a>
                                                                    <br>
                                                                    <small><em>with
                                                                        Dr <%=consultationRecord.getStaffByDoctorInCharge().getName()%>
                                                                    </em>
                                                                    </small>
                                                                </td>
                                                                <td>
                                                                    <i class="fa fa-fw fa-clock-o"></i>
                                                                    <small class=""><%=DateFormatter.convertToDisplayDateTime(consultationRecord.getDateTime())%>
                                                                    </small>
                                                                </td>
                                                            </tr>
                                                            <%
                                                                }
                                                            %>

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--/.consultationTab--%>
                            <div class="tab-pane" id="currentMedicationTab">
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
                                        <%
                                            for (Medication currentMedication : currentMedicationList) {
                                        %>
                                        <tr>
                                            <td>
                                                <%=currentMedication.getProductByProductId().getProductName()%>
                                            </td>
                                            <td>
                                                <%=currentMedication.getDosage()%> <%=currentMedication.getProductByProductId().getProductUnit()%>
                                            </td>
                                            <td>
                                                <%=currentMedication.getFrequency()%>
                                            </td>
                                            <td>
                                                <%=currentMedication.getQuantity()%>
                                            </td>
                                            <td>
                                                <%=currentMedication.getConsultationrecordByConsultationid().getDiagnosis()%>
                                            </td>
                                            <td>
                                                Dr <%=currentMedication.getConsultationrecordByConsultationid().getStaffByDoctorInCharge().getName()%>
                                            </td>
                                            <td>Since
                                                <br><em><%=DateFormatter.convertToDisplayDateTime(currentMedication.getConsultationrecordByConsultationid().getDateTime())%>
                                                </em></td>
                                            <td>
                                                <%=currentMedication.getRemarks()%>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>

                                        </tbody>
                                    </table>
                                    <%--currentMedicationTable--%>
                                </div>
                                <%--currentMedicationTableDiv--%>
                            </div>
                            <%--/.currentMedicationTab--%>
                        </div>
                        <%--/.tab content--%>
                    </div>
                    <%--/.tab--%>
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