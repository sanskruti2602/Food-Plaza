package com.example.service;

import java.util.List;

import com.example.entity.Customer;

public interface CustomerService {

    Customer registerCustomer(Customer customer);                 
    Customer loginCustomer(String email, String password);        
    Customer getCustomerById(long customerId);                    
    Customer updateCustomer(Customer customer);                   
    List<Customer> getAllCustomers();
}
