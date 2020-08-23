//
//  DetailViewController.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 22/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item: ItemModel?
    
    fileprivate let imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    fileprivate let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .red
        return indicator
    }()
    
    convenience init(item: ItemModel) {
        self.init()
        self.item = item
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupView()
    }
}

// MARK: - Setup

extension DetailViewController {
    
    fileprivate func setupView() {
        
        view.backgroundColor = .white
        title = String(format: "IdParam".localized, item?.id ?? "")
        
        switch item?.kind {
        case .image:
            setupImage()
        default:
            setupLabel()
        }
    }
    
    fileprivate func setupLabel() {
        
        let scrollView = UIScrollView()
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let contentView = UIView()
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        let dataLabel = UILabel()
        dataLabel.numberOfLines = 0
        dataLabel.text = item?.data
        
        contentView.addSubview(dataLabel)
        dataLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        }
        
        if dataLabel.text == nil {
            showAlert(title: "Error".localized, message: "NoData".localized, completion: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            })
        }
    }
    
    fileprivate func setupImage() {
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        }
        
        setupIndicator()
        downloadImage()
    }
    
    fileprivate func setupIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Download Image

extension DetailViewController {
    
    fileprivate func downloadImage() {
        
        guard let imageURL = item?.data else { return }
        
        activityIndicator.startAnimating()
        
        NetworkManager.performImageRequest(imageURL) { [weak self] (response) in
            
            if let data = response.data {
                self?.imageView.image = UIImage(data: data, scale:1)
            }
            
            if (self?.imageView.image) == nil  {
                self?.showAlert(title: "Error".localized, message: "FailedImage".localized, completion: { _ in
                    self?.navigationController?.popViewController(animated: true)
                })
            }
            
            self?.activityIndicator.stopAnimating()
        }
    }
    
}
