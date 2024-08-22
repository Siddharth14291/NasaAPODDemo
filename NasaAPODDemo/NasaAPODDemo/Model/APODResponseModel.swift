//
//  APODResponseModel.swift
//  NasaAPODDemo
//
//  Created by Siddharth Adhvaryu on 22/08/24.
//

import Foundation

struct APODResponse: Codable {
    let title: String
    let explanation: String
    let url: String
    let media_type: String
}
