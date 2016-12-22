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

<body class="hold-transition skin-blue layout-boxed sidebar-mini">

<div class="wrapper">

    <%--Navigation - please copy paste this file and edit to ur content--%>
    <%@include file="common/html/patientNavigation.jsp" %>

    <%--Content Wrapper    --%>
    <div class="content-wrapper">

        <%--Content Header--%>
        <section class="content-header">
            <h1>
                Patient Details
                <small>
                    <%--<%=patient.getName()%>--%>
                </small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">My Medical Records</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content">


            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active box-title"><a href="#consultationTab" data-toggle="tab">Consultation
                                Record</a></li>
                            <li class="box-title"><a href="#familyMedicalBackgroundTab" data-toggle="tab">Family Medical
                                Background</a></li>
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
                                                    <span class="pull-right">By <em>Dr Cindy <Chia></Chia></em> on <em>03 Oct 2016 21:46:00</em></span> 
                                                      
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
                                                                <dd>Coronary Artery Disease
                                                                </dd>
                                                                <dt>Comments:</dt>
                                                                <dd>Electrocardiograph test, exercise stress test.
                                                                    Follow up with 3 months
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
                                                                <table class="table table-hover">
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
                                                                    <tr>
                                                                        <td>Panadol</td>
                                                                        <td>2 Grams (gm)</td>
                                                                        <td>every day</td>
                                                                        <td>3 Month</td>
                                                                        <td>Not to eat panadol when having the
                                                                            medication
                                                                        </td>
                                                                    </tr>
                                                                    <%--  <%
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
                                                                      %>--%>
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
                                                            <tr>
                                                                <td><a>Hypertension</a>
                                                                    <br>
                                                                    <small><em>Dr Cindy Chia</em></small>
                                                                </td>
                                                                <td>
                                                                    <i class="fa fa-fw fa-clock-o"></i>
                                                                    <small>14 May 2016 22:03:20</small>
                                                                </td>
                                                            </tr>
                                                            <%--<%
                                                                for (ConsultationRecord consultationRecord : consultationRecordList) {
                                                            %>
                                                            <tr>
                                                                <td>
                                                                    <a><%=consultationRecord.getDiagnosis()%>
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
--%>
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
                            <div class="tab-pane" id="familyMedicalBackgroundTab">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <th>No.</th>
                                        <th>Relative</th>
                                        <th>Condition</th>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Paternal Uncle</td>
                                            <td>Hemophilia</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Father</td>
                                            <td>Hepatitis B</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Materal Auntie</td>
                                            <td>Familial Hypercholesterolemia</td>
                                        </tr>
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