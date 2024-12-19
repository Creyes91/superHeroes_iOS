//
//  SuperHeroesResponse.swift
//  SuperHeroes_iOs
//
//  Created by Tardes on 18/12/24.
//

import Foundation


struct SuperHeroesResponse: Codable
{
    let results : [SuperHeroe]
    
}

struct SuperHeroe: Codable
{
    let id: String
    let name: String
    let image: Image
    
}

struct Image : Codable
{
    let url : String
    
}
