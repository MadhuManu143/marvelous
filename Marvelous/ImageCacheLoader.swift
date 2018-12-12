//
//  ImageCacheLoader.swift
//  Marvelous
//
//  Created by Madhu Rimmalapudi on 12/11/18.
//  Copyright © 2018 Mark Turner. All rights reserved.
//

import Foundation
import UIKit


class ImageCacheLoader {
    
    static let cache = NSCache<NSString, UIImage>()
    
    static func downloadImage(withUrl url:URL,completion: @escaping(_ image:UIImage?)->()){
        let dataTask = URLSession.shared.dataTask(with: url){  data, responceUrl,error in
            var downloadedImage: UIImage?
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            if  downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
            }
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
            
        }
        dataTask.resume()
    }
    static func getImage(withUrl url:URL, completion:@escaping (_ image:UIImage?)-> ()){
        if let image = cache.object(forKey: url.absoluteString as NSString){
            completion(image)
        }else{
            downloadImage(withUrl: url, completion: completion)
        }

    }
    
}
