//
//  HistoricoCalculosViewController.swift
//  Calculadora-Swift
//
//  Created by Thiago Martins on 24/06/16.
//  Copyright © 2016 ThiagoMartins. All rights reserved.
//

import UIKit

// Ligação com o ViewController:
protocol DelegadoHistoricoCalculos {
    func comunicadorDeHistoricoDeCalculos(historico: String?, numeroDoBotao: Int?)
}


class HistoricoCalculosViewController: UIViewController {
    
    // Variáveis:
    var delegadoHistoricoCalculos: DelegadoHistoricoCalculos?
    var historicoDeCalculos = [String]()
    
    // Outlets:
    
        /// View Principal:
        @IBOutlet var outletViewPrincipalHistorico: UIView!
    
        /// Stack Views:
        @IBOutlet var outletViewHistorico: UIView!
    
        /// Constraints:
        @IBOutlet var outletConstraintAlturaStackView: NSLayoutConstraint!
    
        /// Labels:
        @IBOutlet var outletLabelTituloHistorico: UILabel!
        @IBOutlet var outletLabelHistoricoVazio: UILabel!
    
        /// Botões:
        @IBOutlet var outletBotaoLimpar: UIButton!
    
        /// Views:
        @IBOutlet var outletViewPaiBotaoLimpar: UIVisualEffectView!
    
        /// Scroll Views:
        @IBOutlet var outletScrollViewHistorico: UIScrollView!
    
    
    
    
    
    
    // --------------------------------------------------------------------------------------------------------------------------------------------------------- //
    // Métodos de Botões:
    
