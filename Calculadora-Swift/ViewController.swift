//
//  ViewController.swift
//  Calculadora-Swift 1.0
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//  
//  thianmaru@icloud.com

/* ------------------------------------------------------------------------------------ *
 *                                                                                      *
 *  Calculadora Swift é um software livre; você pode redistribuí-lo e/ou modificá-lo    *
 *  dentro dos termos da Licença Pública Geral GNU como publicada pela Fundação do      *
 *  Software Livre (FSF); na versão 3 da Licença.                                       *
 *                                                                                      *
 *  Este programa é distribuído na esperança de que possa ser  útil, mas SEM NENHUMA    *
 *  GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO   *
 *  EM PARTICULAR. Veja a Licença Pública Geral GNU para maiores detalhes.              *
 *                                                                                      *
 *  Você deve ter recebido uma cópia da Licença Pública Geral GNU junto com este        *
 *  programa, Se não, veja <http://www.gnu.org/licenses/>.                              *
 *                                                                                      *
 * ------------------------------------------------------------------------------------ */

//
//
//                              * * * * * * * * * * * *
//                              * ------------------- *
//                              *   mc  m+  m-  ms    *
//                              *                     *
//                              *  CALCULADORA SWIFT  *
//                              *                     *
//                              *         1.0         *
//                              *                     *
//                              *            4 + 2    *
//                              * ------------------- *
//                              *  | C | ← | ( | ) |  *
//                              * ------------------- *
//                              *  | 7 | 8 | 9 | × |  *
//                              * ------------------- *
//                              *  | 4 | 5 | 6 | - |  *
//                              * ------------------- *
//                              *  | 1 | 2 | 3 | + |  *
//                              * ------------------- *
//                              * * * * * * * * * * * *
//
//


