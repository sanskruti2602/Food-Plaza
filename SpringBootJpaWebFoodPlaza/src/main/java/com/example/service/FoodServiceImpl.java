package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entity.Food;
import com.example.repository.FoodRepository;

@Service
public class FoodServiceImpl implements FoodService {

    @Autowired
    private FoodRepository foodRepository;

    @Override
    public List<Food> getAllFood() {
        return foodRepository.findAll();
    }

    @Override
    public Food getFoodById(long foodId) {
        Optional<Food> food = foodRepository.findById(foodId);
        return food.orElse(null);  
    }

    @Override
    public Food addFood(Food food) {
        return foodRepository.save(food);
    }

    @Override
    public Food updateFood(Food food) {
        return foodRepository.save(food);
    }

    @Override
    public boolean deleteFood(long foodId) {
        if (foodRepository.existsById(foodId)) {
            foodRepository.deleteById(foodId);
            return true;
        }
        return false;
    }

    @Override
    public Food findById(Long foodId) {
        return foodRepository.findById(foodId).orElse(null);
    }
}