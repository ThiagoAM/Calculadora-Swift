//
//  MaisOpcoesViewController.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import UIKit

// Ligação com os outros ViewControllers.
protocol DelegadoMaisOpcoes {
    func comunicadorMaisOpcoes(configuracoesDoUsuario: [String:AnyObject], atualizaTelaCalculadora: Bool)
}


class MaisOpcoesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Variáveis:
    var delegadoDoMenuMaisOpcoes: DelegadoMaisOpcoes?
    var configuracoesUsuario = [String:AnyObject]()
    
    // Outlets:
    
        /// Scroll Views:
        @IBOutlet var outletScrollViewMaisOpcoes: UIScrollView!
    
    
    @IBOutlet var outletViewPrincipalMaisOpcoes: UIView!
    @IBOutlet var outletBotaoFechar: UIButton!
    @IBOutlet var outletBotaoRedefinirAjustes: UIButton!
    @IBOutlet var outletBotaoAvaliarNaAppStore: UIButton!
    @IBOutlet var outletBotaoVerCodigoFonte: UIButton!
    
    @IBOutlet var outletLabelTituloCasasDecimais: UILabel!
    @IBOutlet var outletLabelNumeroCasasDecimais: UILabel!
    @IBOutlet var outletLabelTituloMenu: UILabel!
    @IBOutlet var outletLabelSomDasTeclas: UILabel!
    @IBOutlet var outletLabelRetratoSimples: UILabel!
    @IBOutlet var outletLabelEsconderUltimaResposta: UILabel!
    @IBOutlet var outletLabelEsconderBotaoGraRad: UILabel!
    @IBOutlet var outletLabelModoRadiano: UILabel!
    @IBOutlet var outletLabelPorCentoClassico: UILabel!
    @IBOutlet var outletLabelMostrarMemoria: UILabel!
    @IBOutlet var outletLabelIdioma: UILabel!
    
    // Constraints:
    @IBOutlet var outletConstraintLarguraMaisOpcoes: NSLayoutConstraint!
    
    // Steppers:
    @IBOutlet var outletStepperQuantidadeCasasDecimais: UIStepper!
    
    // Picker Views:
    @IBOutlet var outletPickerViewIdiomas: UIPickerView!
    
    //  Switches:
    @IBOutlet var outletSwitchSomDasTeclas: UISwitch!
    @IBOutlet var outletSwitchModoSimples: UISwitch!
    @IBOutlet var outletSwitchUltimaRespostaVisivel: UISwitch!
    @IBOutlet var outletSwitchEsconderBotaoDegRad: UISwitch!
    @IBOutlet var outletSwitchModoRadiano: UISwitch!
    @IBOutlet var outletSwitchBotaoPorCentoClassico: UISwitch!
    @IBOutlet var outletSwitchMostrarMemoria: UISwitch!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Atualiza a quantidade de casas decimais sendo utilizadas pelo usuário:
        atualizaQuantidadeDeCasasDecimais()
        
        // Posiciona o idioma atual corretamente:
        posicionaPickerViewEmIdiomaSendoUsado()
        
        // Altera o idioma:
        aplicaIdiomaMaisOpcoes(idioma)
        
        // Ajusta a posição do indicador de rolamento:
        outletScrollViewMaisOpcoes.scrollIndicatorInsets = UIEdgeInsets(top: 66, left: 0, bottom: 0, right: 0)
        
        // Altera a largura da tela de mais opções em alguma situações.
        mudaLarguraTelaMaisOpcoes()
        
        // Altera o status dos Switches:
        alteraStatusDosSwitchesMaisOpcoes()
        
        // Cria uma notificação de orientação de tela para mudar a largura do menu de mais opções.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MaisOpcoesViewController.mudaLarguraTelaMaisOpcoes), name: UIDeviceOrientationDidChangeNotification, object: nil)
        
    }
    
    
    /**
     
     Verifica e atualiza a quantidade de casas decimais sendo utilizadas pelo usuário:
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func atualizaQuantidadeDeCasasDecimais() {
        outletStepperQuantidadeCasasDecimais.value = configuracoesUsuario["Casas Decimais"] as! Double
        outletLabelNumeroCasasDecimais.text = String(Int(outletStepperQuantidadeCasasDecimais.value))
    }
    
    
    // Stepper View:
    /**
     
     Realiza as ações necessárias quando um dos botões do stepper é tocado.
     
     - Parâmetros: sender. (UISTepper)
     - Retorna: Nada.
     
    */
    @IBAction func acaoStepperQuantidadeCasasDecimais(sender: UIStepper) {
        outletLabelNumeroCasasDecimais.text = String(Int(sender.value))
        configuracoesUsuario["Casas Decimais"] = Int(sender.value)
        self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: true)
    }
    
    
    // -------------
    // Picker View:
    // -------------
    
    // Define a quantidade de componentes (colunas) no picker view de idiomas:
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    //  Define a quantidade de elementos (qtd de idiomas) do picker view de idiomas:
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return idiomasComBandeiras.count
    }
    
    
    // Aplica o vetor idiomasComBandeiras ao picker view de idiomas:
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return idiomasComBandeiras[row]
    }
    
    
    // Formata o picker view de idiomas:
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let titleData = idiomasComBandeiras[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        return myTitle
    }
    
    
    // Aplica as ações necessárias ao mudar o elemento do picker view de idiomas:
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let idiomaSemBandeira = encontraIdiomaDeAcordoComBandeira(idiomasComBandeiras[row])
        
        configuracoesUsuario["Idioma"] = idiomaSemBandeira
        idioma = (configuracoesUsuario["Idioma"] as? String)!
        aplicaIdiomaMaisOpcoes(idioma)
        self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: true)
    }
    
    /**
     
     Encontra o idioma em português através de seu nome em linguagem nativa com bandeira.
     
     - Parâmetros: Idioma com bandeira. (String)
     - Retorna: Idioma sem bandeira em português. (String)
     
    */
    func encontraIdiomaDeAcordoComBandeira(idiomaComBandeira: String) -> String {
        
        return dicionarioNomeIdiomasNativoParaPortugues[String(String(idiomaComBandeira.characters.dropFirst()).characters.dropFirst())]!
    }
    
    /**
     
     Posiciona o picker view no idioma mais atual:
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func posicionaPickerViewEmIdiomaSendoUsado() {
        
        var fileira: Int
        
        switch idioma {
        case "Português":
            fileira = 0
        case "Inglês":
            fileira = 1
        case "Espanhol":
            fileira = 2
        case "Mandarim":
            fileira = 3
        case "Japonês":
            fileira = 4
        default:
            fileira = 1
        }
        
        outletPickerViewIdiomas.selectRow(fileira, inComponent: 0, animated: true)
    }
    
    
    /**
     
     Realiza as ações necessárias quando o usuário muda o estado de um switch.
     
     - Parâmetros: sender. (UISwitch)
     - Retorna: Nada.
     
    */
    @IBAction func acaoToqueSwitches(sender: UISwitch) {
        switch (sender.restorationIdentifier!) {
            
            case "switchSomDasTeclas":
                
                configuracoesUsuario["Som das Teclas Ativado"] = sender.on
                //configuracoesDoUsuario[0] = !configuracoesDoUsuario[0]
                
                self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: false)
            
            case "switchModoSimples":
                
                configuracoesUsuario["Retrato Simples Ativado"] = sender.on
                //configuracoesDoUsuario[1] = !configuracoesDoUsuario[1]
                self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: true)
            
            case "switchUltimaResposta":
                
                configuracoesUsuario["Esconder Última Resposta Ativado"] = sender.on
                //configuracoesDoUsuario[2] = !configuracoesDoUsuario[2]
                self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: true)
            
            case "switchEsconderBotaoDegRad":
                
                configuracoesUsuario["Esconder Botão Gra/Rad Ativado"] = sender.on
                //configuracoesDoUsuario[3] = !configuracoesDoUsuario[3]
                self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: true)
            
            case "switchModoRadiano":
                
                configuracoesUsuario["Modo Radiano Ativado"] = sender.on
                //configuracoesDoUsuario[4] = !configuracoesDoUsuario[4]
                self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: false)
            
            case "switchPorCentoClassico":
                
                configuracoesUsuario["Botão % Clássico Ativado"] = sender.on
                //configuracoesDoUsuario[5] = !configuracoesDoUsuario[5]
                self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: false)
            
            case "switchMostrarMemoria":
                
                configuracoesUsuario["Mostrar Memória Ativado"] = sender.on
                //configuracoesDoUsuario[6] = !configuracoesDoUsuario[6]
                self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: true)
            
        default:
            print("Erro (RestorationIdentifier de Switches não encontrado!) - AcaoToqueSwitches() > MaisOpcoesViewController")
        }
    }
    
    
    /**
     
     Redefine todos os ajudstes do menu de mais opções.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    @IBAction func acaoBotaoRedefinirTodosOsAjustes() {
        
        configuracoesUsuario = dicionarioOpcoesPadraoDoUsuario
        alteraStatusDosSwitchesMaisOpcoes()
        atualizaQuantidadeDeCasasDecimais()
        
        idioma = configuracoesUsuario["Idioma"] as! String
        aplicaIdiomaMaisOpcoes(idioma)
        posicionaPickerViewEmIdiomaSendoUsado()
        
        self.delegadoDoMenuMaisOpcoes?.comunicadorMaisOpcoes(configuracoesUsuario, atualizaTelaCalculadora: true)
    }
    
    
    /**
     
     Abre o link do código fonte do projeto `Calculadora Swift` no GitHub.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    @IBAction func acaoBotaoVerCodigoFonte() {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/ThiagoAM/calculadora-swift-1-0")!)
        
    }
    
    
    
    /**
     
     Atualiza o estado dos switches do menu de mais opções.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func alteraStatusDosSwitchesMaisOpcoes() {
        
        let somDasTeclasEstaLigado = (configuracoesUsuario["Som das Teclas Ativado"] as? Bool)!
        let retratoSimplesEstaAtivado = (configuracoesUsuario["Retrato Simples Ativado"] as? Bool)!
        let ultimaRespostaEstaEscondida = (configuracoesUsuario["Esconder Última Resposta Ativado"] as? Bool)!
        let botaoGraRadEstaEscondido = (configuracoesUsuario["Esconder Botão Gra/Rad Ativado"] as? Bool)!
        let modoRadianoEstaLigado = (configuracoesUsuario["Modo Radiano Ativado"] as? Bool)!
        let porCentoClassicoEstaAtivado = (configuracoesUsuario["Botão % Clássico Ativado"] as? Bool)!
        let mostrarMemoriaEstaAtivado = (configuracoesUsuario["Mostrar Memória Ativado"] as? Bool)!
        
        outletSwitchSomDasTeclas.setOn(somDasTeclasEstaLigado, animated: true)
        outletSwitchModoSimples.setOn(retratoSimplesEstaAtivado, animated: true)
        outletSwitchUltimaRespostaVisivel.setOn(ultimaRespostaEstaEscondida, animated: true)
        outletSwitchEsconderBotaoDegRad.setOn(botaoGraRadEstaEscondido, animated: true)
        outletSwitchModoRadiano.setOn(modoRadianoEstaLigado, animated: true)
        outletSwitchBotaoPorCentoClassico.setOn(porCentoClassicoEstaAtivado, animated: true)
        outletSwitchMostrarMemoria.setOn(mostrarMemoriaEstaAtivado, animated: true)
    }
    
    
    // Deixa a barra de status branca:
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    // Fecha a tela de mais opções com animação:
    @IBAction func acaoBotaoVoltar() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /**
     
     Define a largura da tela de mais opções.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func mudaLarguraTelaMaisOpcoes() {
        
        if outletViewPrincipalMaisOpcoes.frame.width <= 414 {
            
            outletConstraintLarguraMaisOpcoes.constant = outletViewPrincipalMaisOpcoes.frame.width
            
        } else {
            
            outletConstraintLarguraMaisOpcoes.constant = 320
        }
    }
}
