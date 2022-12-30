//
//  HomeViewController.swift
//  NetflixUsingSwift5andUIKitWithoutStoryboard
//
//  Created by Sourav on 30/12/22.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    private var didViewLayoutForFirstTime = false
    
    private let homeFeedTable = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(homeFeedTable)
        homeFeedTable.dataSource = self
        homeFeedTable.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !didViewLayoutForFirstTime {
            didViewLayoutForFirstTime.toggle()
                        
            homeFeedTable.addConstraints(
                constraints: [
                    homeFeedTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    
                    homeFeedTable.leadingAnchor.constraint(
                        equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    
                    homeFeedTable.bottomAnchor.constraint(
                        equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    
                    homeFeedTable.trailingAnchor.constraint(
                        equalTo: view.safeAreaLayoutGuide.trailingAnchor)
                ])
            
            
            
        }
    }
    
    
    
}


struct HomeViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .ignoresSafeArea()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<HomeViewControllerPreview.ContainerView>) -> some UIViewController {
            
            return HomeViewController()
        }
        
        func updateUIViewController(_ uiViewController: HomeViewControllerPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HomeViewControllerPreview.ContainerView>) {
            
        }
    }
}


//MARK: table view data source and delegate methods
extension HomeViewController:
    UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}



extension UIView {
    
    func addConstraints(constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            constraint.isActive = true
        }
    }
    
}
