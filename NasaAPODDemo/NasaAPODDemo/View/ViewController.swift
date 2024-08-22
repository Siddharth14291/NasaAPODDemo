//
//  ViewController.swift
//  NasaAPODDemo
//
//  Created by Siddharth Adhvaryu on 22/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    private let lblTitle = UILabel()
    private let explanationLabel = UILabel()
    private let imageView = UIImageView()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.fetchAPOD()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    
        lblTitle.numberOfLines = 0
        explanationLabel.numberOfLines = 0
        errorLabel.numberOfLines = 0
        errorLabel.textColor = .red
        
        view.addSubview(lblTitle)
        view.addSubview(explanationLabel)
        view.addSubview(imageView)
        view.addSubview(activityIndicator)
        view.addSubview(errorLabel)
        
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        explanationLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            lblTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lblTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            explanationLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            explanationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            explanationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: 16),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupBindings() {
        viewModel.onUpdate = { [weak self] in
            guard let self = self else { return }
            self.lblTitle.text = self.viewModel.title
            self.explanationLabel.text = self.viewModel.explanation
            self.loadImage(from: self.viewModel.imageUrl)
            self.activityIndicator.stopAnimating()
        }
        
        viewModel.onError = { [weak self] errorMessage in
            guard let self = self else { return }
            self.errorLabel.text = errorMessage
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func loadImage(from url: URL?) {
        guard let url = url else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }
        task.resume()
    }
}
