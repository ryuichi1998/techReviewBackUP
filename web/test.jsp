
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
    ServiceDAO db = new ServiceDAO();
    db.updateInvoiceId(21, "P001");
    db.updateStatus("P001");
%>
<body>

</body>
</html>
