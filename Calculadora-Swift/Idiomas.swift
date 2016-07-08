//
//  Idiomas.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import UIKit


// ---------------------
// Dicionários Globais:
// ---------------------

let idiomasComBandeiras = ["🇧🇷 Português", "🇺🇸 English", "🇪🇸 Español", "🇨🇳 普通话"]

let idiomasERegioesDisponiveis = ["pt-BR", "en-US", "es", "zh"]

let dicionarioCodigoIdiomaParaNomeIdioma: [String:String] = [
    idiomasERegioesDisponiveis[0] : "Português",
    idiomasERegioesDisponiveis[1] : "Inglês",
    idiomasERegioesDisponiveis[2] : "Espanhol",
    idiomasERegioesDisponiveis[3] : "Mandarim"
]

let dicionarioNomeIdiomasNativoParaPortugues: [String:String] = [
    
    "Português" : "Português",
    "English" : "Inglês",
    "Español" : "Espanhol",
    "普通话" : "Mandarim"
]


let dicionarioMensagemDeErro: [String:String] = [
    "Português" : "Erro",
    "Inglês" : "Error",
    "Espanhol" : "Error",
    "Mandarim" : "错误"
]


let dicionarioBotaoFechar: [String:String] = [
    "Português" : "Fechar",
    "Inglês" : "Close",
    "Espanhol" : "Cerca",
    "Mandarim" : "关"
]

let dicionarioSim: [String:String] = [
    "Português" : "Sim",
    "Inglês" : "Yes",
    "Espanhol" : "Sí",
    "Mandarim" : "是"
]

let dicionarioCancelar: [String:String] = [
    "Português" : "Cancelar",
    "Inglês" : "Cancel",
    "Espanhol" : "Cancelar",
    "Mandarim" : "取消"
]


// -----------------
// View Controller:
// -----------------

let dicionarioCopiarResultadoFinal: [String:String] = [
    "Português" : "Deseja copiar o resultado abaixo?",
    "Inglês" : "Do you want to copy this result?",
    "Espanhol" : "¿Quieres copiar el resultado?",
    "Mandarim" : "你要复制的结果呢？"
]


let dicionarioBotaoVoltar: [String:String] = [
    "Português" : "❮ Voltar",
    "Inglês" : "❮ Back",
    "Espanhol" : "❮ Atrás",
    "Mandarim" : "❮ 回报"
]

let dicionarioBotaoCores: [String:String] = [
    "Português" : "❍ Cores",
    "Inglês" : "❍ Colors",
    "Espanhol" : "❍ Colores",
    "Mandarim" : "❍ 颜色"
]

let dicionarioBotaoAjuda: [String:String] = [
    "Português" : "? Ajuda",
    "Inglês" : "? Help",
    "Espanhol" : "? Ayuda",
    "Mandarim" : "? 帮帮我"
]

let dicionarioBotaoMaisOpcoes: [String:String] = [
    "Português" : "＋ Opções",
    "Inglês" : "＋ Options",
    "Espanhol" : "＋ Opciones",
    "Mandarim" : "＋ 选项"
]

let dicionarioBotaoGrau: [String:String] = [
    "Português" : "gra",
    "Inglês" : "deg",
    "Espanhol" : "gra",
    "Mandarim" : "度"
]

let dicionarioBotaoRadiano: [String:String] = [
    "Português" : "rad",
    "Inglês" : "rad",
    "Espanhol" : "rad",
    "Mandarim" : "弧度"
]


extension ViewController {
    
    /**
     
     Aplica o idioma para os elementos de interface da classe "View Controller".
     
     - Parâmetros: Idioma sendo usado. (String)
     - Retorna: Nada.
     
     */
    func aplicaIdiomaViewController(idiomaSendoUsado: String) {
        
        // Menu de Configurações:
        
        outletBotaoVoltarMenuOpcoes.setTitle(dicionarioBotaoVoltar[idiomaSendoUsado], forState: UIControlState.Normal)
        
        outletBotaoCoresMenuOpcoes.setTitle(dicionarioBotaoCores[idiomaSendoUsado], forState: UIControlState.Normal)
        
        outletBotaoAjudaMenuOpcoes.setTitle(dicionarioBotaoAjuda[idiomaSendoUsado], forState: UIControlState.Normal)
        
        outletBotaoMaisOpcoesMenuOpcoes.setTitle(dicionarioBotaoMaisOpcoes[idiomaSendoUsado], forState: UIControlState.Normal)
                        
        verificaEAlteraStatusBotaoDegOuRad()
    }
}


// -----------
// Histórico:
// -----------

