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

<img width="1920" height="1080" alt="Screenshot 2025-07-08 150720" src="https://github.com/user-attachments/assets/0bd33268-978c-455d-9b60-cc3aeca7ea82" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 150737" src="https://github.com/user-attachments/assets/1ac17319-a806-439e-9872-07a95799ca66" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 150901" src="https://github.com/user-attachments/assets/f377673e-f5cf-4ffc-a43b-fc6d372c5cb8" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 150921" src="https://github.com/user-attachments/assets/0a4eaab6-3af5-4e74-b344-b63b990504e1" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 150935" src="https://github.com/user-attachments/assets/2ae1538c-78bb-4d50-9306-769b40b559a4" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 150949" src="https://github.com/user-attachments/assets/e8495a12-dc93-43af-9f01-9feac9c16404" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151020" src="https://github.com/user-attachments/assets/c96cf36c-a99b-47e0-b0d9-1fb9d9b936a5" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151033" src="https://github.com/user-attachments/assets/03090406-fca5-4c60-9693-30a832c83caa" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151047" src="https://github.com/user-attachments/assets/d82059a1-b6b8-488d-9766-29e80ff9b422" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151112" src="https://github.com/user-attachments/assets/8d673d16-a6dc-40a5-ab3b-e0321d2569a4" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151126" src="https://github.com/user-attachments/assets/e7c45cc2-9309-4faf-8cdb-47c3162117ec" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151143" src="https://github.com/user-attachments/assets/72eb1f2a-98de-421d-a39c-5d36aa15db0e" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151208" src="https://github.com/user-attachments/assets/1ca9868b-a62f-45af-8de1-302e96f8e767" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151222" src="https://github.com/user-attachments/assets/9d1479ad-5132-48f9-916e-f552d68f14bd" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151242" src="https://github.com/user-attachments/assets/36b5b3c8-fbea-4c25-8c9c-cf3a23516db6" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151254" src="https://github.com/user-attachments/assets/7e9d984b-7704-49cd-b216-2a5728577127" />

<img width="1920" height="1080" alt="Screenshot 2025-07-08 151304" src="https://github.com/user-attachments/assets/ecd44ae0-8dfe-47e9-8c09-36608ea5e31c" />



















