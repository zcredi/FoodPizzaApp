//
//  SceneFactory.swift
//  FoodPizzaApp
//
//  Created by Владислав on 12.01.2024.
//

import UIKit
import HomeScene

public protocol SceneFactory {
    func makeHomeScene() -> UIViewController
}

final class DefaultSceneFactory: SceneFactory {
    //MARK: - init(_:)
    public init() {}
    
    public func makeHomeScene() -> UIViewController {
        let homeViewController = HomeViewController()
        let homeConfigurator = DefaultHomeSceneConfigurator(sceneFactory: self)
        return homeConfigurator.configured(homeViewController)
    }
}
