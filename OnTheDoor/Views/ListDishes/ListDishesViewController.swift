//
//  ListDishesViewController.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 16.10.2023.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "1", name: "Ciorba", description: "Best soup you can try", image: "https://picsum.photos/100/200", calories: 35),
        .init(id: "1", name: "Sarmale", description: "Rolled meat cabbage", image: "https://picsum.photos/100/200", calories: 350),
        .init(id: "1", name: "Pizza", description: "As you're used to", image: "https://picsum.photos/100/200", calories: 325),
        .init(id: "1", name: "Burger", description: "World meet juice", image: "https://picsum.photos/100/200", calories: 105)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }


}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
