//
//  HomeConfigurator.swift
//  
//
//  Created by Владислав on 12.01.2024.
//

import Foundation
import APIManager

public protocol HomeConfigurator {
    func configured(_ vc: HomeViewController) -> HomeViewController
}

final class DefaultHomeSceneConfigurator: HomeConfigurator {
    private var sceneFactory: SceneFactory

    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }

    func configured(_ vc: HomeViewController) -> HomeViewController {
        let presenter = HomePresenter()
        let worker = ItemsWorker(networkService: NetworkService())
        let interactor = HomeInteractor(worker: worker, presenter: presenter)

        presenter.view = vc
        vc.interactor = interactor

        return vc
    }
}
