//
//  DishDetailViewController.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 13.10.2023.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var calorieLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    var dish: Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        calorieLbl.text = dish.formattedCalories
    }
    
    @IBAction func placeOrderButton(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty
        else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing Order...")
        NetworkManager.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received. 👨🏼‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
    }
}
