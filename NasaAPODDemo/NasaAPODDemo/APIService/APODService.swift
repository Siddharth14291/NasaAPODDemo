//
//  APODService.swift
//  NasaAPODDemo
//
//  Created by Siddharth Adhvaryu on 22/08/24.
//

import Foundation

class APIService {
    private let apiKey = "aVp6VtjVp0gbiUEfkpJnkgACkmvvbfgygRI0DIIs"
    private let urlString = "https://api.nasa.gov/planetary/apod"
    private let cacheKey = "cachedAPOD"
    
    func fetchAPOD(completion: @escaping (Result<APODResponse, Error>) -> Void) {
        guard let url = URL(string: "\(urlString)?api_key=\(apiKey)") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // If there is an error and cached data exists, return cached data
                if let cachedData = UserDefaults.standard.data(forKey: self.cacheKey) {
                    do {
                        let apodResponse = try JSONDecoder().decode(APODResponse.self, from: cachedData)
                        completion(.success(apodResponse))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            do {
                let apodResponse = try JSONDecoder().decode(APODResponse.self, from: data)
                UserDefaults.standard.set(data, forKey: self.cacheKey) // Cache data
                completion(.success(apodResponse))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
