//
//  Global.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import UIKit


// --------------------
// Constantes Globais:
// --------------------

let π: String = "3,141592653589793"
let e: String = "2,718281828459045"
let φ: String = "1,618033988749894"


// -------------------
// Variáveis Globais:
// -------------------

var idioma = ""


// --------------------
// Dicionarios Globais:
// --------------------

let dicionarioOpcoesPadraoDoUsuario: [String:AnyObject] = [
    "Som das Teclas Ativado" : true,
    
    "Retrato Simples Ativado" : false,
    "Esconder Última Resposta Ativado" : false,
    "Mostrar Memória Ativado" : true,
    "Esconder Botão Gra/Rad Ativado" : false,
    
    "Modo Radiano Ativado" : false,
    "Botão % Clássico Ativado" : false,
    
    "Idioma" : detectaIdiomaDoSistema(),
    
    "Casas Decimais" : 15
]


let dicionarioHistoricoELinhasDoTempoInicial: [String:AnyObject] = [
    "Histórico" : [String](),
    "Linhas do Tempo" : [[String]]()
]


let dicionarioEstadoInicialDaCalculadora: [String:AnyObject] = [
    "Expressão Matemática" : "",
    "Linha do Tempo da Expressão Matemática" : [""],
    "Último Resultado" : "",
    "Memória" : ""    
]

let dicionarioDeErrosMetodosEFuncoes: [String:String] = [
    "detectaTipoDeTela" : "Erro: Resolução recebida como parâmetro não pôde ser definida pela função <detectaTipoDeTela>."
]



// -----------------
// Funções Globais:
// -----------------

/**
 
    Detecta o idioma do sistema operacional.
 
    - Parâmetros: Nenhum.
    - Retorna: Idioma. (String)
 
*/
func detectaIdiomaDoSistema() -> String {
    
    if let melhorIdioma = NSBundle.preferredLocalizationsFromArray(idiomasERegioesDisponiveis).first {
        
        return dicionarioCodigoIdiomaParaNomeIdioma[melhorIdioma]!
        
    } else {
        
        return "Inglês"
        
    }
}


/**
 
 Coloca uma borda em um view qualquer.
 
 - Parâmetros: View, cor e largura da borda. (UIView, UIColor, CGFloat)
 
*/
func colocaBordaEmUmView(view: UIView, cor: UIColor, larguraLinha: CGFloat) {
    view.layer.borderWidth = larguraLinha
    view.layer.borderColor = cor.CGColor
}


/**
 
 Retorna um vetor com as configurações padrões do Menu de Mais Opções.
 
 - Parâmetros: Nenhum.
 - Retorna: Configurações padrão do Menu de Mais Opções. ([Bool])
 
*/
func retornaConfiguracoesMenuMaisOpcoesPadrao() -> [Bool] {
    return [true, false, false, false, false, false, true]
}


/**
 
 Detecta o tipo e orientação de tela.
 
 - Parâmetros: Tamanho da tela. (CGRect)
 - Retorna: Tipo e orientação de tela. (String)
 
 */
func detectaTipoDeTela(tamanhoDaTela: CGRect) -> String {
    
    let largura = tamanhoDaTela.width
    let altura = tamanhoDaTela.height
    var tipoDaTela: String
    
    // -----
    // iPad:
    // -----
    
    if altura == 1024 && largura == 768 { // Retrato
        
        tipoDaTela = "ipadPortrait"
        
    } else if (altura == 1024 && largura == 320) || (altura == 1024 && largura == 438) { // Retrato (Multi-Tarefas)
        
        tipoDaTela = "ipadPortraitSlideOver"
        
    } else if (altura == 768 && largura == 1024) || (altura == 768 && largura == 694) { // Horizontal
        
        tipoDaTela = "ipadLandscape"
        
    } else if (altura == 768 && largura == 320) || (altura == 768 && largura == 507) { // Horizontal (Multi-Tarefas)
        
        tipoDaTela = "ipadLandscapeSlideOver"
        
    // ---------
    // iPad Pro:
    // ---------
        
        
    } else if (altura == 1366 && largura == 1024) { // Portrait
        tipoDaTela = "ipadProPortrait"
    } else if (altura == 1366 && largura == 375) || (altura == 1366 && largura == 639) { // Portrait Slide Over
        tipoDaTela = "ipadProPortraitSlideOver"
    } else if (altura == 1024 && largura == 1366) || (altura == 1024 && largura == 981) || (altura == 1024 && largura == 678) { // Landscape
        tipoDaTela = "ipadProLandscape"
    } else if (altura == 1024 && largura == 375) { // Landscape Slide Over
        tipoDaTela = "ipadProLandscapeSlideOver"
        
    // --------------
    // iPhone 6 Plus
    // --------------
    } else if altura == 736 && largura == 414 { // Portrait
        tipoDaTela = "iphone6PlusPortrait"
    } else if altura == 414 && largura == 736 { // Landscape
        tipoDaTela = "iphone6PlusLandscape"
        
    // ---------
    // iPhone 6
    // ---------
    } else if altura == 667 && largura == 375 { // Portrait
        tipoDaTela = "iphone6Portrait"
    } else if altura == 375 && largura == 667 { // Landscape
        tipoDaTela = "iphone6Landscape"
        
    // ---------
    // iPhone 5
    // ---------
    } else if altura == 568 && largura == 320 { // Portrait
        tipoDaTela = "iphone5Portrait"
    } else if altura == 320 && largura == 568 { // Landscape
        tipoDaTela = "iphone5Landscape"
        
    // ----------
    // iPhone 4S
    // ----------
    } else if altura == 480 && largura == 320 { // Portrait
        tipoDaTela = "iphone4sPortrait"
    } else if altura == 320 && largura == 480 { // Landscape
        tipoDaTela = "iphone4sLandscape"
    } else {
        
        print(dicionarioDeErrosMetodosEFuncoes["detectaTipoDeTela"])
        exit(0)
        
    }
    return tipoDaTela
}