    /**
    */
    @IBAction func acaoBotaoLimpar() {
        
        let alertaDeletarHistorico = UIAlertController(title: dicionarioDesejaLimparHistorico[idioma], message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertaDeletarHistorico.addAction(UIAlertAction(title: dicionarioSim[idioma], style: .Default, handler: { (action: UIAlertAction!) in
            
            self.delegadoHistoricoCalculos?.comunicadorDeHistoricoDeCalculos(nil, numeroDoBotao: nil)
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        alertaDeletarHistorico.addAction(UIAlertAction(title: dicionarioCancelar[idioma], style: .Cancel, handler: { (action: UIAlertAction!) in
        }))
        
        presentViewController(alertaDeletarHistorico, animated: true, completion: nil)        
        
    }
    
    // --------------------------------------------------------------------------------------------------------------------------------------------------------- //
    // Métodos:
    
    /**
     
     Define a altura da tela de histórico.
     
     - Parâmetros: Nenhum.
     - Retorna: Altura da tela de histórico. (CGFloat)
     
     */
    func defineAlturaTelaHistorico() -> CGFloat {
        
        let tipoDeTela = detectaTipoDeTela(UIScreen.mainScreen().bounds)
        
        if tipoDeTela.containsString("ipad") {
            
            return 550.0
            
        } else {
            
            if tipoDeTela.containsString("iphone6Plus") {
                
                return 350.0
                
            } else if tipoDeTela.containsString("iphone6") {
                
                return 300.0
                
            } else {
                
                return 250.0
            }
        }
    }
    
    /**
     
     Define a largura da tela de histórico.
     
     - Parâmetros: Nenhum.
     - Retorna: Largura da tela de histórico. (CGFloat)
     
     */
    func defineLarguraTelaHistorico() -> CGFloat {
        
        let tipoDeTela = detectaTipoDeTela(UIScreen.mainScreen().bounds)
        
        if tipoDeTela.containsString("ipad") {
            
            return 295.0
            
        } else {
            
            if tipoDeTela.containsString("iphone6Plus") {
                
                return 390.0
                
            } else if tipoDeTela.containsString("iphone6") {
                
                return 350.0
                
            } else {
                
                return 295.0
            }
        }
    }
    
    
    /**
    */
    @IBAction func acaoBotao(sender: AnyObject) {
        
        self.delegadoHistoricoCalculos?.comunicadorDeHistoricoDeCalculos(removeResultadoFinalDoHistoricoDeCalculo(sender.titleLabel!!.text!), numeroDoBotao: Int(sender.restorationIdentifier!!)!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
    */
    func criaBotaoParaHistorico(tituloDoBotao: String) -> UIButton {
        
        let botao = UIButton(frame: CGRect(x: 5, y: definePosicaoYDeUmBotao(), width: (self.preferredContentSize.width) - 10, height: 50))
        
        // Cor:
        botao.backgroundColor = .None
        botao.setTitleColor(UIColor(red:0.0, green:0.48, blue:1.0, alpha:1.0), forState: .Normal)
        
        // Fonte:
        botao.titleLabel!.font = UIFont(name: ".SFUIDisplay-Light", size: 20)
        botao.titleLabel?.adjustsFontSizeToFitWidth = true
        
            /// Define o tamanho mínimo que a fonte pode atingir com a diminuiçã automática:
            botao.titleLabel?.minimumScaleFactor = CGFloat(0.6)
        
        // Cria um ID único para o botão:
        botao.restorationIdentifier = String(historicoDeCalculos.count)
        
        // Define o título:
        botao.setTitle(tituloDoBotao, forState: .Normal)
        
        // Define o método alvo:
        botao.addTarget(self, action: #selector(acaoBotao), forControlEvents: .TouchUpInside)
        
        return botao
    }
    
    /**
    */
    func adicionaBotoesAoHistorico() {
        
        while historicoDeCalculos.isEmpty == false {
            
            let novoBotao = criaBotaoParaHistorico(historicoDeCalculos.first!)
            outletViewHistorico.addSubview(novoBotao)
            historicoDeCalculos = [String](historicoDeCalculos.dropFirst())
        }
    }
    
    /**
    */
    func definePosicaoYDeUmBotao() -> CGFloat {
        
        return CGFloat(historicoDeCalculos.count * 50)
    }
    
    /**
     
     Remove o resultado final do histórico de calculos. "1 + 1 = 2" -> "1 + 1"
     
     - Parâmetros: Expressão matemática. (String)
     - Retorna: Expressão matemática sem resultado final. (String)
     
     */
    func removeResultadoFinalDoHistoricoDeCalculo(expressao: String) -> String {
        var expressaoSemResultado = expressao
        while expressaoSemResultado.characters.last != "=" {
            expressaoSemResultado = String(expressaoSemResultado.characters.dropLast())
        }
        expressaoSemResultado = String(expressaoSemResultado.characters.dropLast())
        expressaoSemResultado = String(expressaoSemResultado.characters.dropLast())
        return expressaoSemResultado
    }
    
    /**
     
     Calcula a altura do scroll view da pop over de histórico.
     
     - Parâmetros: Quantidade de itens. (Int)
     - Retorna: Altura do scroll view. (CGFloat)
     
     */
    func calculaAlturaDeConteudoDoScrollViewHistorico(quantidadeDeItens: Int) -> CGFloat {
        
        let altura = (CGFloat(quantidadeDeItens) * 50.0) + 100.0
        
        if altura <= outletViewHistorico.frame.height {
            return self.preferredContentSize.height + 1
        } else {
            return altura
        }
        
    }
    
    /**
    */
    func escondeOuMostraElementosDeInterface() {
        
        if historicoDeCalculos.isEmpty == false {
            outletLabelHistoricoVazio.hidden = true
        } else {
            outletViewPaiBotaoLimpar.hidden = true
        }
        
    }
    
    // --------------------------------------------------------------------------------------------------------------------------------------------------------- //
    
    // Função inicial da classe:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aplicaIdiomaHistorico(idioma)
        escondeOuMostraElementosDeInterface()
        
        // Ajusta a posição do indicador de rolamento:
        outletScrollViewHistorico.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        
        outletConstraintAlturaStackView.constant = calculaAlturaDeConteudoDoScrollViewHistorico(historicoDeCalculos.count)
        adicionaBotoesAoHistorico()
    }
    
    // Define o tamanho do popover:
    override var preferredContentSize: CGSize {
        get {
            let width = CGFloat(defineLarguraTelaHistorico())
            let height = CGFloat(defineAlturaTelaHistorico())
            return CGSize(width: width, height: height)
        }
        set {
            super.preferredContentSize = newValue
        }
    }

    
    
} // Fim class HistoricoCalculosViewController: UIViewController

























