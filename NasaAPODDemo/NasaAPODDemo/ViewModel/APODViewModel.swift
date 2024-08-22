//
//  APODViewModel.swift
//  NasaAPODDemo
//
//  Created by Siddharth Adhvaryu on 22/08/24.
//

import Foundation

class ViewModel {
    private let service = APIService()
    
    var title: String = ""
    var explanation: String = ""
    var imageUrl: URL?
    
    var onUpdate: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func fetchAPOD() {
        service.fetchAPOD { [weak self] result in
            switch result {
            case .success(let response):
                self?.title = response.title
                self?.explanation = response.explanation
                self?.imageUrl = URL(string: response.url)
                DispatchQueue.main.async {
                    self?.onUpdate?()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
}
