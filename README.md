# 🍽️ Food Plaza - Online Food Ordering System

Food Plaza is a full-stack web application built using Spring Boot, JSP, and MySQL. It allows customers to browse food items, manage a cart, and place orders. Administrators can manage the food menu and view customer activity through a secure admin dashboard.

---

## Technologies Used

- **Backend**: Spring Boot, Spring MVC
- **Frontend**: JSP, HTML, CSS, Bootstrap
- **Database**: MySQL
- **ORM**: Hibernate / JPA
- **Build Tool**: Maven
- **IDE**: Eclipse / IntelliJ

---

## Features

### Admin Functionalities

- Admin login with fixed credentials
- Add new food items with name, price, and image
- Edit or delete existing food items
- View all food items
- View all registered customers
- View all customer orders

### Customer Functionalities

- Customer registration and login
- Browse food items with image, name, and price
- Add food items to cart with quantity
- View, update, or remove items from cart
- Place orders (Zomato-style: grouped order with multiple items)
- View order history
- Update profile details
- Logout securely

---

## Order Workflow

1. Customer registers or logs in.
2. Browses food items on the dashboard.
3. Adds desired items to the cart with quantity.
4. Views cart and places the order.
5. System creates a grouped order with multiple items.
6. Cart is cleared after successful order.
7. Customer can view past orders anytime.

---

## Database Schema

- **Admin**: Fixed credentials used for login
- **Customer**: Stores customer registration and login info
- **Food**: Stores all food items with details
- **Cart**: Temporary store of selected items (linked to customer)
- **CustomerOrder**: Stores group order with date and customer ID
- **OrderItem**: Stores each food item within an order (with quantity & price)

---

## JSP Pages Included

### Customer Pages

- `index.html` – Landing page with login/register/admin options
- `customer-register.jsp` – Form for new customer registration
- `customer-login.jsp` – Login page for existing customers
- `customer-dashboard.jsp` – List of available food items
- `add-cart.jsp` – Cart view with item list and total price
- `my-orders.jsp` – View order history
- `update-profile.jsp` – Update customer profile details

### Admin Pages

- `admin-login.jsp` – Login form for admin
- `admin-dashboard.jsp` – Admin dashboard with options
- `add-food.jsp` – Add a new food item
- `view-food.jsp` – View, edit, and delete food items
- `view-customers.jsp` – View all registered customers
- `view-orders.jsp` – View all placed orders

---

## UI and Design

- Built with Bootstrap for responsive layout
- Clean and consistent theme across pages
- Google Fonts (optional) used for better typography
- Buttons, forms, and cards styled for modern look
- User-friendly navigation bar with quick links


