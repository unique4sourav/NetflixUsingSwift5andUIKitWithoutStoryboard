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
    private let sectionTitles = ["Trending Movies", "Popular", "Trending TV", "Upcoming Movies", "Top Rated"]
    
    private let homeFeedTable = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        return tableView
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        view.backgroundColor = .systemBackground
        
        view.addSubview(homeFeedTable)
        homeFeedTable.dataSource = self
        homeFeedTable.delegate = self
     
        homeFeedTable.tableHeaderView =
        HeroHeaderView(frame: CGRect(x: 0, y: 0,
                                     width: view.frame.width,
                                     height: 450))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !didViewLayoutForFirstTime {
            didViewLayoutForFirstTime.toggle()
                        
            homeFeedTable.addConstraints(constraints: [
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
    
    private func configureNavBar() {
        var logoImage = UIImage(named: "netflix_logo")
        logoImage = logoImage?.withRenderingMode(.alwaysOriginal)
        let leftBarButtonItem = UIBarButtonItem(
            image: logoImage, style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = leftBarButtonItem
            
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "person"), style: .done, target: nil, action: nil),
            UIBarButtonItem(
                image: UIImage(systemName: "play.rectangle"), style: .done, target: nil, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .label
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {
            return
        }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.textColor = .label
        header.textLabel?.text = header.textLabel?.text?.lowercased()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            assertionFailure("couldn't cast to CollectionViewTableViewCell")
            return UITableViewCell()
        }
        cell.textLabel?.text = "indexPath.row = \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
}



extension UIView {
    
    func addConstraints(constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            constraint.isActive = true
        }
    }
    
}
