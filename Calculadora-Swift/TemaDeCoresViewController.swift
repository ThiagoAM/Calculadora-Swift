//
//  TemaDeCoresViewController.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import UIKit

// Ligação com o ViewController:
protocol DelegadoTemaDeCores {
    func comunicaTemaDeCores(nomeDoTemaDeCor: String)
}

class TemaDeCoresViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aplicaIdiomaTemaDeCores(idioma)
        colocaBordaEmViewBotaoCorAtivo(temaDeCorSendoUsado)
        
        // Ajusta a posição do indicador de rolamento:
        outletScrollViewCores.scrollIndicatorInsets = UIEdgeInsets(top: 45, left: 0, bottom: 0, right: 0)
        
        outletConstraintAlturaConteudoSV.constant = calculaAlturaDeConteudoDoScrollViewTemaCores(9)
    }
    
    // Define o tamanho do popover:
    override var preferredContentSize: CGSize {
        get {
            let width = CGFloat(250.0)
            let height = CGFloat(defineAlturaTelaTemaDeCores())
            return CGSize(width: width, height: height)
        }
        set {
            super.preferredContentSize = newValue
        }
    }
    
    // Variáveis:
    var delegadoDoTemaDeCores: DelegadoTemaDeCores?
    var temaDeCorSendoUsado: String = ""
    
    // Outlets:
    
        /// Scroll Views:
        @IBOutlet var outletScrollViewCores: UIScrollView!
    
    
    @IBOutlet var outletLabelTituloMenuCores: UILabel!
    @IBOutlet var outletConstraintAlturaConteudoSV: NSLayoutConstraint!
    @IBOutlet var outletViewBotaoPhantom: UIView!
    @IBOutlet var outletViewBotaoGatsu: UIView!
    @IBOutlet var outletViewBotaoMusk: UIView!
    @IBOutlet var outletViewBotaoSpaceCowboy: UIView!
    @IBOutlet var outletViewBotaoDroid: UIView!
    @IBOutlet var outletViewBotaoAppleClassic: UIView!
    @IBOutlet var outletViewBotaoRevolutionaryGirl: UIView!
    @IBOutlet var outletViewBotaoMinimalPaper: UIView!    
    @IBOutlet var outletViewBotaoSensai: UIView!
    
    
    
    // ---------
    // Funções: 
    // ---------
    
    
    /**
     
     Remove borda de todos os views que contém os botões de cores.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func removeBordaDeTodosOsViewsDosBotoesTemaDeCor() {
        colocaBordaEmUmView(outletViewBotaoPhantom, cor: UIColor.whiteColor(), larguraLinha: 0.0)
        colocaBordaEmUmView(outletViewBotaoGatsu, cor: UIColor.whiteColor(), larguraLinha: 0.0)
        colocaBordaEmUmView(outletViewBotaoMusk, cor: UIColor.whiteColor(), larguraLinha: 0.0)
        colocaBordaEmUmView(outletViewBotaoSpaceCowboy, cor: UIColor.whiteColor(), larguraLinha: 0.0)
        colocaBordaEmUmView(outletViewBotaoDroid, cor: UIColor.whiteColor(), larguraLinha: 0.0)
        colocaBordaEmUmView(outletViewBotaoAppleClassic, cor: UIColor.whiteColor(), larguraLinha: 0.0)
        colocaBordaEmUmView(outletViewBotaoRevolutionaryGirl, cor: UIColor.whiteColor(), larguraLinha: 0.0)
        colocaBordaEmUmView(outletViewBotaoMinimalPaper, cor: UIColor.whiteColor(), larguraLinha: 0.0)
        colocaBordaEmUmView(outletViewBotaoSensai, cor: UIColor.whiteColor(), larguraLinha: 0.0)
    }
    
    /**
     
     Coloca borda no view que contém o botão de cor atual.
     
     - Parâmetros: Tema de cor. (String)
     - Retorna: Nada.
     
    */
    func colocaBordaEmViewBotaoCorAtivo(temaDeCor: String) {
        removeBordaDeTodosOsViewsDosBotoesTemaDeCor()
        colocaBordaEmUmView(retornaViewBotaoDeCorPorNomeTema(temaDeCor), cor: UIColor(red:0.0, green:0.59, blue:0.53, alpha:1.0), larguraLinha: 2.0)
    }
    
    /**
     
     Retorna o view equivalente ao nome do tema de cor enviado como parâmetro.
     
     - Parâmetros: Tema de cor. (String)
     - Retorna: View do botão do tema de cor. (UIView!)
     
    */
    func retornaViewBotaoDeCorPorNomeTema(temaDeCor: String) -> UIView! {
        switch temaDeCor {
        case "Phantom":
            return outletViewBotaoPhantom
        case "Gatsu":
            return outletViewBotaoGatsu
        case "Musk":
            return outletViewBotaoMusk
        case "Space Cowboy":
            return outletViewBotaoSpaceCowboy
        case "Droid":
            return outletViewBotaoDroid
        case "Apple Classic":
            return outletViewBotaoAppleClassic
        case "Revolutionary Girl":
            return outletViewBotaoRevolutionaryGirl
        case "Minimal Paper":
            return outletViewBotaoMinimalPaper
        case "細い":
            return outletViewBotaoSensai
        default:
            return nil
        }
    }
    
    /**
     
     Define a altura do pop over de tema de cores.
     
     - Parâmetros: Nenhum.
     - Retorna: Altura do pop over. (CGFloat)
     
    */
    func defineAlturaTelaTemaDeCores() -> CGFloat {
        
        let tipoEEstadoDeTela = detectaTipoDeTela(UIScreen.mainScreen().bounds)
        
        if tipoEEstadoDeTela.containsString("ipad") {
            return 315.0
        } else {
            return 250.0
        }
    }

    /**
     
     Realiza as ações necessárias ao tocar em qualquer um dos botões de cor.
     
     - Parâmetros: sender. (UIButton)
     - Retorna: Nada.
     
    */
    @IBAction func toqueEmUmDosTemasDeCor(sender: UIButton) {
        
        self.delegadoDoTemaDeCores?.comunicaTemaDeCores(sender.titleLabel!.text!)
        colocaBordaEmViewBotaoCorAtivo(sender.titleLabel!.text!)
    }
    
    /**
     
     Calcula a altura do scroll-view do pop over de tema de cores.
     
     - Parâmetros: Quantidade de itens. (Int)
     - Retorna: Altura do scroll-view. (CGFLoat)
     
    */
    func calculaAlturaDeConteudoDoScrollViewTemaCores(quantidadeDeItens: Int) -> CGFloat {
        return (CGFloat(quantidadeDeItens) * 46.0) + 45.0
    }
}
