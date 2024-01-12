//
//  MainTabBarController.swift
//  FoodPizzaApp
//
//  Created by Владислав on 12.01.2024.
//

import UIKit
import HomeScene

final class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .redColor
        tabBar.unselectedItemTintColor = .notActiveColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.grayColor.cgColor
    }
    
    private func setupItems() {
        let homeVC = HomeViewController()
        let contactsVC = UIViewController()
        let profileVC = UIViewController()
        let shoppingСartVC = UIViewController()
        
        setViewControllers([homeVC, contactsVC, profileVC, shoppingСartVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Меню"
        items[1].title = "Контакты"
        items[2].title = "Профиль"
        items[3].title = "Корзина"
        
        items[0].image = UIImage(named: "Menu")
        items[1].image = UIImage(named: "Contact")
        items[2].image = UIImage(named: "Profile")
        items[3].image = UIImage(named: "ShoppingCart")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont(name: "Roboto-Bold", size: 16) as Any], for: .normal)
    }
}
