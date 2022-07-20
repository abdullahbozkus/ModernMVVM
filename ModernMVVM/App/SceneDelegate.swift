//
//  SceneDelegate.swift
//  ModernMVVM
//
//  Created by Abdullah Bozkus on 5/20/22.
//  Copyright © 2022 Abdullah Bozkus. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let rootView = MoviesListView(viewModel: MoviesListViewModel())
            window.rootViewController = UIHostingController(rootView: rootView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

