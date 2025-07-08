<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Food Plaza</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .nav-tabs .nav-link.active {
            background-color: #198754;
            color: white;
        }

        .card {
            box-shadow: 0 0 10px rgba(0,0,0,0.08);
        }

        .admin-header {
            background-color: #343a40;
            color: white;
            padding: 15px;
        }

        .btn-logout {
            background-color: #dc3545;
            color: white;
        }

        .btn-logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<!-- Header -->
<div class="admin-header d-flex justify-content-between align-items-center px-4">
    <h4>Welcome Admin</h4>
    <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-logout">Logout</a>
</div>

<div class="container mt-4">
    <!-- Tabs -->
    <ul class="nav nav-tabs mb-4" id="adminTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="food-tab" data-bs-toggle="tab" data-bs-target="#food" type="button" role="tab">
                🍽️ Food Management
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="customer-tab" data-bs-toggle="tab" data-bs-target="#customer" type="button" role="tab">
                👤 Customers
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="orders-tab" data-bs-toggle="tab" data-bs-target="#orders" type="button" role="tab">
                📦 Orders
            </button>
        </li>
    </ul>

    <div class="tab-content" id="adminTabsContent">

        <!-- Food Management -->
        <div class="tab-pane fade show active" id="food" role="tabpanel">
            <h5 class="mb-3">Manage Food Items</h5>
            <a href="${pageContext.request.contextPath}/admin/addFoodForm" class="btn btn-success mb-3">➕ Add New Food</a>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price (₹)</th>
                        <th>Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="food" items="${foodList}">
                    <tr>
                        <td>${food.foodId}</td>
                        <td>${food.foodName}</td>
                        <td>${food.foodCategory}</td>
                        <td>${food.foodPrice}</td>
                        <td>${food.foodQuantity}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/editFood/${food.foodId}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="${pageContext.request.contextPath}/admin/deleteFood/${food.foodId}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Customer List -->
        <div class="tab-pane fade" id="customer" role="tabpanel">
            <h5 class="mb-3">Registered Customers</h5>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact No</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td>${customer.customerName}</td>
                        <td>${customer.customerEmail}</td>
                        <td>${customer.customerContactNo}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Orders Overview -->
        <div class="tab-pane fade" id="orders" role="tabpanel">
            <h5 class="mb-3">All Orders</h5>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Total Amount</th>
                        <th>Items</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orderList}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.customer.customerName}</td>
                        <td>${order.orderDate}</td>
                        <td>₹${order.totalPrice}</td>
                        <td>
                            <ul>
                                <c:forEach var="item" items="${order.orderItems}">
                                    <li>${item.food.foodName} x ${item.quantity}</li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
