<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard - Food Plaza</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
        .food-card { transition: transform 0.3s ease-in-out; }
        .food-card:hover { transform: scale(1.02); box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); }
        .navbar-brand { font-weight: 600; }
        .card-img-top { height: 200px; object-fit: cover; }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
    <a class="navbar-brand" href="#">Food Plaza</a>
    <div class="ms-auto dropdown">
        <span class="text-white me-3">Welcome, ${customerName}</span>
        <button class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">Profile</button>
        <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/customer/updateProfile">Update Profile</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/customer/myOrders">My Orders</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item text-danger" href="/customer/logout">Logout</a></li>
        </ul>
    </div>
</nav>

<!-- ✅ Success Message with Go to Cart -->
<c:if test="${not empty successMessage}">
    <div class="alert alert-success d-flex justify-content-between align-items-center m-0">
        <span>${successMessage}</span>
        <a href="${pageContext.request.contextPath}/customer/cart" class="btn btn-sm btn-outline-light bg-success">
            Go to Cart
        </a>
    </div>
</c:if>

<!-- Main Container -->
<div class="container mt-4">
    <h2 class="mb-4">Available Food Items</h2>
    <div class="row">
        <c:forEach var="food" items="${foodList}">
            <c:set var="imageFile" value="default.jpg" />
            <c:choose>
                <c:when test="${food.foodName == 'Margherita Pizza'}"><c:set var="imageFile" value="margherita-pizza.jpg" /></c:when>
                <c:when test="${food.foodName == 'Veg Burger'}"><c:set var="imageFile" value="veg-burger.jpg" /></c:when>
                <c:when test="${food.foodName == 'Paneer Biryani'}"><c:set var="imageFile" value="paneer-biryani.jpg" /></c:when>
                <c:when test="${food.foodName == 'Cheese Sandwich'}"><c:set var="imageFile" value="cheese-sandwich.jpg" /></c:when>
                <c:when test="${food.foodName == 'Chole Bhature'}"><c:set var="imageFile" value="chole-bhature.jpg" /></c:when>
                <c:when test="${food.foodName == 'Cold Coffee'}"><c:set var="imageFile" value="cold-coffee.jpg" /></c:when>
                <c:when test="${food.foodName == 'Chocolate Cake'}"><c:set var="imageFile" value="chocolate-cake.jpg" /></c:when>
                <c:when test="${food.foodName == 'French Fries'}"><c:set var="imageFile" value="french-fries.jpg" /></c:when>
                <c:when test="${food.foodName == 'Pasta Alfredo'}"><c:set var="imageFile" value="pasta-alfredo.jpg" /></c:when>
                <c:when test="${food.foodName == 'Masala Dosa'}"><c:set var="imageFile" value="masala-dosa.jpg" /></c:when>
            </c:choose>

            <!-- Food Card -->
            <div class="col-md-4 mb-4">
                <div class="card food-card">
                    <img src="${pageContext.request.contextPath}/images/${imageFile}" class="card-img-top" alt="${food.foodName}" />
                    <div class="card-body">
                        <h5 class="card-title">${food.foodName}</h5>
                        <p class="card-text">Category: ${food.foodCategory}</p>
                        <p class="card-text">Price: ₹${food.foodPrice}</p>
                        <p class="card-text">Quantity Available: ${food.foodQuantity}</p>

                        <!-- ✅ Add to Cart Form -->
                        <form action="${pageContext.request.contextPath}/customer/addToCart" method="post" class="d-flex flex-column">
                            <input type="hidden" name="foodId" value="${food.foodId}" />
                            <div class="input-group mb-2" style="max-width: 140px;">
                                <button type="button" class="btn btn-outline-secondary btn-decrement">-</button>
                                <input type="number" name="quantity" class="form-control text-center quantity-input" value="1" min="1" max="${food.foodQuantity}" />
                                <button type="button" class="btn btn-outline-secondary btn-increment">+</button>
                            </div>
                            <button type="submit" class="btn btn-success w-100">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Quantity increment/decrement script -->
<script>
  document.querySelectorAll('.btn-increment').forEach(button => {
    button.addEventListener('click', () => {
      const input = button.parentElement.querySelector('.quantity-input');
      let currentValue = parseInt(input.value);
      const max = parseInt(input.max);
      if (currentValue < max) input.value = currentValue + 1;
    });
  });

  document.querySelectorAll('.btn-decrement').forEach(button => {
    button.addEventListener('click', () => {
      const input = button.parentElement.querySelector('.quantity-input');
      let currentValue = parseInt(input.value);
      const min = parseInt(input.min);
      if (currentValue > min) input.value = currentValue - 1;
    });
  });
</script>

</body>
</html>
