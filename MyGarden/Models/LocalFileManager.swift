//
//  LocalFileManager.swift
//  MyGarden
//
//  Created by Ismaïl on 14/11/2024.
//

import UIKit

class LocalFileManager {
    static let shared = LocalFileManager()
    private init() {}
    
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func saveImage(_ image: UIImage, name: String) throws {
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            throw URLError(.badServerResponse)
        }
        
        let url = getDocumentsDirectory().appendingPathComponent("\(name).jpg")
        try data.write(to: url)
    }
    
    func getImageURL(name: String) -> URL {
        getDocumentsDirectory().appendingPathComponent("\(name).jpg")
    }
}
