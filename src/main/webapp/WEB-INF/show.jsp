<%--
  Created by IntelliJ IDEA.
  User: alanlytton
  Date: 12/21/22
  Time: 12:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
    <title>Save Travels | Show</title>
</head>
<body>
<div class="container d-flex flex-column ">
    <span class="d-flex align-items-center justify-content-around w-50">
        <h1 class="text-primary">Expense Details:</h1>
        <a href="/expenses/">Go Back</a>
    </span>
    <p>Expense Name: <c:out value="${expense.expenseName}"/></p>
    <p>Expense Description: <c:out value="${expense.description}"/></p>
    <p>Vendor: <c:out value="${expense.vendor}"/></p>
    <p>Amount Spent: <c:out value="${expense.amount}"/></p>

</div>

<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
</body>
</html>
