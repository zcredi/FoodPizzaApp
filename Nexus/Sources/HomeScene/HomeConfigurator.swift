//
//  HomeConfigurator.swift
//  
//
//  Created by Владислав on 12.01.2024.
//

import Foundation

public protocol HomeConfigurator {
    func configured(_ vc: HomeViewController) -> HomeViewController
}

final class DefaultHomeSceneConfigurator: HomeConfigurator {
    private var sceneFactory: SceneFactory
    
    init(
        sceneFactory: SceneFactory
    ) {
        self.sceneFactory = sceneFactory
    }

    func configured(_ vc: HomeViewController) -> HomeViewController {
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        presenter.view = vc
        interactor.presenter = presenter
        vc.interactor = interactor
        return vc
    }
}
