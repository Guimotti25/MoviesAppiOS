import Foundation
class FilmesViewModel
{
    private var filmesPopulares: [Filmes] = []
    private var filmesNovos: [Filmes] = []
    
    func consultarFilmesPopulares(completion: @escaping (Result<[Filmes], Error>) -> Void) {
        FilmesApiNetwork.searchPopularMovies { [weak self] response in
            switch response {
            case .success(let json):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json)
                    let decoder = JSONDecoder()
                    let resposta = try decoder.decode(FilmesResponse.self, from: jsonData)
                    self?.filmesPopulares = resposta.results
                    completion(.success(resposta.results))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Função para acessar os filmes já carregados
    func getFilmesPopulares() -> [Filmes] {
        return filmesPopulares
    }
    
    func consultarNovosFilmes(completion: @escaping (Result<[Filmes], Error>) -> Void) {
        FilmesApiNetwork.searchPopularMovies { [weak self] response in
            switch response {
            case .success(let json):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json)
                    let decoder = JSONDecoder()
                    let resposta = try decoder.decode(FilmesResponse.self, from: jsonData)
                    self?.filmesNovos = resposta.results
                    completion(.success(resposta.results))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getFilmesNovoss() -> [Filmes] {
        return filmesNovos
    }
}
