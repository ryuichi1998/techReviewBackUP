<%--
  Created by IntelliJ IDEA.
  User: qingyutan
  Date: 12/12/16
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">

<%@page import="Entity.*" %>

<%
    Staff staff = (Staff) session.getAttribute("person");
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

                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../common/images/classprofile.png" class="user-image" alt="User Image">
                        <span class="hidden-xs"><%= staff.getName() %></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="../common/images/classprofile.png" class="img-circle" alt="User Image">

                            <p>

                                <%=staff.getName()%> - <%= staff.getType()%>
                                <small><%=staff.getType() %></small>
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
                                <a href="#" class="btn btn-default btn-flat">Profile</a>
                            </div>
                            <div class="pull-right">
                                <a href="#" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->

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
                <Strong><%= staff.getName()%></Strong>
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

            <li class="treeview active">
                <a href="/products">
                    <i class="fa fa-medkit"></i><span>Products</span>
                <!-- sub menu for links -->
                <ul class="treeview-menu">
                    <li><a href="/productDashboard"><i class="fa fa-circle-o"></i>Dashboard</a></li>
                    <li><a href="/addProduct.jsp"><i class="fa fa-circle-o"></i>Add new products</a></li>
                    <li><a href="/viewProducts"><i class="fa fa-circle-o"></i>View all products</a></li>
                </ul>
            </li>
            <li class="treeview active">
                <a href="/products">
                    <i class="fa fa-archive"></i><span>Inventory</span>
                    <!-- sub menu for links -->
                    <ul class="treeview-menu">
                        <li><a href="/#"><i class="fa fa-circle-o"></i>Requests</a></li>
                        <li><a href="/#"><i class="fa fa-circle-o"></i>Items</a></li>
                        <li><a href="/#"><i class="fa fa-circle-o"></i>Inventory Requests</a></li>
                        <li><a href="/#"><i class="fa fa-circle-o"></i>Reports</a></li>
                    </ul>
            </li>


        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

</html>
