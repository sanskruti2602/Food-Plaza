package com.example.entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "customer")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long customerId;

    private String customerName;
    private String customerEmail;
    private String customerPassword;
    private long customerContactNo;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    private List<Cart> cartList;

	public long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerPassword() {
		return customerPassword;
	}

	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}

	public long getCustomerContactNo() {
		return customerContactNo;
	}

	public void setCustomerContactNo(long customerContactNo) {
		this.customerContactNo = customerContactNo;
	}

	public List<Cart> getCartList() {
		return cartList;
	}

	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}

	

    
    
}
