//
//  NavigationManager.swift
//  ARFaceTracking1
//
//  Created by Jinyoung Yoo on 4/2/24.
//

import UIKit

class NavigationManager {
    static let shared = NavigationManager()
    private var navigationController: UINavigationController?
    
    private init() {}
    
    func addNavigationController(_ navigationController: UINavigationController) {
        if self.navigationController == nil {
            self.navigationController = navigationController
        }
    }
    
    func push(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }
}
