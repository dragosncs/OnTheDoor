//
//  DishDetailViewController.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 13.10.2023.
//

import UIKit

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
        // Do any additional setup after loading the view.
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        calorieLbl.text = dish.formattedCalories
    }
    
    @IBAction func placeOrderButton(_ sender: UIButton) {
        
    }
}
