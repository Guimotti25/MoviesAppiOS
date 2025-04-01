//
//  DetalhesFilmeViewController.swift
//  moviesapp
//
//  Created by Guilherme Motti on 31/03/25.
//

import UIKit

class DetalhesFilmeViewController: UIViewController
{
    @IBOutlet weak var imagemFilme: UIImageView!
    @IBOutlet weak var tituloFilme: UILabel!
    @IBOutlet weak var descricaoFilme: UILabel!
    @IBOutlet weak var notaFilme: UILabel!
    @IBOutlet weak var dataLancamento: UILabel!
    @IBOutlet weak var generoFilme: UILabel!
    @IBOutlet weak var botaoFavoritar: UIButton!
    @IBOutlet weak var viewInfosAdicionais: UIView!
    
    @IBOutlet weak var viewSinopseFilme: UIView!
    var filme: Filmes?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.configurarLayout()
    }
    
    private func configurarLayout()
    {
        self.viewInfosAdicionais.setarRaioCima(radius: 16)
        self.viewSinopseFilme.setarRaio(radius: 12)
        
        self.tituloFilme.text = self.filme?.originalTitle
        self.descricaoFilme.text = self.filme?.overview
        self.notaFilme.text = "Nota: \(self.filme?.voteAverage ?? 0.0)"
        self.dataLancamento.text = "Data de lançamento: \(self.filme?.releaseDate ?? "")"
     //   self.generoFilme.text = "Gênero: \(self.filme?.title ?? "")"
        
        let caminhoUrlImagem = "https://image.tmdb.org/t/p/w500" + (self.filme?.backdropPath ?? "")
        let placeholderImage = UIImage(named: "icon_loading")
        self.imagemFilme.sd_setImage(with: URL(string: caminhoUrlImagem), completed: nil)
    }

}
