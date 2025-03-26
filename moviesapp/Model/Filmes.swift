//
//  Filmes.swift
//  moviesapp
//
//  Created by Guilherme Motti on 24/03/25.


struct Filmes: Codable {
let adult: Bool?
let backdropPath: String
let genreIds: [Int]?
let id: Int?
let originalLanguage: String?
let originalTitle: String?
let overview: String?
let popularity: Double?
let posterPath: String
let releaseDate: String?
let title: String?
let video: Bool?
let voteAverage: Double?
let voteCount: Int?

enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case genreIds = "genre_ids"
    case id
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview
    case popularity
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case title
    case video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
}

init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    // Valores com tratamento especial para null
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? ""
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
    
    // Demais valores opcionais
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
}
}

struct FilmesResponse: Codable {
let results: [Filmes]

enum CodingKeys: String, CodingKey {
    case results
}
}
