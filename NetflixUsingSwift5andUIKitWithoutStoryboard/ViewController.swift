//
//  ViewController.swift
//  NetflixUsingSwift5andUIKitWithoutStoryboard
//
//  Created by Sourav on 29/12/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }


}



struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .ignoresSafeArea()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerPreview.ContainerView>) -> some UIViewController {
            
            return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: ViewControllerPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerPreview.ContainerView>) {
            
        }
    }
}
