//
//  NutritionInfoView.swift
//  LifeCycle
//
//  Created by Муса Шогенов on 9.10.2023.
//

import Foundation
import UIKit


class NutritionInfoView: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    let nutrition: Nutrition?
    
    
    init(nutrition: Nutrition?) {
        self.nutrition = nutrition
        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
           tableView.dataSource = self
           tableView.delegate = self
        
        self.view.addSubview(tableView)
        
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
           
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          print("NutritionInfoView WillAppear")
      }

      
      override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          print("NutritionInfoView DidAppear")
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          print("NutritionInfoView WillDisappear")
      }
      override func viewDidDisappear(_ animated: Bool) {
          super.viewDidDisappear(animated)
          print("NutritionInfoView DidDisappear")
      }

    
    
}


extension NutritionInfoView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
    
        if let nutrition = nutrition {
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Name: \(nutrition.name)"
            case 1:
                cell.textLabel?.text = "Calories: \(nutrition.calories)"
            case 2:
                cell.textLabel?.text = "Serving Size: \(nutrition.servingSizeG) grams"
            case 3:
                cell.textLabel?.text = "Total Fat: \(nutrition.fatTotalG) grams"
            case 4:
                cell.textLabel?.text = "Saturated Fat: \(nutrition.fatSaturatedG) grams"
            case 5:
                cell.textLabel?.text = "Protein: \(nutrition.proteinG) grams"
            case 6:
                cell.textLabel?.text = "Sodium: \(nutrition.sodiumMg) mg"
            case 7:
                cell.textLabel?.text = "Potassium: \(nutrition.potassiumMg) mg"
            case 8:
                cell.textLabel?.text = "Cholesterol: \(nutrition.cholesterolMg) mg"
            case 9:
                cell.textLabel?.text = "Total Carbohydrates: \(nutrition.carbohydratesTotalG) grams"
            case 10:
                cell.textLabel?.text = "Fiber: \(nutrition.fiberG) grams"
            case 11:
                cell.textLabel?.text = "Sugar: \(nutrition.sugarG) grams"
            default:
                break
            }
        }
        
        return cell
    }

    
}
