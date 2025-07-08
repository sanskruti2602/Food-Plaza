package com.example.repository;

import com.example.entity.CustomerOrder;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerOrderRepository extends JpaRepository<CustomerOrder, Long> {
    
    // Get all orders by a specific customer
    List<CustomerOrder> findByCustomerCustomerId(Long customerId);
}
