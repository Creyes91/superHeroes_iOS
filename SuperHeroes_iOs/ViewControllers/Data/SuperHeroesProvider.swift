//
//  SuperHeroesProvider.swift
//  SuperHeroes_iOs
//
//  Created by Tardes on 18/12/24.
//

import Foundation


class SuperHeroesProvider
{
    
    static func searchSuperHeroesBy(name : String) async throws -> [SuperHeroe]
    {
       let url = URL(string: "https://superheroapi.com/api/83dd00e52aa36f40333fcd2f2701b496/search/\(name)")!
       
        let session = URLSession.shared
        
        let (data,_) = try await session.data(from: url)
        
        let superHeroesResponse = try JSONDecoder().decode(SuperHeroesResponse.self, from: data)
        
        return superHeroesResponse.result
        
        
    }
    
    static func searchSuperHeroesBy (id : String) async throws -> SuperHeroe
    {
        let url = URL(string: "https://superheroapi.com/api/83dd00e52aa36f40333fcd2f2701b496/\(id)")!
        
        let session = URLSession.shared
        
        let (data,_) = try await session.data(from: url)
        
        let superHeroeResponse = try JSONDecoder().decode(SuperHeroe.self, from: data)
        
        return superHeroeResponse
        
        
    }
    
    
    
    
    
    
}
