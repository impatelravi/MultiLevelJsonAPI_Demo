//
//  CollectionViewModel.swift
//  MultiLvlJsonAPIDemo
//
//  Created by Ravi Patel on 02/08/21.
//

import Foundation

class CollectionViewModel: NSObject {
    //MARK:- Variables
    let results: [CollectionViewResultModel]
    
    enum Keys: String {
        case results = "results"
    }
    
    //MARK:- Initializer
    init(dict: [String : Any]) {
        //results = getString(anything: dict[Keys.results.rawValue])
        let subData = dict[Keys.results.rawValue] as? [Dictionary] ?? []
        results = subData.map( { CollectionViewResultModel(dict: $0) } )
    }
}

class CollectionViewResultModel: NSObject {
    //MARK:- Variables
    let id: String
    let title: String
    let h1_title: String
    let media: [CollectionViewMediaModel]
    
    enum Keys: String {
        case id = "id"
        case title = "title"
        case h1_title = "h1_title"
        case media = "media"
        
    }
    
    //MARK:- Initializer
    init(dict: [String : Any]) {
        id = getString(anything: dict[Keys.id.rawValue])
        title = getString(anything: dict[Keys.title.rawValue])
        h1_title = getString(anything: dict[Keys.h1_title.rawValue])
        let subData = dict[Keys.media.rawValue] as? [Dictionary] ?? []
        media = subData.map( { CollectionViewMediaModel(dict: $0) } )
    }
}

class CollectionViewMediaModel: NSObject {
    //MARK:- Variables
    let gifURL: String
    
    enum Keys: String {
        case gif = "gif"
        case url = "url"
    }
    
    //MARK:- Initializer
    init(dict: [String : Any]) {
        self.gifURL = getString(anything: (dict[Keys.gif.rawValue] as? Dictionary)?[Keys.url.rawValue])
    }
}
