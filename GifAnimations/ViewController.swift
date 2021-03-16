//
//  ViewController.swift
//  GifAnimations
//
//  Created by Andrey Babkov on 16.03.2021.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {
    private let uiKitTitleLabel = UILabel()
    private let uiKitImageView = UIImageView()
    
    private let asdkTitleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        
        [uiKitTitleLabel, uiKitImageView, asdkTitleLabel].forEach { view.addSubview($0) }
        
        setupUIKitLabel()
        setupUIKitImageView()
        
        setupAsdkLabel()
        setupAsdkImageView()
    }
}

// MARK: - Images

private extension ViewController {
    func setupUIKitImageView() {
        uiKitImageView.translatesAutoresizingMaskIntoConstraints = false
   
        let images = [
            UIImage(named: "patrick1")!,
            UIImage(named: "patrick2")!,
            UIImage(named: "patrick3")!,
        ]
                    
        uiKitImageView.image = UIImage.animatedImage(with: images, duration: 0.3)
        uiKitImageView.contentMode = .scaleAspectFit
        
        let constraints = [
            uiKitImageView.topAnchor.constraint(equalTo: uiKitTitleLabel.bottomAnchor),
            uiKitImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiKitImageView.widthAnchor.constraint(equalToConstant: 250),
            uiKitImageView.heightAnchor.constraint(equalToConstant: 200),
        ]
        
        constraints.forEach { $0.isActive = true }
    }
    
    func setupAsdkImageView() {
        guard let data = NSDataAsset(name: "patrick") else {
            return
        }

        let imageNode = ASImageNode()
        
        imageNode.animatedImage = ASPINRemoteImageDownloader.shared().animatedImage(with: data.data)
        imageNode.contentMode = .scaleAspectFit
        
        let resultView = imageNode.view
        resultView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultView)
        
        let constraints = [
            resultView.topAnchor.constraint(equalTo: asdkTitleLabel.bottomAnchor),
            resultView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultView.widthAnchor.constraint(equalToConstant: 250),
            resultView.heightAnchor.constraint(equalToConstant: 200),
        ]
        
        constraints.forEach { $0.isActive = true }
    }
}

// MARK: - Labels

private extension ViewController {
    func setupUIKitLabel() {
        uiKitTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        uiKitTitleLabel.text = "UI Kit"
        uiKitTitleLabel.font = .systemFont(ofSize: 19, weight: .bold)
        
        let titleConstraints = [
            uiKitTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiKitTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            uiKitTitleLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        titleConstraints.forEach { $0.isActive = true }
    }
    
    func setupAsdkLabel() {
        asdkTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        asdkTitleLabel.text = "ASDK"
        asdkTitleLabel.font = .systemFont(ofSize: 19, weight: .bold)
        
        let titleConstraints = [
            asdkTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            asdkTitleLabel.topAnchor.constraint(equalTo: uiKitImageView.bottomAnchor, constant: 40),
            asdkTitleLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        titleConstraints.forEach { $0.isActive = true }
    }
}
