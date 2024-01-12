//
//  SceneFactory.swift
//  FoodPizzaApp
//
//  Created by Владислав on 12.01.2024.
//

import UIKit
import HomeScene

public protocol SceneFactory {
    func makeLoginScene(with configurator: HomeConfigurator) -> UIViewController
}

public final class DefaultSceneFactory: SceneFactory {
    public func makeLoginScene(with configurator: HomeConfigurator) -> UIViewController {
        let vc = HomeViewController()
        return configurator.configured(vc)
    }
}
