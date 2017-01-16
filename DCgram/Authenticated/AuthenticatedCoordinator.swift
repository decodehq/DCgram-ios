//
//  AuthenticatedCoordinator.swift
//  DCgram
//
//  Created by Ante Baus on 24/11/16.
//  Copyright © 2016 DECODE HQ. All rights reserved.
//

import UIKit
import DCKit

private enum TabItemTag : Int {
    case Feed, Search, Camera, Notifications, MyProfile
}

class AuthenticatedCoordinator: Coordinator {
    private let rootTabBarController = UITabBarController()
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        rootTabBarController.tabBar.unselectedItemTintColor = Color.tabBarUnselectedItemTintColor
        rootTabBarController.tabBar.tintColor = Color.tabBarSelectedItemTintColor
        
        rootTabBarController.delegate = self
    }
    
    override func start() {
        
        let feedNC = UINavigationController()
        feedNC.tabBarItem = UITabBarItem(title: nil, image: ImageAssets.homeTabBarITem, tag: TabItemTag.Feed.rawValue)
        let feedCoordinator = FeedCoordinator(rootNavigationController: feedNC)
        addChildCoordinator(childCoordinator: feedCoordinator)
        feedCoordinator.start()
        
        let searchNC = UINavigationController()
        searchNC.tabBarItem = UITabBarItem(title: nil, image: ImageAssets.searchTabBarITem, tag: TabItemTag.Search.rawValue)
        let searchCoordinator = SearchCoordinator(rootNavigationController: searchNC)
        addChildCoordinator(childCoordinator: searchCoordinator)
        searchCoordinator.start()
        
        let cameraFakeVC = UIViewController()
        cameraFakeVC.tabBarItem = UITabBarItem(title: nil, image: ImageAssets.cameraTabBarITem, tag: TabItemTag.Camera.rawValue)
        
        let notificationsNC = UINavigationController()
        notificationsNC.tabBarItem = UITabBarItem(title: nil, image: ImageAssets.notificationsTabBarITem, tag: TabItemTag.Notifications.rawValue)
        let notificationsCoordinator = NotificationsCoordinator(rootNavigationController: notificationsNC)
        addChildCoordinator(childCoordinator: notificationsCoordinator)
        notificationsCoordinator.start()
        
        let myProfileNC = UINavigationController()
        myProfileNC.tabBarItem = UITabBarItem(title: nil, image: ImageAssets.myProfileTabBarITem, tag: TabItemTag.MyProfile.rawValue)
        let myProfileCoordinator = MyProfileCoordinator(rootNavigationController: myProfileNC)
        addChildCoordinator(childCoordinator: myProfileCoordinator)
        myProfileCoordinator.start()
        
        rootTabBarController.viewControllers = [feedNC, searchNC, cameraFakeVC, notificationsNC, myProfileNC]
        
        rootViewController.dc_attachChildVC(rootTabBarController)
    }
}

extension AuthenticatedCoordinator : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == TabItemTag.Camera.rawValue {
            // TODO: Present camera coordinator
            return false
        }
        return true
    }
}
