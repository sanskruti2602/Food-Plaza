package com.example.service;

import java.util.List;
import com.example.entity.Cart;

public interface CartService {

    List<Cart> getCartByCustomerId(long customerId);   // ✅ Show all cart items

    void clearCart(long customerId);                   // ✅ Clear cart after placing order

    void addToCart(long customerId, long foodId, int quantity); // ✅ Add new item to cart

}
