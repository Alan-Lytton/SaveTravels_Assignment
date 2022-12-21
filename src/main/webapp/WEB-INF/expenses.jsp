<%--
  Created by IntelliJ IDEA.
  User: alanlytton
  Date: 12/21/22
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
    <title>Save Travels</title>
</head>
<body>
<div class="container d-flex flex-column">
    <h1 class="text-primary">Save Travels</h1>
    <table class="table">
        <thead>
        <tr>
            <th>Expense</th>
            <th>Vendor</th>
            <th>Amount</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="expense" items="${allExpenses}">
            <tr>
                <td><a href="/expenses/show/${expense.id}"><c:out value="${expense.expenseName}"/></a></td>
                <td><c:out value="${expense.vendor}"/></td>
                <td>$<c:out value="${expense.amount}"/></td>
                <td><span class="d-flex"><a href="/expenses/edit/${expense.id}" class="me-2">Edit</a> | <form action="/expenses/delete/${expense.id}" method="post" class="ms-2"><input type="hidden" name="_method" value="delete"><input type="submit" value="Delete" class="btn-danger text-white"> </form></span> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h2 class="text-primary mt-3">Add an Expense:</h2>
    <form:form action="/expenses" method="post" modelAttribute="expense" cssClass="d-flex flex-column">
        <div class="container d-flex flex-column mt-3 mb-3">
            <p class="text-danger"><form:errors path="expenseName"/></p>
            <p>
                <form:label cssClass="me-4" path="expenseName">Expense Name: </form:label>
                <form:input path="expenseName" cssClass="ms-3"/>
            </p>
        </div>
        <div class="container d-flex flex-column mt-3 mb-3">
            <p class="text-danger"><form:errors path="vendor"/></p>
            <p>
                <form:label cssClass="me-5" path="vendor">Vendor Name: </form:label>
                <form:input path="vendor" />
            </p>
        </div>
        <div class="container d-flex flex-column mt-3 mb-3">
            <p class="text-danger"><form:errors path="amount"/></p>
            <p>
                <div class="input-group">
                    <form:label cssClass="me-5" path="amount">Amount: </form:label>
                    <span class="input-group-text ms-5">$</span>
                    <form:input type="number" path="amount" step=".01"/>
                </div>
            </p>
        </div>
        <div class="container d-flex flex-column mb-3">
            <p class="text-danger"><form:errors path="description"/></p>
            <p>
                <form:label path="description" cssClass="me-5">Description: </form:label>
                <form:textarea path="description" cssClass="ms-4"></form:textarea>
            </p>
        </div>
        <input type="submit" value="Submit" class="btn btn-primary align-self-start">
    </form:form>
</div>



<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
</body>
</html>
