<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Food Plaza</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Google Font -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fdfdfd;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .center-box {
            max-width: 480px;
            width: 100%;
            background: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            border-radius: 12px;
            padding: 12px;
        }

        .btn-register {
            background-color: #28a745;
            border: none;
            padding: 12px;
            border-radius: 30px;
            font-size: 1rem;
            width: 100%;
        }

        .btn-register:hover {
            background-color: #218838;
        }

        .link-text {
            text-align: center;
            margin-top: 15px;
        }

        .link-text a {
            text-decoration: none;
            font-weight: 600;
            color: #28a745;
        }

        .alert {
            font-size: 0.9rem;
        }

        @media (max-width: 576px) {
            body {
                padding: 20px;
            }

            .center-box {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

<div class="center-box">
    <h3 class="text-center mb-4">Create an Account</h3>

    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form action="/customer/register" method="post">
        <div class="mb-3">
            <input type="text" name="customerName" class="form-control" placeholder="Full Name" required>
        </div>
        <div class="mb-3">
            <input type="email" name="customerEmail" class="form-control" placeholder="Email Address" required>
        </div>
        <div class="mb-3">
            <input type="password" name="customerPassword" class="form-control" placeholder="Password" required>
        </div>
        <div class="mb-3">
            <input type="text" name="customerContactNo" class="form-control" placeholder="Contact Number" required>
        </div>
        <button type="submit" class="btn btn-register mt-2">Register</button>
    </form>

    <div class="link-text mt-3">
        Already have an account? <a href="/customer-login">Log in</a>
    </div>
</div>

</body>
</html>
