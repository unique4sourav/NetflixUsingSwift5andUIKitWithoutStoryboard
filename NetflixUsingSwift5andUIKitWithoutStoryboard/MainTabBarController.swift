//
//  ViewController.swift
//  NetflixUsingSwift5andUIKitWithoutStoryboard
//
//  Created by Sourav on 29/12/22.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let homeVC = UINavigationController(
            rootViewController: HomeViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.title = "Home"
        
        let upcomingVC = UINavigationController(
            rootViewController: UpcomingViewController())
        upcomingVC.tabBarItem.image = UIImage(systemName: "play.circle")
        upcomingVC.title = "Coming soon"
        
        let searchVC = UINavigationController(
            rootViewController: SearchViewController())
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchVC.title = "Search"
        
        let downloadsVC = UINavigationController(
            rootViewController: DownloadsViewController())
        downloadsVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        downloadsVC.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([homeVC, upcomingVC, searchVC, downloadsVC],
                           animated: true)
    }


}



struct MainTabBarControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .ignoresSafeArea()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainTabBarControllerPreview.ContainerView>) -> some UIViewController {
            
            return MainTabBarController()
        }
        
        func updateUIViewController(_ uiViewController: MainTabBarControllerPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainTabBarControllerPreview.ContainerView>) {
            
        }
    }
}
