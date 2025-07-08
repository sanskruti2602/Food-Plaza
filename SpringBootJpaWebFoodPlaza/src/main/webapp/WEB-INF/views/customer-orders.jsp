<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders - Food Plaza</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .order-card {
            box-shadow: 0 0 10px rgba(0,0,0,0.08);
            margin-bottom: 20px;
            border-radius: 12px;
        }

        .order-header {
            background-color: #198754;
            color: white;
            padding: 10px 20px;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .order-items {
            padding: 15px 20px;
        }

        .total-price {
            font-weight: bold;
            color: #198754;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <h3 class="mb-4">📦 My Orders</h3>

    <c:choose>
        <c:when test="${empty orders}">
            <div class="alert alert-info">You have not placed any orders yet.</div>
        </c:when>

        <c:otherwise>
            <c:forEach var="order" items="${orders}">
                <div class="card order-card">
                    <div class="order-header">
                        <div class="d-flex justify-content-between">
                            <div>Order ID: ${order.orderId}</div>
                            <div>Date: ${order.orderDate}</div>
                        </div>
                    </div>
                    <div class="order-items">
                        <ul class="list-group mb-2">
                            <c:forEach var="item" items="${order.orderItems}">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    ${item.food.foodName} × ${item.quantity}
                                    <span>₹ ${item.quantity * item.price}</span>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="text-end total-price">
                            Total: ₹ ${order.totalPrice}
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>

    <div class="mt-4">
        <a href="customer-dashboard" class="btn btn-secondary">⬅ Back to Dashboard</a>
    </div>
</div>

</body>
</html>