let dicionarioDesejaLimparHistorico: [String:String] = [
    
    "Português" : "Tem certeza que deseja limpar o histórico?",
    "Inglês" : "Are you sure you want to erase the history?",
    "Espanhol" : "¿Está seguro de que quiere borrar la historia?",
    "Mandarim" : "你确定你要删除的历史？"
    
]

let dicionarioTituloHistorico: [String: String] = [
    "Português" : "Histórico",
    "Inglês" : "History",
    "Espanhol" : "Historia",
    "Mandarim" : "历史性"
]

let dicionarioBotaoLimpar: [String: String] = [
    "Português" : "Limpar",
    "Inglês" : "Erase",
    "Espanhol" : "Borrar",
    "Mandarim" : "抹去"
]

let dicionarioLabelHistoricoVazio: [String: String] = [
    "Português" : "Vazio",
    "Inglês" : "Empty",
    "Espanhol" : "Vacío",
    "Mandarim" : "空"
]

extension HistoricoCalculosViewController {
    
    /**
     
     Aplica o idioma para os elementos de interface da classe "HistoricoViewController".
     
     - Parâmetros: Idioma sendo usado. (String)
     - Retorna: Nada.
     
     */
    func aplicaIdiomaHistorico(idiomaSendoUsado: String) {
        outletLabelTituloHistorico.text = dicionarioTituloHistorico[idiomaSendoUsado]
        outletBotaoLimpar.setTitle(dicionarioBotaoLimpar[idiomaSendoUsado], forState: UIControlState.Normal)
        outletLabelHistoricoVazio.text = dicionarioLabelHistoricoVazio[idiomaSendoUsado]
    }
    
}


// -------
// Cores:
// -------
let dicionarioTituloMenuCores: [String: String] = [
    "Português" : "Escolha a sua cor",
    "Inglês" : "Select your color",
    "Espanhol" : "Elegir su color",
    "Mandarim" : "选择颜色"
]

extension TemaDeCoresViewController {
    
    /**
     
     Aplica o idioma para os elementos de interface da classe "TemaDeCoresViewController".
     
     - Parâmetros: Idioma sendo usado. (String)
     - Retorna: Nada.
     
     */
    func aplicaIdiomaTemaDeCores(idiomaSendoUsado: String) {
        outletLabelTituloMenuCores.text = dicionarioTituloMenuCores[idiomaSendoUsado]
    }
}

// -------
// Ajuda:
// -------
let dicionarioTituloAjuda: [String: String] = [
    "Português" : "Ajuda",
    "Inglês" : "Help",
    "Espanhol" : "Ayuda",
    "Mandarim" : "帮帮我"
]

let dicionarioDescricaoInfinito: [String:String] = [
    "Português" : "∞ = Parâmetros Inválidos, Erro ou Overflow",
    "Inglês" : "∞ = Invalid parameters, Error or Overflow",
    "Espanhol" : "∞ = Parámetros inválidos, Erro o Overflow",
    "Mandarim" : "∞ = 参数无效, 错误或溢出"
]

let dicionarioDescricaoNan: [String: String] = [
    "Português" : "nan = Não Definido",
    "Inglês" : "nan = Not Defined",
    "Espanhol" : "nan = No Definida",
    "Mandarim" : "nan = 没有定义的"
]

extension AjudaViewController {
    
    /**
     
     Aplica o idioma para os elementos de interface da classe "AjudaViewController".
     
     - Parâmetros: Idioma sendo usado. (String)
     - Retorna: Nada.
     
     */
    func aplicaIdiomaAjuda(idiomaSendoUsado: String) {
        outletLabelTituloAjuda.text = dicionarioTituloAjuda[idiomaSendoUsado]
        outletLabelDescricaoInfinito.text = dicionarioDescricaoInfinito[idiomaSendoUsado]
        outletLabelDescricaoNan.text = dicionarioDescricaoNan[idiomaSendoUsado]
    }
}


// -------------
// Mais Opções:
// -------------
let dicionarioTituloMaisOpcoes: [String: String] = [
    "Português" : "Mais Opções",
    "Inglês" : "More Options",
    "Espanhol" : "Mas opciones",
    "Mandarim" : "更多的选择"
]

let dicionarioLabelSomDasTeclas: [String: String] = [
    "Português" : "Som das Teclas",
    "Inglês" : "Buttons with Sound",
    "Espanhol" : "Botones con Sonido",
    "Mandarim" : "有声按钮"
]

let dicionarioLabelRetratoSimples: [String: String] = [
    "Português" : "Retrato Simples",
    "Inglês" : "Simple Portrait",
    "Espanhol" : "Forma más Sencilla",
    "Mandarim" : "简单地"
]

