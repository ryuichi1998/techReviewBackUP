
<%@ page import="java.util.List" %>
<%@ page import="Entity.Product" %>
<%@ page import="Entity.Service" %>
<%@ page import="DAO.ServiceDAO" %>
<%@ page import="DAO.InvoiceDAO" %>
<%@ page import="Entity.Invoice" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    List<Service> services = (List<Service>)request.getAttribute("services");
    Service s = services.get(0);
%>
<body>

</body>
</html>
