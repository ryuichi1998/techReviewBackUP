
<%@ page import="java.util.List" %>
<%@ page import="Entity.Product" %>
<%@ page import="Entity.Service" %>
<%@ page import="DAO.ServiceDAO" %>
<%@ page import="DAO.InvoiceDAO" %>
<%@ page import="Entity.Invoice" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="DAO.PatientDAO" %>
<%@ page import="Entity.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    ServiceDAO db = new ServiceDAO();
    List<Service> serList = db.retrieveAllService();
    Service ser = serList.get(1);

//    PatientDAO db = new PatientDAO();
//    List<Patient> serList = db.retrieveAllService();
//    Patient ser = serList.get(1);

%>
<body>
<%=ser.getSerDesc() %>
</body>
</html>
