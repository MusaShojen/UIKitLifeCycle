//
//  FoodView.swift
//  NavigationAndLifecycle
//
//  Created by Муса Шогенов on 7.10.2023.
//

import Foundation
import SnapKit
import UIKit

class FoodView: UIViewController {
    
    let calories: Double
    let titleName: String
    let nutrition: Nutrition
    
    
    init(nutrition: Nutrition) {
        self.calories = nutrition.calories
        self.titleName = nutrition.name
        self.nutrition = nutrition
        
        
        super.init(nibName: nil, bundle: nil)
       
      
    }


    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FoodView DidLoad")
        self.view.backgroundColor = .white
        self.title = titleName
        initializeViews()
        
       
    
    
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FoodView WillAppear")
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FoodView DidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("FoodView WillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("FoodView DidDisappear")
    }

    
}


extension FoodView {
    
    func initializeViews(){
        
        let caloriesLabel =  UILabel()
        caloriesLabel.text = String(calories)
        self.view.addSubview(caloriesLabel)
        
        guard let image = UIImage(named: self.titleName) else {return }
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.isUserInteractionEnabled = true // Включаем пользовательские взаимодействия для imageView
        imageView.addGestureRecognizer(tapGesture)


        
        self.view.addSubview(imageView)
        
        caloriesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.centerX.equalToSuperview()
      }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(400)
        }
       
        
        self.view.layoutIfNeeded()

        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }
    
    @objc func imageViewTapped() {
        
        let nutritionInfoView = NutritionInfoView(nutrition: nutrition)
        print ("Tapped on image")
        nutritionInfoView.view.backgroundColor = .cyan
        
    
           present(nutritionInfoView, animated: true, completion: nil)
     

        
        
    }

    
    
    
}
