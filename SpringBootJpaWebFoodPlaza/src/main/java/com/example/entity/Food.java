package com.example.entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "food")
public class Food {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long foodId;

    private String foodName;
    private String foodCategory;
    private float foodPrice;
    private int foodQuantity;

    @OneToMany(mappedBy = "food", cascade = CascadeType.ALL)
    private List<Cart> cartList;

	public long getFoodId() {
		return foodId;
	}

	public void setFoodId(long foodId) {
		this.foodId = foodId;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodCategory() {
		return foodCategory;
	}

	public void setFoodCategory(String foodCategory) {
		this.foodCategory = foodCategory;
	}

	public float getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(float foodPrice) {
		this.foodPrice = foodPrice;
	}

	public int getFoodQuantity() {
		return foodQuantity;
	}

	public void setFoodQuantity(int foodQuantity) {
		this.foodQuantity = foodQuantity;
	}

	public List<Cart> getCartList() {
		return cartList;
	}

	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}

    
}
