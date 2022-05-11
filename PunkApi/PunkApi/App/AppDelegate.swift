//
//  AppDelegate.swift
//  PunkApi
//
//  Created by Rubén Muñoz López on 7/5/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    class func sharedAppDelegate() -> AppDelegate? {
        
        return UIApplication.shared.delegate as? AppDelegate
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    
    func showViewController(_ viewController: UIViewController, addTransition: Bool = false) {
        
        guard let window = UIApplication.shared.keyWindow else { return }
        
        let previousViewController = window.rootViewController
    
        if addTransition {
            addTransitionAnimation(window: window)
        }
        window.rootViewController = viewController
        
        if UIView.areAnimationsEnabled {
            UIView.animate(withDuration: CATransaction.animationDuration()) {
                viewController.setNeedsStatusBarAppearanceUpdate()
            }
        } else {
            viewController.setNeedsStatusBarAppearanceUpdate()
        }
        
        if let previousViewController = previousViewController {
            
            // Allow the view controller to be deallocate
            previousViewController.dismiss(animated: false) {
            // Remove the root view in case its still showing
            previousViewController.view.removeFromSuperview()
            }
        }
       // window.tintColor = .white
        window.makeKeyAndVisible()
    }
    
    private func addTransitionAnimation(window: UIWindow) {
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        window.layer.add(transition, forKey: kCATransition)
    }
}
