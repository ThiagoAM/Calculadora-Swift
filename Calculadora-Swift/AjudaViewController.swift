//
//  AjudaViewController.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import UIKit

class AjudaViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aplicaIdiomaAjuda(idioma)
        
        // Ajusta a posição do indicador de rolamento:
        outletScrollViewAjuda.scrollIndicatorInsets = UIEdgeInsets(top: 45, left: 0, bottom: 0, right: 0)
        
    }
    
    // Outlets:
    
        /// Scroll Views:
        @IBOutlet var outletScrollViewAjuda: UIScrollView!
    
    
    @IBOutlet var outletLabelTituloAjuda: UILabel!
    @IBOutlet var outletLabelDescricaoInfinito: UILabel!
    @IBOutlet var outletLabelDescricaoNan: UILabel!
    
    // Define o tamanho do popover:
    override var preferredContentSize: CGSize {
        get {
            let largura = defineLarguraTelaAjuda()
            let altura = defineAlturaTelaAjuda()
            return CGSize(width: largura, height: altura)
        }
        set {
            super.preferredContentSize = newValue
        }
    }
    
    
    // ---------
    // Funções:
    // ---------
    
    /**
     
     Define a altura da tela de ajuda.
     
     - Parâmetros: Nenhum.
     - Retorna: Altura da tela de ajuda. (CGFloat)
     
     */
    func defineAlturaTelaAjuda() -> CGFloat {
        
        let tipoEEstadoDeTela = detectaTipoDeTela(UIScreen.mainScreen().bounds)
        
        if tipoEEstadoDeTela.containsString("ipad") {
            return 325.0
        } else {
            return 250.0
        }
    }
    
    
    /**
     
     Define a largura da tela de ajuda.
     
     - Parâmetros: Nenhum.
     - Retorna: Largura da tela de ajuda. (CGFloat)
     
     */
    func defineLarguraTelaAjuda() -> CGFloat {
        let tipoEEstadoDeTela = detectaTipoDeTela(UIScreen.mainScreen().bounds)
        
        if tipoEEstadoDeTela.containsString("ipad") {
            return 500.0
        } else {
            return 400.0
        }
    }


}
