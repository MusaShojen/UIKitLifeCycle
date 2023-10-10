//
//  Food.swift
//  NavigationAndLifecycle
//
//  Created by Муса Шогенов on 5.10.2023.
//

import Foundation



struct Nutrition: Codable {
    let name: String
       let calories, servingSizeG, fatTotalG, fatSaturatedG: Double
       let proteinG: Double
       let sodiumMg, potassiumMg, cholesterolMg: Int
       let carbohydratesTotalG, fiberG, sugarG: Double

       enum CodingKeys: String, CodingKey {
           case name, calories
           case servingSizeG = "serving_size_g"
           case fatTotalG = "fat_total_g"
           case fatSaturatedG = "fat_saturated_g"
           case proteinG = "protein_g"
           case sodiumMg = "sodium_mg"
           case potassiumMg = "potassium_mg"
           case cholesterolMg = "cholesterol_mg"
           case carbohydratesTotalG = "carbohydrates_total_g"
           case fiberG = "fiber_g"
           case sugarG = "sugar_g"
       }
  }
