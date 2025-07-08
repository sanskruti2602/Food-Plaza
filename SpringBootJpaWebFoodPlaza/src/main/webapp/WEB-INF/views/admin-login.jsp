<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Food Plaza</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .btn-login {
            background-color: #198754;
            color: white;
        }
        .btn-login:hover {
            background-color: #157347;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="login-container">
        <h3 class="text-center mb-4">🔐 Admin Login</h3>

        <!-- ✅ Use flash attribute error -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/admin/login" method="post">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" required placeholder="Enter admin username">
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required placeholder="Enter password">
            </div>

            <button type="submit" class="btn btn-login w-100">Login</button>
        </form>
    </div>
</div>

</body>
</html>
