//
//  HomeViewController.swift
//  OnTheDoor
//
//  Created by Dragos Neacsu on 12.10.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
         .init(id: "1", name: "Romanian Dish", image: "https://picsum.photos/100/200"),
         .init(id: "2", name: "Romanian Dish2", image: "https://picsum.photos/100/200"),
         .init(id: "3", name: "Romanian Dish3", image: "https://picsum.photos/100/200"),
         .init(id: "4", name: "Romanian Dish4", image: "https://picsum.photos/100/200"),
         .init(id: "5", name: "Romanian Dish5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "1", name: "Ciorba", description: "Best soup you can try", image: "https://picsum.photos/100/200", calories: 35),
        .init(id: "1", name: "Sarmale", description: "Rolled meat cabbage", image: "https://picsum.photos/100/200", calories: 350),
        .init(id: "1", name: "Pizza", description: "As you're used to", image: "https://picsum.photos/100/200", calories: 325),
        .init(id: "1", name: "Burger", description: "World meet juice", image: "https://picsum.photos/100/200", calories: 105)
    ]
    
    var specials: [Dish] = [
        .init(id: "1", name: "Tocanita", description: "Best soup you can try", image: "https://picsum.photos/100/200", calories: 35),
        .init(id: "1", name: "Piure", description: "Rolled meat cabbage", image: "https://picsum.photos/100/200", calories: 350),
        .init(id: "1", name: "PorkBelly", description: "As you're used to", image: "https://picsum.photos/100/200", calories: 325),
        .init(id: "1", name: "Burger", description: "World meet juice", image: "https://picsum.photos/100/200", calories: 105)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNib()

    }
    
    private func registerNib() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
            
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ?  populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
