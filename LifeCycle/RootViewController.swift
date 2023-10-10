//
//  ViewController.swift
//  NavigationAndLifecycle
//
//  Created by Муса Шогенов on 5.10.2023.
//

import UIKit

class RootViewController: UIViewController {
    
    var dataArray : [String] = ["Apple","Pineapple","Watermelon","Melon","Peach","Tomato","Potato", "Lemon","Cucumber","Blueberry", "Strawberry","Cabbage", "Bell pepper"]
    
    let netWorking = NetWorking()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Root ViewDidLoad")
      
        
        self.title = "Fruits and vegetables"
        
        let tableView = UITableView(frame: view.bounds, style: .plain)
         tableView.delegate = self
         tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
       
      
        
        
         view.addSubview(tableView)
    
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("RootViewWillAppear")
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("RootView DidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("RootView WillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("RootView DidDisappear")
    }



}


extension RootViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count 
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        print( "\(dataArray[indexPath.row]) selected")
        let selectedData = dataArray[indexPath.row]
      
          Task {
              
              let result = try await netWorking.fetchData(selectedData)
            
             
              let foodView = FoodView(nutrition: result)
              
          
              print("Data fetched, pushing controller")
              
              navigationController?.pushViewController(foodView, animated: true)
             
             
          }
    }
}