// -------------------
// Extensões GLOBAIS:
// -------------------


// Ligação com HistoricoCalculosViewController
extension ViewController: DelegadoHistoricoCalculos {
    
    /**
     
     
     
     */
    func comunicadorDeHistoricoDeCalculos(historico: String?, numeroDoBotao: Int?) {
        
        if historico == nil && numeroDoBotao == nil {
            
            historicoELinhasDoTempo = dicionarioHistoricoELinhasDoTempoInicial
            armazenaHistoricoELinhasDoTempo(historicoELinhasDoTempo)
            
        } else {
            
            let linhasDoTempo = historicoELinhasDoTempo["Linhas do Tempo"] as! [[String]]
            let historicoDeExpressoes = historicoELinhasDoTempo["Histórico"] as! [String]
            linhaDoTempoDaExpressao = linhasDoTempo[historicoDeExpressoes.count - numeroDoBotao!]
            outletLabelExpressaoMatematica.text = historico
            mostraResultadoFinal()
            verificaEAlteraStatusBotaoC()
        }                        
    }
}




// Ligação com TemaDeCoresViewController
extension ViewController: DelegadoTemaDeCores {
    
    /**
     
     Comunica o tema de cores entre ViewController e TemaDeCoresViewController.
     
     - Parâmetros: Tema de cor. (String)
     - Retorna: Nada.
     
     */
    func comunicaTemaDeCores(nomeDoTemaDeCor: String) {
        alteraTemaDaCalculadora(nomeDoTemaDeCor)
    }
}

// Ligação com MaisOpcoesViewController
extension ViewController: DelegadoMaisOpcoes {
    
    /**
     
     Comunica a configuração do usuário e a variável booleana que diz se os views devem ser atualizados.
     
     - Parâmetros: Configurações do usuário. [String:AnyObject]
     - Retorna: Nada.
     
     */
    func comunicadorMaisOpcoes(configuracoesDoUsuario: [String:AnyObject], atualizaTelaCalculadora: Bool) {
        
        // Salva as configurações do menu de Mais Opções:
        armazenaConfiguracoesUsuario(configuracoesDoUsuario)
        
        // Atualiza a variável local com as ultimas configurações:
        configuracoesUsuario = configuracoesDoUsuario
        
        // Altera o Status do Botão C/AC se necessário:
        verificaEAlteraStatusBotaoC()
        
        // Caso requirido, a interface da calculadora será recarregada aqui:
        if atualizaTelaCalculadora == true {
            escondeFileirasDeAcordoComTipoDeTela()
            aplicaIdiomaViewController(idioma)
        }
        
        // Calcula o resultado final:
        mostraResultadoFinal()
        
        // Se necessário, altera o status do botão deg/rad:
        verificaEAlteraStatusBotaoDegOuRad()
    }
}




// ----------------------
// EXTENSÃO DE NSNUMBER:
// ----------------------
public extension NSNumber {
    
    /**
     
     Calcula o Log em uma base x.
     
     - Parâmetros: Base x. (NSNumber)
     - Retorna: Log de um valor em uma base x. (NSNumber)
     
    */
    func calculaXLog(baseX: NSNumber) -> NSNumber {
        let base = Double(baseX)
        return log(self.doubleValue) / log(base)
    }
    
    
    /**
     
     Calcula a raiz enésima de um radicando.
     
     - Parâmetros: Índice. (NSNumber)
     - Retorna: Raíz enésima do radicando. (NSNumber)
     
    */
    func calculaRaizEnesima(indiceNSNumber: NSNumber) -> NSNumber {
        
        let indice = Double(indiceNSNumber)
        let radicando = Double(self.doubleValue)
        
        if indice % 2 == 0 {
            
            return pow(radicando, 1.0/indice)
            
        } else {
            
            if radicando.isSignMinus == true {
                
                return (pow(radicando * -1, 1.0/indice)) * -1.0
                
            } else {
                
                return pow(radicando, 1.0/indice)
            }
        }
    }
    
    
    /**
     
     Calcula o Fatorial de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Fatorial do valor. (NSNumber)
     
    */
    func calculaFatorial() -> NSNumber {
        var resultado: NSNumber
        if (fmod(self.doubleValue, floor(self.doubleValue)) == 0) {
            resultado = round(exp(lgamma(self.doubleValue+1.0)))
        } else {
            resultado = exp(lgamma(self.doubleValue + 1))
        }
        return resultado
    }
    
    
    /**
     
     Calcula o Log de 10 de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Log de 10 de um valor. (NSNumber)
     
    */
    func calculaLog10() -> NSNumber {
        return log10(self.doubleValue)
    }
    
    
    // GRAUS:
    
