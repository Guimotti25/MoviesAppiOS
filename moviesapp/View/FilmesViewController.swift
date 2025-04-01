//
//  ViewController.swift
//  moviesapp
//
//  Created by Guilherme Motti on 24/03/25.
//

import UIKit
import SDWebImage

class FilmesViewController: UIViewController
{
    @IBOutlet weak var collectionViewFilmes: UICollectionView!
    @IBOutlet weak var collectionViewOutrosFilmes: UICollectionView!
    private var listaFilmesPopulares: [Filmes] = []
    private var listaFilmesNovos: [Filmes] = []
    private var page: Int = 1
    private var viewModel: FilmesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel = FilmesViewModel()
        
        self.configurarLayout()
    }
    
    private func configurarLayout()
    {
        self.title = "Movies App"
        
        self.configurarCollections()
        self.obterListaFilmesPopulares()
        self.obterListaFilmesNovos()
    }
    
    
    private func configurarCollections()
    {
        let celulaFilmes = UINib(nibName: "CelulaFilmes", bundle: nil)
        self.collectionViewFilmes.delegate = self
        self.collectionViewFilmes.dataSource = self
        self.collectionViewFilmes.register(celulaFilmes, forCellWithReuseIdentifier: "CelulaFilmes")
        self.collectionViewOutrosFilmes.delegate = self
        self.collectionViewOutrosFilmes.dataSource = self
        self.collectionViewOutrosFilmes.register(celulaFilmes, forCellWithReuseIdentifier: "CelulaFilmes")
    }
    
    private func obterListaFilmesPopulares()
    {
        // Chamada errada (antiga):
        // self.listaFilmesPopulares = viewModel.consultarFilmesPopulares()

        // Chamada correta (nova):
        viewModel.consultarFilmesPopulares { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let filmes):
                    self?.listaFilmesPopulares = filmes
                    self!.collectionViewFilmes.reloadData()
                case .failure(let error):
                    // Tratar erro
                    break
                }
            }
        }
    }
    
    private func obterListaFilmesNovos()
    {
        // Chamada errada (antiga):
        // self.listaFilmesPopulares = viewModel.consultarFilmesPopulares()

        // Chamada correta (nova):
        viewModel.consultarNovosFilmes { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let filmes):
                    self?.listaFilmesNovos = filmes
                    self!.collectionViewOutrosFilmes.reloadData()
                case .failure(let error):
                    // Tratar erro
                    break
                }
            }
        }
    }
    
}

extension FilmesViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.collectionViewFilmes
        {
            return self.listaFilmesPopulares.count
        }
        else
        {
            return self.listaFilmesNovos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.collectionViewFilmes
        {
            let filme =  self.listaFilmesPopulares[indexPath.row]
            
            let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "CelulaFilmes", for: indexPath) as! CelulaFilmes
            
            let caminhoUrlImagem = "https://image.tmdb.org/t/p/w500" + (filme.posterPath)
            let placeholderImage = UIImage(named: "icon_loading")
            
            if let url = URL(string: caminhoUrlImagem)
            {
                celula.imagemFilme.sd_setImage(with: url, placeholderImage: placeholderImage)
            }
            else
            {
            celula.imagemFilme.image = placeholderImage
            }
            celula.labelNomeFilme.text = filme.title ?? ""
            
            return celula
        }
        else
        {
            let filme =  self.listaFilmesNovos[indexPath.row]
            
            let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "CelulaFilmes", for: indexPath) as! CelulaFilmes
            
            let caminhoUrlImagem = "https://image.tmdb.org/t/p/w500" + (filme.posterPath)
            let placeholderImage = UIImage(named: "icon_loading")
            
            if let url = URL(string: caminhoUrlImagem)
            {
                celula.imagemFilme.sd_setImage(with: url, placeholderImage: placeholderImage)
            }
            else
            {
            celula.imagemFilme.image = placeholderImage
            }
            celula.labelNomeFilme.text = filme.title ?? ""
            
            return celula
        }
     
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Método mais direto para teste
        let filme = listaFilmesPopulares[indexPath.row]
        
        if let detalhesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetalhesFilmeViewController") as? DetalhesFilmeViewController {
            detalhesVC.filme = filme
            
            // Tenta navigation, se falhar usa present
            self.navigationController?.pushViewController(detalhesVC, animated: true)
           
        } else {
            print("Falha crítica: Não foi possível criar DetalhesFilmesViewController")
            // Mostra alerta para o usuário
            let alert = UIAlertController(title: "Erro", message: "Não foi possível carregar os detalhes", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
}
