<%--
  Created by IntelliJ IDEA.
  User: Ryuichi
  Date: 12/12/2016
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<%@page import="Entity.*" %>

<%
    String name = (String) session.getAttribute("name");
%>

<header class="main-header">
    <!-- Logo -->
    <div class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>Mi</b>²</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Mi²</b> HealthCare</span>
    </div>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
                <li class="dropdown messages-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="label label-success">4</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have 4 messages</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li>
                                    <!-- start message -->
                                    <a href="#">
                                        <div class="pull-left">
                                            <img src="../common/images/classprofile.png" class="img-circle"
                                                 alt="User Image">
                                        </div>
                                        <h4>
                                            Support Team
                                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                        </h4>
                                        <p>Why not buy a new awesome theme?</p>
                                    </a>
                                </li>
                                <!-- end message -->
                            </ul>
                        </li>
                        <li class="footer"><a href="#">See All Messages</a></li>
                    </ul>
                </li>
                <!-- Notifications: style can be found in dropdown.less -->
                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">10</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have 10 notifications</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li>
                                    <a href="#">
                                        <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="footer"><a href="#">View all</a></li>
                    </ul>
                </li>
                <!-- Tasks: style can be found in dropdown.less -->
                <li class="dropdown tasks-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-flag-o"></i>
                        <span class="label label-danger">9</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have 9 tasks</li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul class="menu">
                                <li>
                                    <!-- Task item -->
                                    <a href="#">
                                        <h3>
                                            Design some buttons
                                            <small class="pull-right">20%</small>
                                        </h3>
                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-aqua" style="width: 20%"
                                                 role="progressbar" aria-valuenow="20" aria-valuemin="0"
                                                 aria-valuemax="100">
                                                <span class="sr-only">20% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <!-- end task item -->
                            </ul>
                        </li>
                        <li class="footer">
                            <a href="#">View all tasks</a>
                        </li>
                    </ul>
                </li>
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../common/images/classprofile.png" class="user-image" alt="User Image">
                        <span class="hidden-xs"><%=name%></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="../common/images/classprofile.png" class="img-circle" alt="User Image">

                            <p>
                                <%=name%>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <div class="row">
                                <div class="col-xs-4 text-center">
                                    <a href="#">link 1</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">link 2</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">link 3</a>
                                </div>
                            </div>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="/profile" class="btn btn-default btn-flat">Profile</a>
                            </div>
                            <div class="pull-right">
                                <a href="#" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../common/images/classprofile.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <Strong><%=name%></Strong>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>

            <!-- First link -->
            <li class="treeview">
                <a href="/patientDashboard">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
            </li>

            <%--<li><a href="/patientProfile"><i class="fa fa-book"></i> <span>Profile</span></a></li>--%>
            <li><a href="/profile"><i class="fa fa-book"></i> <span>Profile</span></a></li>

            <li><a href="/log"><i class="ion ion-compose"></i> <span>Log</span></a></li>

            <li><a href="/profile"><i class="fa fa-heart"></i> <span>My Vital Signs</span></a></li>

            <li>
                <a href="/patientMedicalRecord">
                    <i class="fa fa-bed"></i> <span>My Medical Records</span>
                    <%--<span class="pull-right-container">--%>
                    <%--<small class="label pull-right bg-yellow">3</small>--%>
                    <%--<small class="label pull-right bg-red">5</small>--%>
                    <%--<small class="label pull-right bg-green">10</small>--%>
                    <%--</span>--%>
                </a>
            </li>

            <!-- Second link -->
            <li class="treeview">
                <a href="/billDashboard">
                    <i class="glyphicon glyphicon-usd"></i> <span>Billing</span>
                </a>
                <!-- sub menu for links -->
                <ul class="treeview-menu">
                    <li><a href="/billDashboard.jsp">Billing Dashboard</a></li>
                    <li><a href="/viewInvoices.jsp">Invoices</a></li>
                    <li><a href="/payment.jsp">Payment</a></li>
                </ul>
            </li>

            <li class="header">LABELS</li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

</html>