let dicionarioLabelEsconderUltimaResposta: [String: String] = [
    "Português" : "Esconder Última Resposta",
    "Inglês" : "Hide Last Answer",
    "Espanhol" : "Ocultar Última Respuesta",
    "Mandarim" : "隐藏最后的答案"
]

let dicionarioLabelEsconderBotaoGraRad: [String: String] = [
    "Português" : "Esconder Botão Gra/Rad",
    "Inglês" : "Hide Deg/Rad Button",
    "Espanhol" : "Ocultar Botón de Gra/Rad",
    "Mandarim" : "隐藏角键"
]

let dicionarioLabelModoRadiano: [String: String] = [
    "Português" : "Modo Radiano",
    "Inglês" : "Radian Mode",
    "Espanhol" : "Modo Radian",
    "Mandarim" : "弧度模式"
]

let dicionarioLabelBotaoPorCentoClassico: [String: String] = [
    "Português" : "Botão % Clássico",
    "Inglês" : "Classic % Button",
    "Espanhol" : "Botón % Clásico",
    "Mandarim" : "经典％按钮"
]

let dicionarioMostrarMemoria: [String: String] = [
    "Português" : "Mostrar Memória",
    "Inglês" : "Show Memory",
    "Espanhol" : "Mostrar memoria",
    "Mandarim" : "显示内存"
]

let dicionarioIdioma: [String: String] = [
    "Português" : "Idioma",
    "Inglês" : "Language",
    "Espanhol" : "Idioma",
    "Mandarim" : "语言"
]

let dicionarioCasasDecimais: [String: String] = [
    "Português" : "Casas Decimais",
    "Inglês" : "Decimal Places",
    "Espanhol" : "Casas decimales",
    "Mandarim" : "小数位数"
]

let dicionarioRedefinirAjustes: [String: String] = [
    "Português" : "Redefinir Todos os Ajustes",
    "Inglês" : "Reset All Settings",
    "Espanhol" : "Restablecer todos los ajustes",
    "Mandarim" : "复位所有设置"
]

let dicionarioAvalidarNaAppStore: [String: String] = [
    "Português" : "Avaliar na App Store!",
    "Inglês" : "Rate on the App Store!",
    "Espanhol" : "Evaluar en la App Store!",
    "Mandarim" : "评估应用程序!"
]

let dicionarioVerCodigoFonte: [String: String] = [
    "Português" : "Ver Código Fonte",
    "Inglês" : "Source Code",
    "Espanhol" : "Código fuente",
    "Mandarim" : "源代码"
]

extension MaisOpcoesViewController {
    
    /**
     
     Aplica o idioma para os elementos de interface da classe "MaisOpcoesViewController".
     
     - Parâmetros: Idioma sendo usado. (String)
     - Retorna: Nada.
     
     */
    func aplicaIdiomaMaisOpcoes(idiomaSendoUsado: String) {
        
        outletBotaoFechar.setTitle(dicionarioBotaoFechar[idiomaSendoUsado], forState: UIControlState.Normal)
        outletLabelTituloMenu.text = dicionarioTituloMaisOpcoes[idiomaSendoUsado]
        
        outletLabelSomDasTeclas.text = dicionarioLabelSomDasTeclas[idiomaSendoUsado]
        outletLabelRetratoSimples.text = dicionarioLabelRetratoSimples[idiomaSendoUsado]
        outletLabelEsconderUltimaResposta.text = dicionarioLabelEsconderUltimaResposta[idiomaSendoUsado]
        outletLabelEsconderBotaoGraRad.text = dicionarioLabelEsconderBotaoGraRad[idiomaSendoUsado]
        outletLabelModoRadiano.text = dicionarioLabelModoRadiano[idiomaSendoUsado]
        outletLabelPorCentoClassico.text = dicionarioLabelBotaoPorCentoClassico[idiomaSendoUsado]
        outletLabelMostrarMemoria.text = dicionarioMostrarMemoria[idiomaSendoUsado]
        outletLabelIdioma.text = dicionarioIdioma[idiomaSendoUsado]
        outletLabelTituloCasasDecimais.text = dicionarioCasasDecimais[idiomaSendoUsado]
        
        outletBotaoRedefinirAjustes.setTitle(dicionarioRedefinirAjustes[idiomaSendoUsado], forState: UIControlState.Normal)
        outletBotaoAvaliarNaAppStore.setTitle(dicionarioAvalidarNaAppStore[idiomaSendoUsado], forState: UIControlState.Normal)
        outletBotaoVerCodigoFonte.setTitle(dicionarioVerCodigoFonte[idiomaSendoUsado], forState: UIControlState.Normal)
    }
}






