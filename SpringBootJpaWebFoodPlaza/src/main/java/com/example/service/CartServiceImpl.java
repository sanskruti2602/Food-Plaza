package com.example.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.entity.Cart;
import com.example.entity.Customer;
import com.example.entity.Food;
import com.example.repository.CartRepository;
import com.example.repository.CustomerRepository;
import com.example.repository.FoodRepository;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private FoodRepository foodRepository;

    @Override
    public List<Cart> getCartByCustomerId(long customerId) {
        return cartRepository.findByCustomerCustomerId(customerId);
    }

    
    @Override
    @Transactional 
    public void clearCart(long customerId) {
        cartRepository.deleteByCustomerCustomerId(customerId);
    }

    @Override
    public void addToCart(long customerId, long foodId, int quantity) {
        Customer customer = customerRepository.findById(customerId).orElse(null);
        Food food = foodRepository.findById(foodId).orElse(null);

        if (customer != null && food != null) {
            Cart existingCartItem = cartRepository.findByCustomerCustomerIdAndFoodFoodId(customerId, foodId);

            if (existingCartItem != null) {
                // If the food already exists in the cart, update the quantity
                existingCartItem.setQuantity(existingCartItem.getQuantity() + quantity);
                cartRepository.save(existingCartItem);
            } else {
                // Else, create a new cart entry
                Cart cart = new Cart();
                cart.setCustomer(customer);
                cart.setFood(food);
                cart.setQuantity(quantity);
                cartRepository.save(cart);
            }
        }
    }
}
