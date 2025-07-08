package com.example.service;

import java.util.List;
import com.example.entity.Food;

public interface FoodService {

    List<Food> getAllFood();                  
    Food getFoodById(long foodId);           
    Food addFood(Food food);                 
    Food updateFood(Food food);              
    boolean deleteFood(long foodId);
	Food findById(Long foodId);         
}
