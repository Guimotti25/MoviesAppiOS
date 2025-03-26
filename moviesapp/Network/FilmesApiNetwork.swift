//
//  FilmesApiNetwork.swift
//  moviesapp
//
//  Created by Guilherme Motti on 24/03/25.

import Foundation
import Alamofire
import UIKit

class FilmesApiNetwork
{
    class func searchPopularMovies(completion: @escaping (Result<[String: Any], Error>) -> Void)
    {
        let url = "https://api.themoviedb.org/3/movie/popular"
        
        let headers: HTTPHeaders = [
                "Authorization": "Bearer " + KEY_FOR_MOVIE_API, // Substitua YOUR_API_KEY pelo seu token de autenticação
                "Content-Type": "application/json"  // Se necessário, adicione outro tipo de conteúdo
            ]
            
        AF.request(url, method: .get, headers: headers).responseJSON
        {
            response in

            switch response.result
            {
            case .success(let data):
                
                if let json = data as? [String: Any]
                {
                    completion(.success(json))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    class func searchNewMovies(completion: @escaping (Result<[String: Any], Error>) -> Void)
    {
        let url = "https://api.themoviedb.org/3/movie/now_playing"
        
        let headers: HTTPHeaders = [
                "Authorization": "Bearer " + KEY_FOR_MOVIE_API, // Substitua YOUR_API_KEY pelo seu token de autenticação
                "Content-Type": "application/json"  // Se necessário, adicione outro tipo de conteúdo
            ]
            
        AF.request(url, method: .get, headers: headers).responseJSON
        {
            response in

            switch response.result
            {
            case .success(let data):
                
                if let json = data as? [String: Any]
                {
                    completion(.success(json))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
