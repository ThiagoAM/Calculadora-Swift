//
//  HistoricoViewController.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import UIKit

// Ligação com o ViewController:
protocol DelegadoHistorico {
    func comunicadorDeHistorico(historicoOuAção: String, identificadorDoBotaoHistorico: String?)
}

class HistoricoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aplicaIdiomaHistorico(idioma)
        atualizaConteudoBotoesHistorico()
        ativaAutoShrinkDosBotoesDoHistorico()
        defineTamanhoMinimoFonteHistorico()                
    }
    
    // Variáveis:
    var delegate: DelegadoHistorico?
    var historicoDeCalculosDoViewController = [String]()
    var novaExpressao: String = ""
    
    
    // Outlets:
    @IBOutlet var outletLabelTituloHistorico: UILabel!
    @IBOutlet var outletBotaoLimpar: UIButton!
    @IBOutlet var scrollViewOutlet: UIScrollView!
    @IBOutlet var outletConteudoScrollView: UIView!
    @IBOutlet var constraintAlturaConteudoSV: NSLayoutConstraint!
    
    @IBOutlet var botaoHistorico01: UIButton!
    @IBOutlet var botaoHistorico02: UIButton!
    @IBOutlet var botaoHistorico03: UIButton!
    @IBOutlet var botaoHistorico04: UIButton!
    @IBOutlet var botaoHistorico05: UIButton!
    @IBOutlet var botaoHistorico06: UIButton!
    @IBOutlet var botaoHistorico07: UIButton!
    @IBOutlet var botaoHistorico08: UIButton!
    @IBOutlet var botaoHistorico09: UIButton!
    @IBOutlet var botaoHistorico10: UIButton!
    @IBOutlet var botaoHistorico11: UIButton!
    @IBOutlet var botaoHistorico12: UIButton!
    @IBOutlet var botaoHistorico13: UIButton!
    @IBOutlet var botaoHistorico14: UIButton!
    @IBOutlet var botaoHistorico15: UIButton!
    
    @IBOutlet var historicoVazio: UILabel!
    @IBOutlet var outletVisualEffectBotaoLimpar: UIVisualEffectView!
    
    // ---------
    // Funções:
    // ---------
    
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
    
    /**
     
     Define a altura da tela de histórico.
     
     - Parâmetros: Nenhum.
     - Retorna: Altura da tela de histórico. (CGFloat)
     
     */
    func defineAlturaTelaHistorico() -> CGFloat {
        
        if detectaTipoDeTela(UIScreen.mainScreen().bounds).containsString("ipad") {
            return 375.0
        } else {
            return 250.0
        }
    }
    
    /**
     
     Define a largura da tela de histórico.
     
     - Parâmetros: Nenhum.
     - Retorna: Largura da tela de histórico. (CGFloat)
     
     */
    func defineLarguraTelaHistorico() -> CGFloat {
        
        if detectaTipoDeTela(UIScreen.mainScreen().bounds).containsString("ipad") {
            return 500.0
        } else {
            return 335.0
        }
    }
    
    
    /**
     
     Atribui a diminuição de tamanho de fonte automática aos botões do histórico.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func ativaAutoShrinkDosBotoesDoHistorico() {
    
        // Ativa o Auto Shrink para as fontes dos botões do histórico:
        botaoHistorico01.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico02.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico03.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico04.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico05.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico06.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico07.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico08.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico09.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico10.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico11.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico12.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico13.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico14.titleLabel?.adjustsFontSizeToFitWidth = true
        botaoHistorico15.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    
    /**
     
     Define o tamanho mínimo que a fonte dos botões do histórico pode atingir com a diminuiçã automática.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func defineTamanhoMinimoFonteHistorico() {
        botaoHistorico01.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico02.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico03.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico04.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico05.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico06.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico07.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico08.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico09.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico10.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico11.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico12.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico13.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico14.titleLabel?.minimumScaleFactor = CGFloat(0.8)
        botaoHistorico15.titleLabel?.minimumScaleFactor = CGFloat(0.8)
    }
    
    
    /**
     
     OBSERVAÇÃO: MÉTODO DEVE SER SUBSTITUÍDO QUANDO A IMPLEMENTAÇÃO DE HISTÓRICOS "INFINITOS" FOR FEITA.
     PRIORIDADE: ALTA.
     
     Atualiza o conteúdo dos botões de histórico.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func atualizaConteudoBotoesHistorico() {
        
        
        let quantidadeDeHistoricos = historicoDeCalculosDoViewController.count
        constraintAlturaConteudoSV.constant = calculaAlturaDeConteudoDoScrollViewHistorico(quantidadeDeHistoricos)
        
        switch quantidadeDeHistoricos {
        case 0:
            scrollViewOutlet.hidden = true
            historicoVazio.hidden = false
            outletVisualEffectBotaoLimpar.hidden = true            
        case 1:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico02.hidden = true
            botaoHistorico03.hidden = true
            botaoHistorico04.hidden = true
            botaoHistorico05.hidden = true
            botaoHistorico06.hidden = true
            botaoHistorico07.hidden = true
            botaoHistorico08.hidden = true
            botaoHistorico09.hidden = true
            botaoHistorico10.hidden = true
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 2:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico03.hidden = true
            botaoHistorico04.hidden = true
            botaoHistorico05.hidden = true
            botaoHistorico06.hidden = true
            botaoHistorico07.hidden = true
            botaoHistorico08.hidden = true
            botaoHistorico09.hidden = true
            botaoHistorico10.hidden = true
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 3:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico04.hidden = true
            botaoHistorico05.hidden = true
            botaoHistorico06.hidden = true
            botaoHistorico07.hidden = true
            botaoHistorico08.hidden = true
            botaoHistorico09.hidden = true
            botaoHistorico10.hidden = true
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 4:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico05.hidden = true
            botaoHistorico06.hidden = true
            botaoHistorico07.hidden = true
            botaoHistorico08.hidden = true
            botaoHistorico09.hidden = true
            botaoHistorico10.hidden = true
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 5:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico06.hidden = true
            botaoHistorico07.hidden = true
            botaoHistorico08.hidden = true
            botaoHistorico09.hidden = true
            botaoHistorico10.hidden = true
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 6:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico07.hidden = true
            botaoHistorico08.hidden = true
            botaoHistorico09.hidden = true
            botaoHistorico10.hidden = true
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 7:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[6], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico07.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico08.hidden = true
            botaoHistorico09.hidden = true
            botaoHistorico10.hidden = true
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 8:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[7], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[6], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico07.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico08.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)                                    
            
            botaoHistorico09.hidden = true
            botaoHistorico10.hidden = true
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 9:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[8], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[7], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[6], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico07.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico08.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico09.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico10.hidden = true
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 10:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[9], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[8], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[7], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[6], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico07.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico08.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico09.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico10.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico11.hidden = true
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 11:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[10], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[9], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[8], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[7], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[6], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico07.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico08.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico09.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico10.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico11.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico12.hidden = true
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 12:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[11], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[10], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[9], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[8], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[7], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[6], forState: UIControlState.Normal)
            botaoHistorico07.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico08.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico09.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico10.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico11.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico12.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico13.hidden = true
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 13:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[12], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[11], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[10], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[9], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[8], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[7], forState: UIControlState.Normal)
            botaoHistorico07.setTitle(historicoDeCalculosDoViewController[6], forState: UIControlState.Normal)
            botaoHistorico08.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico09.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico10.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico11.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico12.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico13.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico14.hidden = true
            botaoHistorico15.hidden = true
        case 14:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[13], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[12], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[11], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[10], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[9], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[8], forState: UIControlState.Normal)
            botaoHistorico07.setTitle(historicoDeCalculosDoViewController[7], forState: UIControlState.Normal)
            botaoHistorico08.setTitle(historicoDeCalculosDoViewController[6], forState: UIControlState.Normal)
            botaoHistorico09.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico10.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico11.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico12.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico13.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico14.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
            botaoHistorico15.hidden = true
        case 15:
            scrollViewOutlet.hidden = false
            outletVisualEffectBotaoLimpar.hidden = false
            historicoVazio.hidden = true
            botaoHistorico01.setTitle(historicoDeCalculosDoViewController[14], forState: UIControlState.Normal)
            botaoHistorico02.setTitle(historicoDeCalculosDoViewController[13], forState: UIControlState.Normal)
            botaoHistorico03.setTitle(historicoDeCalculosDoViewController[12], forState: UIControlState.Normal)
            botaoHistorico04.setTitle(historicoDeCalculosDoViewController[11], forState: UIControlState.Normal)
            botaoHistorico05.setTitle(historicoDeCalculosDoViewController[10], forState: UIControlState.Normal)
            botaoHistorico06.setTitle(historicoDeCalculosDoViewController[9], forState: UIControlState.Normal)
            botaoHistorico07.setTitle(historicoDeCalculosDoViewController[8], forState: UIControlState.Normal)
            botaoHistorico08.setTitle(historicoDeCalculosDoViewController[7], forState: UIControlState.Normal)
            botaoHistorico09.setTitle(historicoDeCalculosDoViewController[6], forState: UIControlState.Normal)
            botaoHistorico10.setTitle(historicoDeCalculosDoViewController[5], forState: UIControlState.Normal)
            botaoHistorico11.setTitle(historicoDeCalculosDoViewController[4], forState: UIControlState.Normal)
            botaoHistorico12.setTitle(historicoDeCalculosDoViewController[3], forState: UIControlState.Normal)
            botaoHistorico13.setTitle(historicoDeCalculosDoViewController[2], forState: UIControlState.Normal)
            botaoHistorico14.setTitle(historicoDeCalculosDoViewController[1], forState: UIControlState.Normal)
            botaoHistorico15.setTitle(historicoDeCalculosDoViewController[0], forState: UIControlState.Normal)
        default:
            break
        }
        
    }
    
    
    /**
     
     Calcula a altura do scroll view da pop over de histórico.
     
     - Parâmetros: Quantidade de itens. (Int)
     - Retorna: Altura do scroll view. (CGFloat)
     
    */
    func calculaAlturaDeConteudoDoScrollViewHistorico(quantidadeDeItens: Int) -> CGFloat {
        return (CGFloat(quantidadeDeItens) * 56.0 + 1.0) + 92.0
    }
    
    
    /**
     
     Realiza as ações necessárias quando o usuário toca em um botão de histórico.
     
     - Parâmetros: sender. (UIButton)
     - Retorna: Nada.
     
    */
    @IBAction func acaoToqueEmAlgumHistorico(sender: UIButton) {
        
        novaExpressao = sender.titleLabel!.text!
        novaExpressao = removeResultadoFinalDoHistoricoDeCalculo(novaExpressao)
        self.delegate?.comunicadorDeHistorico(self.novaExpressao, identificadorDoBotaoHistorico: sender.restorationIdentifier)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /**
     
     Limpa todo o histórico dos dados locais.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    @IBAction func limparHistorico() {
        
        let alertaDeletarHistorico = UIAlertController(title: dicionarioDesejaLimparHistorico[idioma], message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertaDeletarHistorico.addAction(UIAlertAction(title: dicionarioSim[idioma], style: .Default, handler: { (action: UIAlertAction!) in
            
            self.historicoDeCalculosDoViewController = [String]()
            self.delegate?.comunicadorDeHistorico("Limpar", identificadorDoBotaoHistorico: nil)
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        alertaDeletarHistorico.addAction(UIAlertAction(title: dicionarioCancelar[idioma], style: .Cancel, handler: { (action: UIAlertAction!) in
        }))
        
        presentViewController(alertaDeletarHistorico, animated: true, completion: nil)
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
}

