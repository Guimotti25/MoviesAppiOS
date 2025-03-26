//
//  CelulaFilmes.swift
//  moviesapp
//
//  Created by Guilherme Motti on 24/03/25.
//

import Foundation
import UIKit

class CelulaFilmes: UICollectionViewCell
{
    @IBOutlet weak var viewSombra: UIView!
    @IBOutlet weak var labelNomeFilme: UILabel!
    @IBOutlet weak var imagemFilme: UIImageView!
    @IBOutlet weak var viewCelula: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewCelula.setarRaio(radius: 12)
//        self.viewSombra.aplicarGradienteVertical(
//            startPoint: CGPoint(x: 0.5, y: 1.0), // Bottom center
//            endPoint: CGPoint(x: 0.5, y: 0.0),   // Top center
//            colorArray: [.black.withAlphaComponent(0.7), .black.withAlphaComponent(0.1)]
//        )
    }
    
    func configurarLayoutCelula(filmes: Filmes)
    {
        
    }
    
}
