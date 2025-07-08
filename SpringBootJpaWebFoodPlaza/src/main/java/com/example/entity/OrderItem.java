package com.example.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "order_item")
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long orderItemId;

    @ManyToOne
    @JoinColumn(name = "food_id", nullable = false)
    private Food food;

    private int quantity;

    private double price; // ✅ ADD THIS FIELD

    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    private CustomerOrder order;

    // Getters & Setters
    public Long getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Long orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() { // ✅ GETTER
        return price;
    }

    public void setPrice(double price) { // ✅ SETTER
        this.price = price;
    }

    public CustomerOrder getOrder() {
        return order;
    }

    public void setOrder(CustomerOrder order) {
        this.order = order;
    }
}