import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, UIApplicationDelegate, UIPopoverPresentationControllerDelegate {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Carrega as configurações do menu de mais opções:
        configuracoesUsuario = carregaERetornaConfiguracoesDoUsuario()
        idioma = configuracoesUsuario["Idioma"] as! String
        
        // Carrega o histórico de expressões e suas linhas do tempo:
        historicoELinhasDoTempo = carregaERetornaHistoricoELinhasDotempo()
        
        // Carrega e atribui o último estado da calculadora:
        atribuiUltimoEstadoParaVisores(carregaUltimoEstadoCalculadora())
        
        // Aplica a linguagem:
        aplicaIdiomaViewController(idioma)
        
        // Carrega a cor de Fundo:
        alteraTemaDaCalculadora(carregaERetornaTemaDaCalculadora())
        
        // Cria e atribui os toques para UILabel (Resultado Antigo)
        criaEAtribuiDetectoresDeToques()
        
        // Cria uma notificação de orientação de tela:
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.acaoMudancaDeOrientacao), name: UIDeviceOrientationDidChangeNotification, object: nil)
                        
        // Cria uma notificação ao fechar o App.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.aplicaFuncoesAoFecharApp), name: UIApplicationWillTerminateNotification, object: nil)
        
        // Cria uma notificação quando o usuário sair do app:
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.aplicaFuncoesAoFecharApp), name: UIApplicationWillResignActiveNotification, object: nil)
        
        // Altera o status do botão Deg/Rad:
        verificaEAlteraStatusBotaoDegOuRad()
    }
    
    // Deixa a Barra de Status Branca.
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
                            
    
    /* ____________--------------------------_____________*/
    /* ------------  VARIÁVEIS e CONSTANTES  ----------- */
    /* ____________--------------------------_____________*/
    
    
    //
    // Chaves para o armazenamento local:
    //
    struct chavesDeArmazenamentoLocal {
        
        static let chaveCorDaCalculadora = "Tema de Cor"
        static let chaveUltimoEstadoCalculadora = "Último Estado da Calculadora"
        static let chaveHistoricoELinhasDoTempo = "Histórico e Linhas do Tempo"        
        static let chaveConfiguracoesUsuario = "Configurações do Menu de Mais Opções"
        
    }
    
    // Dicionário que contém as configurações do menu de mais opções:
    var configuracoesUsuario = [String:AnyObject]()
    
    // Dicionário que contém os históricos e suas linhas do tempo:
    var historicoELinhasDoTempo = [String:AnyObject]()
    
    // Uma linha do tempo (Vetor) que faz o botão Del retornar ao estado anterior.
    var linhaDoTempoDaExpressao: [String] = [""]
    
    // Quantidade máxima de históricos:
    let QUANTIDADE_MAX_HISTORICO = 1024
    
    // Detector de toque para Memória:
    let detectorDeToqueMemoria = UITapGestureRecognizer()
    
    // Detector de toque para 'Resultado Antigo'.
    let toqueResultadoAntigo = UITapGestureRecognizer()
    
    // Detector de toque para 'Resultado Final'.
    let toqueResultadoFinal = UITapGestureRecognizer()
    
    
    // -----------------
    //
    //    CORES:
    //
    // -----------------
    
    var corFundoMenuDeOpcoes = UIColor.blackColor()
    let nomeTemaDeCorPadrao = "Musk"
    
    
    
    /* ____________-------------------------_____________*/
    /* ------------       LIGAÇÕES UI       ------------ */
    /* ____________-------------------------_____________*/
    
    
    /// Stack Views:
        
    @IBOutlet var outletStackViewVisoresUltimoResultadoEMemoria: UIStackView!
    @IBOutlet var outletStackViewTeclado: UIStackView!    
    @IBOutlet var outletStackViewMemoria: UIStackView!
    @IBOutlet var menuDeOpcoes: UIStackView!
    
    
    /// Constraints:
    
    @IBOutlet var outletConstraintAlturaExpressaoMatematica: NSLayoutConstraint!
    @IBOutlet var outletConstraintAlturaResultadoFinal: NSLayoutConstraint!
    @IBOutlet var outletConstraintAlturaCabecalho: NSLayoutConstraint!
    @IBOutlet var outletConstraintAlturaStackViewTeclado: NSLayoutConstraint!
    @IBOutlet var larguraViewDoBotaoDegRad: NSLayoutConstraint!
    
    
    /// Botões:
    
    //  Menu de Opções:
    
    @IBOutlet var botaoConfig: UIButton!
    @IBOutlet var botaoHistorico: UIButton!
    
    @IBOutlet var outletBotaoHistorico: UIButton!
    @IBOutlet var outletBotaoVoltarMenuOpcoes: UIButton!
    @IBOutlet var outletBotaoCoresMenuOpcoes: UIButton!
    @IBOutlet var outletBotaoAjudaMenuOpcoes: UIButton!
    @IBOutlet var outletBotaoMaisOpcoesMenuOpcoes: UIButton!
    
    
    
    //  Memória:
    @IBOutlet var outletBotaoMc: UIButton!
    @IBOutlet var outletBotaoMMais: UIButton!
    @IBOutlet var outletBotaoMMenos: UIButton!
    @IBOutlet var outletBotaoMS: UIButton!
    
    
    /// Views:
    @IBOutlet var outletViewStackViewTeclado: UIView!
    @IBOutlet var outletViewStackViewCabecalho: UIView!
    @IBOutlet var outletViewBotaoVoltar: UIView!
    @IBOutlet var outletViewBotaoMaisOpcoes: UIView!
    @IBOutlet var outletViewBotaoAjuda: UIView!
    @IBOutlet var outletViewBotaoCores: UIView!
    @IBOutlet var outletViewMemoria: UIView!
    @IBOutlet var outletViewResultadoAntigo: UIView!
    
    
    /// Labels:
    
    // Visores:
    
    @IBOutlet var outletLabelResultadoFinal: UILabel!
    @IBOutlet var outletLabelExpressaoMatematica: UILabel!
    @IBOutlet var outletVisorDeMemoria: UILabel!
    @IBOutlet var resultadoAntigo: UILabel!
    
    @IBOutlet var outletBarraDeStatus: UIView!
    @IBOutlet var outletBotaoDegOuRad: UIButton!
    @IBOutlet var outletStackViewVisores: UIStackView!
    @IBOutlet var viewPrincipal: UIView!
    @IBOutlet var viewPrincipalStack: UIStackView!
    @IBOutlet var resultadoAntigoStack: UIStackView!
    @IBOutlet var resultadoFinalStack: UIStackView!
    
                        
    // Teclado - Fileiras Horizontais
    //
    //     Primeira Fileira:
    @IBOutlet var outletBotaoPiHorizontal: UIButton!
    @IBOutlet var outletBotaoLogHorizontal: UIButton!
    @IBOutlet var outletBotaoSinHorizontal: UIButton!
    @IBOutlet var outletBotaoCosHorizontal: UIButton!
    @IBOutlet var outletBotaoTanHorizontal: UIButton!
    //     Segunda Fileira:
    @IBOutlet var outletBotaoEHorizontal: UIButton!
    @IBOutlet var outletBotaoXlogHorizontal: UIButton!
    @IBOutlet var outletBotaoSinhHorizontal: UIButton!
    @IBOutlet var outletBotaoCoshHorizontal: UIButton!
    @IBOutlet var outletBotaoTanhHorizontal: UIButton!
    //     Terceira Fileira:        
    @IBOutlet var outletBotaoGoldenRatioHorizontal: UIButton!
    @IBOutlet var outleBotaoLnHorizontal: UIButton!
    @IBOutlet var outletBotaoAsinHorizontal: UIButton!
    @IBOutlet var outletBotaoAcosHorizontal: UIButton!
    @IBOutlet var outletBotaoAtanHorizontal: UIButton!
    //     Quarta Fileira:
    @IBOutlet var outletBotaoRandHorizontal: UIButton!
    @IBOutlet var outletBotaoXrootHorizontal: UIButton!
    @IBOutlet var outletBotaoAsinhHorizontal: UIButton!
    @IBOutlet var outletBotaoAcoshHorizontal: UIButton!
    @IBOutlet var outletBotaoAtanhHorizontal: UIButton!
    
    
    
    
    
    
    // Teclado - Fileiras Verticais:
    @IBOutlet var tecladoFileira05: UIStackView!
    @IBOutlet var tecladoFileira06: UIStackView!
    @IBOutlet var tecladoFileira07: UIStackView!
    @IBOutlet var tecladoFileira08: UIStackView!
    @IBOutlet var tecladoFileira09: UIStackView!
    
    
    // Teclado - Botões individuais:
    
    // -- C e Del --
    @IBOutlet var cOutlet: UIButton!
    @IBOutlet var delOutlet: UIButton!
    
    // -- Números --
    @IBOutlet var pontoOutlet: UIButton!
    @IBOutlet var zeroOutlet: UIButton!
    @IBOutlet var umOutlet: UIButton!
    @IBOutlet var doisOutlet: UIButton!
    @IBOutlet var tresOutlet: UIButton!
    @IBOutlet var quatroOutlet: UIButton!
    @IBOutlet var cincoOutlet: UIButton!
    @IBOutlet var seisOutlet: UIButton!
    @IBOutlet var seteOutlet: UIButton!
    @IBOutlet var oitoOutlet: UIButton!
    @IBOutlet var noveOutlet: UIButton!
    
    // -- Parênteses --
    @IBOutlet var abreParentesesOutlet: UIButton!
    @IBOutlet var fechaParentesesOutlet: UIButton!
    @IBOutlet var abreEFechaParentesesOutlet: UIButton!
    
    // -- Operações Simples 01 --
    @IBOutlet var dividirOutlet: UIButton!
    @IBOutlet var vezesOutlet: UIButton!
    @IBOutlet var menosOutlet: UIButton!
    @IBOutlet var maisOutlet: UIButton!
    @IBOutlet var raizQuadradaOutlet: UIButton!
    @IBOutlet var porCentoOutlet: UIButton!
    @IBOutlet var potenciaOutlet: UIButton!
    @IBOutlet var fatorialOutlet: UIButton!
    @IBOutlet var maisOuMenosOutlet: UIButton!
    
    // -- Operações Complexas 01: Sin, Cos, Tan, etc...
    @IBOutlet var sinOutlet: UIButton!
    @IBOutlet var cosOutlet: UIButton!
    @IBOutlet var tanOutlet: UIButton!
    @IBOutlet var sinhOutlet: UIButton!
    @IBOutlet var coshOutlet: UIButton!
    @IBOutlet var tanhOutlet: UIButton!
    @IBOutlet var asinOutlet: UIButton!
    @IBOutlet var acosOutlet: UIButton!
    @IBOutlet var atanOutlet: UIButton!
    @IBOutlet var asinhOutlet: UIButton!
    @IBOutlet var acoshOutlet: UIButton!
    @IBOutlet var atanhOutlet: UIButton!
    
    // -- Operações Complexas 02: π, e, Rand e ln
    @IBOutlet var piOutlet: UIButton!
    @IBOutlet var eOutlet: UIButton!
    @IBOutlet var outletBotaoGoldenRatio: UIButton!
    @IBOutlet var randOutlet: UIButton!
    @IBOutlet var lnOutlet: UIButton!
    
    @IBOutlet var logXOutlet: UIButton!
    @IBOutlet var log10outlet: UIButton!
    @IBOutlet var xRootOutlet: UIButton!
    
    
    
    
    /* ____________-------------------------_____________ */
    /* ------------         MÉTODOS         ------------  */
    /* ____________-------------------------_____________ */
    
    
    /**
     
        Aplica a ação desejada sempre que uma mudança de orientação ocorrer.
     
        - Parâmetros: Nenhum.
        - Retorna: Nada.
     
    */
    func acaoMudancaDeOrientacao() {
        escondeFileirasDeAcordoComTipoDeTela()
    }
    
    
    /**
     
        Atribui todos os valores do dicionário de último estado para seus respectivos visores.
     
        - Parâmetros: Último estado da calculadora. [String:AnyObject]
        - Retorna: Nada.
     
    */
    func atribuiUltimoEstadoParaVisores(ultimoEstadoCalculadora: [String:AnyObject]) {
        
        outletLabelExpressaoMatematica.text = ultimoEstadoCalculadora["Expressão Matemática"] as? String
        resultadoAntigo.text = ultimoEstadoCalculadora["Último Resultado"] as? String
        outletVisorDeMemoria.text = ultimoEstadoCalculadora["Memória"] as? String
        linhaDoTempoDaExpressao = ultimoEstadoCalculadora["Linha do Tempo da Expressão Matemática"] as! [String]
        mostraResultadoFinal()
    }
    
    
    /**
     
        Cria um dicionário de último estado a partir dos dados atuais de seus respectivos visores.
     
        - Parâmetros: Nenhum.
        - Retorna: Dicionário de último estado. [String:AnyObject]
     
    */
    func criaDicionarioComUltimoEstado() -> [String:AnyObject] {
        
        var dicionarioUltimoEstadoTemp = dicionarioEstadoInicialDaCalculadora
        
        dicionarioUltimoEstadoTemp["Expressão Matemática"] = outletLabelExpressaoMatematica.text
        dicionarioUltimoEstadoTemp["Último Resultado"] = resultadoAntigo.text
        dicionarioUltimoEstadoTemp["Memória"] = outletVisorDeMemoria.text
        dicionarioUltimoEstadoTemp["Linha do Tempo da Expressão Matemática"] = linhaDoTempoDaExpressao
        
        return dicionarioUltimoEstadoTemp
    }
    
    
    /**
     
        Detecta e aplica as ações de qualquer um dos botões de memória.
     
        - Parâmetros: sender. (UIButton)
        - Retorna: Nada.
     
    */
    @IBAction func acaoBotoesMemoria(sender: UIButton) {
        
        reproduzSomDeTecla()
        
        switch sender.titleLabel!.text! {
        case "mc":
            
            outletVisorDeMemoria.text = ""
            
        case "m+":
            
            if verificaSeResultadoFinalENumero(outletLabelResultadoFinal.text!) == true && outletLabelResultadoFinal.text! != "0" && outletVisorDeMemoria.text!.isEmpty == false {
                
                let expressaoSomaDeMemoria = outletVisorDeMemoria.text! + "+" + outletLabelResultadoFinal.text!
                let resultadoSomaMemoria = preparaEResolveExpressaoMatematica(expressaoSomaDeMemoria)
                
                if verificaSeResultadoFinalENumero(resultadoSomaMemoria) == true {
                    outletVisorDeMemoria.text = resultadoSomaMemoria
                }                                
            }
            
        case "m-":
            
            if verificaSeResultadoFinalENumero(outletLabelResultadoFinal.text!) == true && outletLabelResultadoFinal.text! != "0" && outletVisorDeMemoria.text!.isEmpty == false {
                
                let expressaoSubtracaoDeMemoria = outletVisorDeMemoria.text! + "-" + outletLabelResultadoFinal.text!
                let resultadoSubtracaoMemoria = preparaEResolveExpressaoMatematica(expressaoSubtracaoDeMemoria)
                
                if verificaSeResultadoFinalENumero(resultadoSubtracaoMemoria) == true {
                    outletVisorDeMemoria.text = resultadoSubtracaoMemoria
                }
            }
            
        case "ms":
            
            if verificaSeResultadoFinalENumero(outletLabelResultadoFinal.text!) == true && outletLabelResultadoFinal.text! != "0" {
                
                outletVisorDeMemoria.text = outletLabelResultadoFinal.text!
            }
            
        default:
            break
        }
    }
    
    
    /**
 
     Aplica as ultimas ações do App antes de seu encerramento.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func aplicaFuncoesAoFecharApp() {
        armazenaUltimoEstadoCalculadora(criaDicionarioComUltimoEstado())
    }
    
    
    /**
 
     Criar e atribuir os detectores de toques para o Resultado Antigo e Resultado Final.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func criaEAtribuiDetectoresDeToques() {
        
        // Memória:
        detectorDeToqueMemoria.addTarget(self, action: #selector(ViewController.acaoToqueViewVisorMemoria))
        outletViewMemoria.addGestureRecognizer(detectorDeToqueMemoria)
        
        // Resultado Antigo:
        toqueResultadoAntigo.addTarget(self, action: #selector(ViewController.acaoToqueResultadoAntigo))
        outletViewResultadoAntigo.addGestureRecognizer(toqueResultadoAntigo)
        
        // Resultado Final:
        toqueResultadoFinal.addTarget(self, action: #selector(ViewController.acaoToqueResultadoFinal))
        resultadoFinalStack.addGestureRecognizer(toqueResultadoFinal)
    }
    
    /**
     
        Aplica as ações necessárias quando o usuário toca no valor da memória.
     
        - Parâmetros: Nenhum.
        - Retorna: Nada.
     
    */
    func acaoToqueViewVisorMemoria() {
        
        reproduzSomDeTecla()
        
        if outletVisorDeMemoria.text!.isEmpty == false {
            
            if outletLabelExpressaoMatematica.text!.isEmpty == true || caractereEOperacao(outletLabelExpressaoMatematica.text!.characters.last) == true || outletLabelExpressaoMatematica.text!.characters.last == "(" {
                
                if verificaSeNumeroEoMuitoGrandeOuPequeno(outletVisorDeMemoria.text!) == false {
                    
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + outletVisorDeMemoria.text!
                    
                }
                
            }
            
            atualizaLinhaDoTempoDoCalculo()
            verificaEAlteraStatusBotaoC()
            mostraResultadoFinal()
        }
    }
    
    
    /**
 
     Toca o som do clique de uma tecla.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func reproduzSomDeTecla() {
        
        if verificaSeSomTeclaEstaAtivado() {
            if musicaEstaTocando() == false {
                AudioServicesPlaySystemSound(1306)
            }
        }
    }
    
    
    /**
 
     Recebe e direciona a entrada do usuário.
     
     - Parâmetros: sender. (UIButton)
     - Retorna: Nada.
     
    */
    @IBAction func recebeEntradasDoUsuario(sender: UIButton) {
        
        reproduzSomDeTecla()
        filtraExpressaoMatematicaInvalida(sender.titleLabel!.text!)
        mostraResultadoFinal()
    }
    
    
    /**
      
     Mostra o Resultado Final.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
     */
    func mostraResultadoFinal() {
        
        // Caso a expressão matemática esteja vazia, o Resultado Final é Zero:
        if outletLabelExpressaoMatematica.text!.isEmpty == true {
            
            outletLabelResultadoFinal.text = "0"
            
        // Caso contrário, a expressão matemática deve ser resolvida:
        } else {
            
            outletLabelResultadoFinal.text = preparaEResolveExpressaoMatematica(outletLabelExpressaoMatematica.text!)
            
        }
    }

    
    
    
    
    
        
    /* ____________-------------------------_____________*/
    /* ------------          SEGUES         ------------ */
    /* ____________-------------------------_____________*/
    
    
    /**
     
     Aciona o Segue do botão de Mais Opções com o MaisOpcoesViewController.
     
     - Parâmetros: sender.
     - Retorna: Nada.
     
     */
    @IBAction func acaoBotaoMaisOpcoes(sender: AnyObject) {
        self.performSegueWithIdentifier("segueMostraMaisOpcoes", sender: self)
    }
    
    
                
    @IBAction func acaoBotaoHistorico(sender: AnyObject) {
        self.performSegueWithIdentifier("segueMostraHistorico", sender: self)
    }
    
    
    
    /**
 
     Aciona o Segue do botão de Cores com o TemaDeCoresViewController.
     
     - Parâmetros: sender.
     - Retorna: Nada.
     
    */
    @IBAction func abreTemaDeCores(sender: AnyObject) {
        self.performSegueWithIdentifier("segueMostraTemaDeCores", sender: self)
    }
    
    
    /**
     
     Aciona o Segue do botão de Ajuda com o AjudaViewController.
     
     - Parâmetros: sender.
     - Retorna: Nada.
     
    */
    @IBAction func acaoBotaoAjuda(sender: AnyObject) {
        self.performSegueWithIdentifier("segueMostraAjuda", sender: self)
    }
    
    
    /**
 
     Aplica uma ação específica de uma Segue.
     
     - Parâmetros: Segue e sender.
     - Retorna: Nada.
     
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                        
        if segue.identifier == "segueMostraHistorico" {
            
            // Permite a troca de dados por Segue:
            (segue.destinationViewController as! HistoricoCalculosViewController).delegadoHistoricoCalculos = self
            
            // Cria um objeto segue que dá acesso ao HistoricoViewController:
            let historicoCalculosVC = segue.destinationViewController as! HistoricoCalculosViewController
            
            // Envia dados do histórico aqui:
            historicoCalculosVC.historicoDeCalculos = historicoELinhasDoTempo["Histórico"] as! [String]
            
            // Arruma a posição da seta para o centro do botão:
            historicoCalculosVC.popoverPresentationController?.sourceRect = outletBotaoHistorico.bounds
            
            // Permite apenas a seta para cima:
            historicoCalculosVC.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.Up
            
            // Faz com que PopOvers sejam apresentados em iPhones da mesma forma que são em iPads [1/2]:
            if historicoCalculosVC.popoverPresentationController != nil {
                historicoCalculosVC.popoverPresentationController?.delegate = self
            }
            
            
        } else if segue.identifier == "segueMostraTemaDeCores" {
            
            // Permite a troca de dados por Segue:
            (segue.destinationViewController as! TemaDeCoresViewController).delegadoDoTemaDeCores = self
            
            // Cria um objeto segue que dá acesso ao TemaDeCoresViewController:
            let temaDeCoresVC = segue.destinationViewController as! TemaDeCoresViewController
            
            // Envia dados aqui:
            temaDeCoresVC.temaDeCorSendoUsado = carregaERetornaTemaDaCalculadora()
            
            // Arruma a posição da seta para o centro do botão:
            temaDeCoresVC.popoverPresentationController?.sourceRect = outletBotaoCoresMenuOpcoes.bounds
            
            // Permite apenas a seta para cima:
            temaDeCoresVC.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.Up
            
            // Faz com que PopOvers sejam apresentados em iPhones da mesma forma que são em iPads [1/2]:
            if temaDeCoresVC.popoverPresentationController != nil {
                temaDeCoresVC.popoverPresentationController?.delegate = self
            }
        } else if segue.identifier == "segueMostraAjuda" {
            
            let ajudaVC = segue.destinationViewController as! AjudaViewController
            
            // Arruma a posição da seta para o centro do botão:
            ajudaVC.popoverPresentationController?.sourceRect = outletBotaoAjudaMenuOpcoes.bounds
            
            // Permite apenas a seta para cima:
            ajudaVC.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.Up
            
            // Faz com que PopOvers sejam apresentados em iPhones da mesma forma que são em iPads [1/2]:
            if ajudaVC.popoverPresentationController != nil {
                ajudaVC.popoverPresentationController?.delegate = self
            }
        } else if segue.identifier == "segueMostraMaisOpcoes" {
            
            // Permite a troca de dados por Segue:
            (segue.destinationViewController as! MaisOpcoesViewController).delegadoDoMenuMaisOpcoes = self
            
            // Cria um objeto segue de MaisOpcoesViewController:
            let maisOpcoesVC = segue.destinationViewController as! MaisOpcoesViewController
            
            // Envia dados aqui:
            maisOpcoesVC.configuracoesUsuario = configuracoesUsuario
            
            //maisOpcoesVC.configuracoesDoUsuario = configuracoesMaisOpcoes
        }
    }
    
    
    // Faz com que PopOvers sejam apresentados em iPhones da mesma forma que são em iPads [2/2]:
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .None
    }
    
    
    /**
     
     Verifica se o player de música está em uso.
     
     - Parâmetros: Nenhum.
     - Retorna: Verdadeiro ou Falso.
     
    */
    func musicaEstaTocando() -> Bool {
        
        let playerDeMusica = MPMusicPlayerController.systemMusicPlayer()
        if playerDeMusica.playbackState == MPMusicPlaybackState.Playing {
            return true
        }
        return false
    }
    
    
    /**
     
     Ativa o menu de opções.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    @IBAction func configuracoes() {
        
        // Função do Timer: Evita um erro `NSInternalInconsistencyException` em que ocorria quando o botão de configurações era pressionado rapidamente.
        let seconds = 0.01
        let delay = seconds * Double(NSEC_PER_SEC)
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), { // Inicio do Timer.
            
            self.botaoConfig.hidden = !self.botaoConfig.hidden
            self.outletViewBotaoVoltar.hidden = !self.outletViewBotaoVoltar.hidden
            self.outletViewBotaoMaisOpcoes.hidden = !self.outletViewBotaoMaisOpcoes.hidden
            self.outletViewBotaoAjuda.hidden = !self.outletViewBotaoAjuda.hidden
            self.outletViewBotaoCores.hidden = !self.outletViewBotaoCores.hidden
            self.botaoHistorico.hidden = !self.botaoHistorico.hidden
                        
            // Deixa os botões do menu de opções com sua cor específica do tema:
            self.aplicaCorDeFundoMenuDeConfiguracoes(self.corFundoMenuDeOpcoes)
        }) // Fim Timer.
    }
    
    
    /**
     
     Copia o resultado final para o PasteBoard do iOS.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func acaoToqueResultadoFinal() {
        
        reproduzSomDeTecla()
        
        let alertaCopiarResultadoFinal = UIAlertController(title: dicionarioCopiarResultadoFinal[idioma], message: outletLabelResultadoFinal.text!, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertaCopiarResultadoFinal.addAction(UIAlertAction(title: dicionarioSim[idioma], style: .Default, handler: { (action: UIAlertAction!) in
            UIPasteboard.generalPasteboard().string = self.outletLabelResultadoFinal.text
        }))
        
        alertaCopiarResultadoFinal.addAction(UIAlertAction(title: dicionarioCancelar[idioma], style: .Cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        presentViewController(alertaCopiarResultadoFinal, animated: true, completion: nil)
        
    }
    
    
    /**
     
     Em uma situação válida, copia o valor do último resultado para a tela de cálculo.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func acaoToqueResultadoAntigo() {
        
        reproduzSomDeTecla()
        
        if resultadoAntigo.text!.isEmpty == false {
            if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == false && outletLabelExpressaoMatematica.text!.characters.last != ")" && outletLabelExpressaoMatematica.text!.characters.last != "!" && outletLabelExpressaoMatematica.text!.characters.last != "," && verificaSeNumeroEoMuitoGrandeOuPequeno(resultadoAntigo.text!) == false {
                reproduzSomDeTecla() // Toca o som da tecla.
                outletLabelExpressaoMatematica.text! = outletLabelExpressaoMatematica.text! + resultadoAntigo.text!
                
                atualizaLinhaDoTempoDoCalculo()
                verificaEAlteraStatusBotaoC()
                
                mostraResultadoFinal()
            }
        }
    }
    
    
    /**
     
     Salva o histórico dos cálculos e resultados. Deleta os mais antigos quando o limite for atingido.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func atualizaHistoricoELinhaDoTempoHistoricoLocal() {
        
        var historicoDeExpressaoMatematica: [String] = historicoELinhasDoTempo["Histórico"] as! [String]
        var historicoLinhasDoTempo: [[String]] = historicoELinhasDoTempo["Linhas do Tempo"] as! [[String]]
        
        // Salvando os históricos:
        
        if outletLabelExpressaoMatematica.text!.isEmpty == false && operacaoTemNumero(outletLabelExpressaoMatematica.text!) == true {
            colocaPontoEZeroCalculoSeNecessario()
            
            // Deleta o primeiro elemento do vetor caso a quantidade máxima do histórico seja atingida:
            if historicoDeExpressaoMatematica.count == QUANTIDADE_MAX_HISTORICO {
                historicoDeExpressaoMatematica = [String](historicoDeExpressaoMatematica.dropFirst())
            }
            
            // Deleta a primeira linha do tempo da matriz:
            if historicoLinhasDoTempo.count == QUANTIDADE_MAX_HISTORICO {
                historicoLinhasDoTempo = [[String]](historicoLinhasDoTempo.dropFirst())
            }
            
            // Adiciona novos elementos de histórico e linha do tempo:
            historicoDeExpressaoMatematica.append(outletLabelExpressaoMatematica.text! + " = " + outletLabelResultadoFinal.text!)
            historicoLinhasDoTempo.append(linhaDoTempoDaExpressao)
            
            // Atribui os novos elementos ao dicionário local "historicoELinhasDoTempo":
            historicoELinhasDoTempo["Histórico"] = historicoDeExpressaoMatematica
            historicoELinhasDoTempo["Linhas do Tempo"] = historicoLinhasDoTempo
        }
    }
    
    
    /**
     
     Apaga a String da tela de cálculo, resultado final e resultado antigo (Caso em modo AC)
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    @IBAction func c() {
        
        reproduzSomDeTecla()
        
        atualizaHistoricoELinhaDoTempoHistoricoLocal()
        armazenaHistoricoELinhasDoTempo(historicoELinhasDoTempo)
        
        outletLabelExpressaoMatematica.text = ""
        
        linhaDoTempoDaExpressao.removeAll() // Zera a linha do tempo.
        linhaDoTempoDaExpressao.append("") // Inicializa a linha do tempo com ""
        
        if outletLabelResultadoFinal.text != "0" && outletLabelResultadoFinal.text! != "Copiado!" && outletLabelResultadoFinal.text! != "nan" && outletLabelResultadoFinal.text! != "∞" && outletLabelResultadoFinal.text! != "-∞" && outletLabelResultadoFinal.text! != "Erro" {
            resultadoAntigo.text = outletLabelResultadoFinal.text!
        } else {
            resultadoAntigo.text = ""
        }
        outletLabelResultadoFinal.text = "0"
        
        verificaEAlteraStatusBotaoC()
    }
    
    
    /**
     
     Retorna o estado do cálculo para o seu estado anterior.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    @IBAction func del() {
        
        reproduzSomDeTecla()
        
        if linhaDoTempoDaExpressao.count != 1 {
            linhaDoTempoDaExpressao = [String](linhaDoTempoDaExpressao.dropLast())
        } else {
            linhaDoTempoDaExpressao[0] = ""
        }
        
        if outletLabelExpressaoMatematica.text!.isEmpty == false {
            
            if linhaDoTempoDaExpressao.last != nil {
                
                outletLabelExpressaoMatematica.text! = linhaDoTempoDaExpressao.last! // Calculo é atualizado aqui!
                
                mostraResultadoFinal()
                
            } else {
                outletLabelExpressaoMatematica.text! = String(outletLabelExpressaoMatematica.text!.characters.dropLast())
            }
        }
        verificaEAlteraStatusBotaoC()
    }
    
    
    /**
     
     Atualiza a linha do tempo do cálculo.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func atualizaLinhaDoTempoDoCalculo() {
        if linhaDoTempoDaExpressao.last! != outletLabelExpressaoMatematica.text! {
            linhaDoTempoDaExpressao.append(outletLabelExpressaoMatematica.text!)
        }
    }
    
    
    /**
     
     Altera o Status do botão deg/rad entre graus ou radianos.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    @IBAction func acaoBotaoDegOuRad() {
        
        reproduzSomDeTecla()
        
        configuracoesUsuario["Modo Radiano Ativado"] = !(configuracoesUsuario["Modo Radiano Ativado"] as! Bool)
        armazenaConfiguracoesUsuario(configuracoesUsuario)
        
        verificaEAlteraStatusBotaoDegOuRad()
        mostraResultadoFinal()
    }
    
} // Fim class ViewController
















