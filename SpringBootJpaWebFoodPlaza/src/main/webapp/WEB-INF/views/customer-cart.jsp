<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.entity.Cart" %>
<%@ page import="com.example.entity.Food" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession();
    List<Cart> cartList = (List<Cart>) request.getAttribute("cartItems");
    Double totalPrice = (Double) request.getAttribute("totalPrice");
    String msg = (String) request.getAttribute("orderSuccess");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - Food Plaza</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">🛒 Your Cart</h2>

    <% if (msg != null && !msg.isEmpty()) { %>
        <div class="alert alert-success"><%= msg %></div>
    <% } %>

    <% if (cartList != null && !cartList.isEmpty()) { %>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Food Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
            <% for (Cart cart : cartList) {
                Food food = cart.getFood();
                int quantity = cart.getQuantity();
                double price = food.getFoodPrice();
                double subtotal = quantity * price;
            %>
                <tr>
                    <td><%= food.getFoodName() %></td>
                    <td>₹<%= price %></td>
                    <td><%= quantity %></td>
                    <td>₹<%= subtotal %></td>
                </tr>
            <% } %>
            </tbody>
        </table>

        <h4 class="text-end">Total: ₹<%= totalPrice %></h4>

        <div class="d-flex justify-content-between mt-4">
            <!-- ✅ Corrected form action paths -->
            <form action="${pageContext.request.contextPath}/customer/placeOrder" method="post">
                <button type="submit" class="btn btn-success">✅ Place Order</button>
            </form>
            <form action="${pageContext.request.contextPath}/customer-dashboard" method="get">
                <button type="submit" class="btn btn-secondary">⬅️ Back to Dashboard</button>
            </form>
        </div>
    <% } else { %>
        <p class="text-muted">Your cart is empty.</p>
        <a href="${pageContext.request.contextPath}/customer-dashboard" class="btn btn-primary mt-3">Go to Dashboard</a>
    <% } %>
</div>
</body>
</html>
