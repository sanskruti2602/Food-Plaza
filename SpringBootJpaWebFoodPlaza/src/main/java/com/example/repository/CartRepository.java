package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.entity.Cart;
import java.util.List;

public interface CartRepository extends JpaRepository<Cart, Long> {

    List<Cart> findByCustomerCustomerId(long customerId);  // ✅ For showing cart items

    void deleteByCustomerCustomerId(long customerId);      // ✅ For clearing cart after order

	Cart findByCustomerCustomerIdAndFoodFoodId(long customerId, long foodId);

}