    /**
     
     Calcula o cosseno em graus de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Cosseno em graus. (NSNumber)
     
    */
    func calculaCossenoGrau() -> NSNumber {
        return __cospi(self.doubleValue/180.0)
    }
    
    
    /**
     
     Calcula o seno em graus de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Seno em graus. (NSNumber).
     
    */
    func calculaSenoGrau() -> NSNumber {
        return __sinpi(self.doubleValue/180.0)
    }
    
    
    /**
     
     Calcula a tangente em graus de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Tangente em graus. (NSNumber)
     
    */
    func calculaTangenteGrau() -> NSNumber {
        return __tanpi(self.doubleValue/180.0)
    }
    
    
    /**
     
     Calcula o cosseno inverso em graus de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: cosseno inverso em graus. (NSNumber)
     
    */
    func calculaACossenoGrau() -> NSNumber {
        return acos(self.doubleValue) * 180.0 / M_PI
    }
    
    
    /**
     
     Calcula o seno inverso em graus de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Seno inverso em graus. (NSNumber)
     
    */
    func calculaASenoGrau() -> NSNumber {
        return asin(self.doubleValue) * 180.0 / M_PI
        
    }
    
    
    /**
     
     Calcula a tangente inversa em graus de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Tangente inversa em graus. (NSNumber)
     
    */
    func calculaATangenteGrau() -> NSNumber {
        return atan(self.doubleValue) * 180.0 / M_PI
    }
    
    
    // RADIANOS:
    
    /**
     
     Calcula o cosseno em radianos de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Cosseno em radianos. (NSNumber)
     
    */
    func calculaCossenoRadiano() -> NSNumber {
        return cos(self.doubleValue)
    }
    
    
    /**
     
     Calcula o seno em radianos de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Seno em radianos. (NSNumber)
     
    */
    func calculaSenoRadiano() -> NSNumber {
        return sin(self.doubleValue)
    }
    
    
    /**
     
     Calcula a tangente em radianos de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Tangente em radianos. (NSNumber)
     
    */
    func calculaTangenteRadiano() -> NSNumber {
        return tan(self.doubleValue)
    }
    
    
    /**
     
     Calcula o cosseno inverso em radianos de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Cosseno inverso em radianos. (NSNumber)
     
    */
    func calculaACossenoRadiano() -> NSNumber {
        return acos(self.doubleValue)
    }
    
    
    /**
     
     Calcula o seno inverso em radianos de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Seno inverso em radianos. (NSNumber)
     
    */
    func calculaASenoRadiano() -> NSNumber {
        return asin(self.doubleValue)
    }
    
    
    /**
     
     Calcula a tangente inversa em radianos de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Tangente inversa em radianos. (NSNumber)
     
    */
    func calculaATangenteRadiano() -> NSNumber {
        return atan(self.doubleValue)
    }
    
    
    // HIPERBÓLICOS:
    
    /**
     
     Calcula o cosseno hiperbólico de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Cosseno hiperbólico. (NSNumber)
     
    */
    func calculaCossenoH() -> NSNumber {
        return cosh(self.doubleValue)
    }
    
    
    /**
     
     Calcula o seno hiperbólico de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Seno hiperboólico. (NSNumber)
     
    */
    func calculaSenoH() -> NSNumber {
        return sinh(self.doubleValue)
    }
    
    
    /**
     
     Calcula a tangente hiperbólica de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Tangente hiperbólica. (NSNumber)
     
    */
    func calculaTangenteH() -> NSNumber {
        return tanh(self.doubleValue)
    }
    
    
    /**
     
     Calcula o cosseno inverso hiperbólico de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Cosseno inverso hiperbólico. (NSNumber)
     
    */
    func calculaACossenoH() -> NSNumber {
        return acosh(self.doubleValue)
    }
    
    
    /**
     
     Calcula o seno inverso hiperbólico de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Seno inverso hiperbólico. (NSNumber)
     
    */
    func calculaASenoH() -> NSNumber {
        return asinh(self.doubleValue)
    }
    
    
    /**
     
     Calcula a tangente inversa hiperbólica de um valor.
     
     - Parâmetros: Nenhum.
     - Retorna: Tangente inversa hiperbólica. (NSNumber)
     
    */
    func calculaATangenteH() -> NSNumber {
        return atanh(self.doubleValue)
    }
    
} // Fim public extension NSNumber.


