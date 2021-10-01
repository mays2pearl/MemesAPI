//
//  MemeTableViewController.swift
//  MemesAPI
//
//  Created by Maysa on 30/09/21.
//

import Foundation
import Alamofire

class MemeTableView {
    
    private var memes: [MemeModel] = []
    
    func counter() -> Int {
        return self.memes.count
    }
    
    func currentMeme(index: Int) -> MemeModel {
        return self.memes[index]
    }
    
    func webRequest(completion: @escaping() -> Void) {
        AF.request("https://api.imgflip.com/get_memes").responseJSON { response in
            if response.response?.statusCode == 200 {
                if let data = response.data {
                    do {
                        let result: Result? = try JSONDecoder().decode(Result.self, from: data)
                        if let memesList = result?.data.memes {
                            for meme in memesList {
                                let meme = MemeModel(name: meme.name, image: meme.url)
                                self.memes.append(meme)
                            }
                            completion()
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
