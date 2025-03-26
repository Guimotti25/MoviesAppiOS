//
//  Extensions.swift
//  moviesapp
//
//  Created by Guilherme Motti on 26/03/25.
//

import UIKit

public extension UIView
{
    func aplicarGradienteVertical(startPoint: CGPoint, endPoint: CGPoint, colorArray: [UIColor])
    {
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
         
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        backgroundColor = .clear
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
   
    func setCircle()
    {
        self.setarRaio(radius: (self.frame.size.width/2))
    }
    
    func setarRaio(radius: CGFloat)
    {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func setarRaioCima(radius: CGFloat)
    {
        let mask = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        self.layer.maskedCorners = mask
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setarRaioBaixo(radius: CGFloat)
    {
        let mask = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner, .layerMinXMaxYCorner)
        self.layer.maskedCorners = mask
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
  
    
    func animarSubirView(duracao: TimeInterval){
        UIView.animate(withDuration: duracao, delay: 0, options: [.curveEaseOut],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    
    func animarDescerView(duracao: TimeInterval){
        UIView.animate(withDuration: duracao, delay: 0, options: [.curveEaseOut],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
        self.isHidden = true
            })
    }
    
    /// Realiza uma animação na view para "aparecer" ou "desaparecer" da tela do usuário
    /// - Parameters:
    ///     - tipoAnimacao: Qual o tipo de animação desejado
    ///     - estaVisivel: Se após a finalização da animação, a View está ou não visível
    ///     - duracao: Duração da animação
    func animarView(tipoAnimacao: TipoAnimacao, estaVisivel: Bool, duracao: TimeInterval)
    {
        UIView.animate(withDuration: duracao, delay: 0, options: .curveEaseInOut,
        animations: {
            switch tipoAnimacao
            {
            case .cimaParaBaixo:
                self.center.y += self.bounds.height
            case .baixoParaCima:
                self.center.y -= self.bounds.height
            case .esquedaParaDireita:
                self.center.x += self.bounds.width
            case .direitaParaEsquerda:
                self.center.x -= self.bounds.width
            }
            self.layoutIfNeeded()
        },
        completion:
        {
            _ in
           self.isHidden = !estaVisivel
        })
    }
    
    /// Enum para definição do tipo de animação a ser utilizado
    enum TipoAnimacao
    {
        /// Realiza a animação da View de cima para baixo da tela do usuário
        case cimaParaBaixo
        /// Realiza a animação da View de baixo para cima da tela do usuário
        case baixoParaCima
        /// Realiza a animação da View da direita para esqueda da tela do usuário
        case direitaParaEsquerda
        /// Realiza a animação da View da esqueda para a direita da tela do usuário
        case esquedaParaDireita
    }
}
