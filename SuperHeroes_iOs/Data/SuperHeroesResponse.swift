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
    let powerstats: powerstats
    let  biography: biography
    
}

struct Image : Codable
{
    let url : String
    
}

struct powerstats : Codable
{
    let intelligence: String
    let strength : String
    let speed: String
    let durability : String
    let power : String
    let combat: String
}

struct biography: Codable {
    let realName: String
    let publisher: String
    let alignment: String
    let placeOfBirth: String
    
    private enum CodingKeys : String, CodingKey {
        case alignment, publisher
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
    }
}
