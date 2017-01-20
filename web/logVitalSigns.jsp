<%--
  Created by IntelliJ IDEA.
  User: liyun
  Date: 31/12/16
  Time: 6:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log Vital Signs</title>
    <%@include file="common/html/commonLinks.html" %>
    <link href="common/template/icon/css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.44/css/bootstrap-datetimepicker.min.css"/>
</head>
<%@include file="common/html/scripts.html" %>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-aria.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-messages.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<%--datetimepicker--%>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.44/js/bootstrap-datetimepicker.min.js"></script>

<script>
    angular
        .module('firstApplication', ['ngMaterial'])
        .controller('sliderController', sliderController);

    function sliderController($scope, $mdSidenav) {
        $scope.color = {
            red: Math.floor(Math.random() * 255),
            green: Math.floor(Math.random() * 255),
            blue: Math.floor(Math.random() * 255)
        };
        $scope.default = {
            systotic: 120,
            diastolic: 80,
            glucose: 5.9
        };
        $scope.rating = 3;
        $scope.disabled = 70;
    }

    $(document).ready(function () {

        var successfulDiv = '<div class="alert alert-success">You have successfully log the data!</div>';
        var errorDiv = '<div class="alert alert-danger">Sorry! Something went wrong!</div>';

        var medicationBPFG = $("#medicationBPFG");
        var foodBPFG = $("#foodBPFG");
        var medicationBPErrorMsgDiv = $("#medicationBPErrorMsgDiv");
        var foodBPErrorMsgDiv = $("#foodBPErrorMsgDiv");

        $('#dateTimeBP').datetimepicker({
            defaultDate: new Date()
        });

        $('#dateTimeGL').datetimepicker({
            defaultDate: new Date()
        });

        $("input[name=medicationBP]").click(function () {
            medicationBPErrorMsgDiv.html('');
            medicationBPFG.removeClass("has-error");
        });

        $("input[name=foodBP]").click(function () {
            foodBPErrorMsgDiv.html('');
            foodBPFG.removeClass("has-error");
        });

        $("#logBPBtn").on("click", function (e) {
            e.preventDefault;

            var logBPFormData = $("#logBPFormData").serialize();

            var isCheckedMedicationBP = $("input[name=medicationBP]:checked").val();
            var isCheckedFoodBP = $("input[name=foodBP]:checked").val();

            if (!isCheckedMedicationBP) {
                alert('Nothing Selected');
                medicationBPErrorMsgDiv.html('<span class="help-block">You can\'t leave this empty</span>');
                medicationBPFG.addClass("has-error");
            }
            if (!isCheckedFoodBP) {
                alert('Nothing Selected');
                foodBPErrorMsgDiv.html('<span class="help-block">You can\'t leave this empty</span>');
                foodBPFG.addClass("has-error");
            }
            if (isCheckedMedicationBP && isCheckedMedicationBP) {
                $.ajax({
                    type: "POST",
                    data: logBPFormData,
                    url: "http://localhost:8080/services/log/bp",
                    success: function () {
                        alert("success");
                        console.log(logBPFormData);
                        $('#messageBPLog').html(successfulDiv).delay(10000).fadeOut();
                    },
                    error: function () {
                        $('#messageBPLog').html(errorDiv).delay(10000).fadeOut();
                    }
                });

            }

        });

        $("#logGLBtn").on("click", function (e) {
            e.preventDefault;

            var logGLFormData = $("#logGLFormData").serialize();

            $.ajax({
                type: "POST",
                data: logGLFormData,
                url: "http://localhost:8080/services/log/gl",
                success: function () {
                    alert("success");
                    console.log(logGLFormData);
                    $('#messageGLLog').html(successfulDiv).delay(10000).fadeOut();
                },
                error: function () {
                    $('#messageGLLog').html(errorDiv).delay(10000).fadeOut();
                }
            });
        })
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
                Log My Vital Signs
                <small>This is the dashboard</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>
        <%--/.content-header--%>

        <section class="content" ng-app="firstApplication">

            <div class="row">

                <div class="col-md-8">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <i class="ion ion-heart"></i>
                            <h3 class="box-title">Blood Pressure</h3>
                        </div>
                        <form class="form-horizontal" id="logBPFormData">
                            <div class="box-body" id="boxBodyBP">

                                <div class="form-group">
                                    <label for="dateTimeBP" class="col-sm-2 control-label">
                                        <i class="mdi mdi-18px mdi-timetable"></i>
                                        When
                                    </label>

                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-clock-o"></i>
                                            </span>
                                            <input type="datetime" class="form-control" id="dateTimeBP"
                                                   name="dateTimeBP"
                                                   placeholder="datetime">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group" id="foodBPFG">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="foodBP" value="Before Food">
                                                <i class="mdi mdi-food mdi-24px"></i>
                                                Before Food
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="foodBP" value="After Food">
                                                <i class="mdi mdi-food-off mdi-24px"></i>
                                                After Food
                                            </label>
                                        </div>
                                        <div id="foodBPErrorMsgDiv"></div>
                                    </div>
                                </div>

                                <div class="form-group" id="medicationBPFG">
                                    <label class="col-sm-2 control-label">
                                        <i class="mdi mdi-18px mdi-pill"></i>
                                        Medication
                                    </label>

                                    <div class="col-sm-10">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="medicationBP" value="Taken">
                                                <i class="mdi mdi-24px mdi-battery-outline"></i>
                                                Taken
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="medicationBP" value="Not Taken">
                                                <i class="mdi mdi-24px mdi-battery-90"></i>
                                                Not Taken
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="medicationBP" value="Not Taken">
                                                <i class="mdi mdi-24px mdi-close-circle"></i>
                                                None
                                            </label>
                                        </div>
                                        <div id="medicationBPErrorMsgDiv"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        <i class="ion ion-waterdrop"></i>
                                        Systotic
                                    </label>

                                    <div class="col-sm-10">
                                        <div ng-controller="sliderController as ctrl" ng-cloak>
                                            <md-slider class="md-primary" md-discrete flex min="82" max="300"
                                                       step="1" ng-model="default.systotic" aria-label="blue"
                                                       id="blue-slider"></md-slider>
                                            <span class="label label-default pull-left">82</span>
                                            <span class="label label-default pull-right">300</span>
                                            <br>

                                            <div flex layout layout-align="center center">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="ion ion-heart"></i>
                                                    </span>
                                                    <input flex type="number" class="form-control col-sm-2"
                                                           ng-model="default.systotic"
                                                           aria-label="blue" aria-controls="blue-slider" min="82"
                                                           max="300"
                                                           name="systotic">
                                                    <span class="input-group-addon">
                                                        <b>mmHg</b>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        <i class="ion ion-waterdrop"></i>
                                        Diastolic
                                    </label>

                                    <div class="col-sm-10">
                                        <div ng-controller="sliderController as ctrl" ng-cloak>

                                            <md-slider md-discrete flex min="0" max="81" ng-model="default.diastolic"
                                                       aria-label="red" id="red-slider" class></md-slider>

                                            <span class="label label-default pull-left">0</span>
                                            <span class="label label-default pull-right">81</span>
                                            <br>

                                            <div flex layout layout-align="center center">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="ion ion-heart"></i>
                                                    </span>
                                                    <input flex type="number" class="form-control col-sm-2"
                                                           ng-model="default.diastolic"
                                                           aria-label="red" aria-controls="red-slider" min="0" max="81"
                                                           name="diastolic">
                                                    <span class="input-group-addon">
                                                        <b>mmHg</b>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="notesBP" class="col-sm-2 control-label">
                                        <i class="ion ion-chatboxes"></i>
                                        Notes
                                    </label>

                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="ion ion-edit"></i>
                                            </span>
                                            <input type="text" class="form-control" id="notesBP"
                                                   name="notesBP"
                                                   placeholder="Extra Notes">
                                        </div>
                                    </div>
                                </div>

                                <div id="messageBPLog"></div>

                            </div>

                            <div class="box-footer">
                                <button type="submit" id="logBPBtn" class="btn btn-info pull-right">Save</button>
                            </div>

                        </form>
                    </div>

                    <div class="box box-info">
                        <div class="box-header with-border">
                            <i class="ion ion-waterdrop"></i>
                            <h3 class="box-title">Glucose Level</h3>
                        </div>
                        <form class="form-horizontal" id="logGLFormData">
                            <div class="box-body">

                                <div class="form-group">
                                    <label for="dateTimeGL" class="col-sm-2 control-label">
                                        <i class="mdi mdi-18px mdi-timetable"></i>
                                        When
                                    </label>

                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-clock-o"></i>
                                            </span>
                                            <input type="datetime" class="form-control" id="dateTimeGL"
                                                   name="dateTimeGL"
                                                   placeholder="datetime">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="foodGL" value="Before Food">
                                                <i class="mdi mdi-food mdi-24px"></i>
                                                Before Food
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="foodGL" value="After Food">
                                                <i class="mdi mdi-food-off mdi-24px"></i>
                                                After Food
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        <i class="mdi mdi-18px mdi-pill"></i>
                                        Medication
                                    </label>

                                    <div class="col-sm-10">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="medicationGL" value="Taken">
                                                <i class="mdi mdi-24px mdi-battery-outline"></i>
                                                Taken
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="medicationGL" value="Not Taken">
                                                <i class="mdi mdi-24px mdi-battery-90"></i>
                                                Not Taken
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="medicationGL" value="Not Taken">
                                                <i class="mdi mdi-24px mdi-close-circle"></i>
                                                None
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        <i class="ion ion-waterdrop"></i>
                                        Glucose Level
                                    </label>

                                    <div class="col-sm-10">
                                        <div ng-controller="sliderController as ctrl" ng-cloak>

                                            <md-slider md-discrete flex min="1.0" max="40.0" step="0.1"
                                                       ng-model="default.glucose"
                                                       aria-label="red" id="glucose-slider" class></md-slider>

                                            <span class="label label-default pull-left">1.0</span>
                                            <span class="label label-default pull-right">40.0</span>
                                            <br>

                                            <div flex layout layout-align="center center">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="ion ion-waterdrop"></i>
                                                    </span>
                                                    <input flex type="number" class="form-control col-sm-2"
                                                           ng-model="default.glucose"
                                                           aria-label="red" aria-controls="glucose-slider" step="0.1"
                                                           min="1.0" max="40.0" name="glucoseLevel">
                                                    <span class="input-group-addon">
                                                        <b>mmol/L</b>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="notesGL" class="col-sm-2 control-label">
                                        <i class="ion ion-chatboxes"></i>
                                        Notes
                                    </label>

                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="ion ion-edit"></i>
                                            </span>
                                            <input type="text" class="form-control" id="notesGL"
                                                   name="notesGL"
                                                   placeholder="Extra Notes">
                                        </div>
                                    </div>
                                </div>

                                <div id="messageGLLog"></div>

                            </div>

                            <div class="box-footer">
                                <button type="submit" id="logGLBtn" class="btn btn-info pull-right">Save</button>
                            </div>

                        </form>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="box">
                        <div class="box-header">
                            <i class="ion ion-android-watch"></i>
                            <h3 class="box-title">Device</h3>
                        </div>
                        <div class="box-body">
                            <div class="col-md-4">
                                <img src="common/images/fitbitIcon.png" style="max-width: 100%; max-height: 100%">
                            </div>

                            <div class="col-md-8">
                                <h4><strong>Charge HR Tracker</strong></h4>
                                <i class="ion ion-android-sync"></i>
                                <a href="#">Sync</a>
                                <br>
                                <small>Last Sync: 1 hr ago</small>
                            </div>
                        </div>
                    </div>
                </div>
                <%--/.col-md-4--%>


            </div>

        </section>
    </div>

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

