<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.entity.Customer" %>

<%
    Customer customer = (Customer) request.getAttribute("customer");
    String message = (String) request.getAttribute("successMessage");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile - Food Plaza</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ffffff;
            font-family: 'Poppins', sans-serif;
        }

        .profile-container {
            max-width: 600px;
            margin: 60px auto;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.08);
            background-color: #fff;
        }

        .btn-update {
            background-color: #28a745;
            color: #fff;
        }

        .btn-update:hover {
            background-color: #218838;
        }

        .btn-back {
            background-color: #343a40;
            color: #fff;
        }

        .btn-back:hover {
            background-color: #23272b;
        }

        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="profile-container">

        <h3 class="mb-4 text-center">📝 Update Your Profile</h3>

        <!-- ✅ Success message -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>

        <!-- 🔁 Update Form -->
        <form action="${pageContext.request.contextPath}/customer/updateProfile" method="post">

            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" name="customerName" id="name" class="form-control"
                       value="${customer.customerName}" required />
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" name="customerEmail" id="email" class="form-control"
                       value="${customer.customerEmail}" required />
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="customerPassword" id="password" class="form-control"
                       value="${customer.customerPassword}" required />
            </div>

            <div class="mb-4">
                <label for="contact" class="form-label">Contact Number</label>
                <input type="tel" name="customerContactNo" id="contact" class="form-control"
                       value="${customer.customerContactNo}" required />
            </div>

            <!-- 🔘 Buttons -->
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-update px-4">✅ Update</button>
                <a href="${pageContext.request.contextPath}/customer-dashboard" class="btn btn-back px-4">⬅ Back to Dashboard</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>