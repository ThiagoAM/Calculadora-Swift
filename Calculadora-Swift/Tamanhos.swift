//
//  Tamanhos.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import UIKit

extension ViewController {
    
    /**
     
     Chama a função 'acaoAoAtivarMultiTarefas' quando modo multi-tarefas over fica ativo.
     
     - Parâmetros: previousTraitCollection. (UITraitCollection?)
     - Retorna: Nada.
     
    */
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        
        acaoAoAtivarMultiTarefas()
        
    }
    
    /**
     
     Aplica as ações necesárias ao entrar em modo Multi-Tarefas.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func acaoAoAtivarMultiTarefas() {
        escondeFileirasDeAcordoComTipoDeTela()
    }
    
    
    
    /**
     
     Aplica os tamanhos de fonte da interface.
     
     - Parâmetros: Tamanhos de fonte. (CGFloat)
     - Retorna: Nada.
     
    */
    func aplicaTamanhoDeFontes(tamanhoFonteOpcoes tamanhoFonteOpcoes: CGFloat, tamanhoFonteMemoria: CGFloat, tamanhoFonteUltimoResultadoEVisorMemoria: CGFloat, tamanhoFonteResultadoFinal: CGFloat, tamanhoFonteVisorCalculo: CGFloat, tamanhoFonteTecladoGeral: CGFloat) {
        
        atribuiTamanhoDeFontesConfiguracoes(tamanhoFonteOpcoes)
        atribuiTamanhoDeFonteBotoesMemoria(tamanhoFonteMemoria)
        atribuiTamanhoDeFonteUltimoResultadoEVisorMemoria(tamanhoFonteUltimoResultadoEVisorMemoria)
        
        outletLabelResultadoFinal.font = UIFont(name: outletLabelResultadoFinal.font.fontName, size: tamanhoFonteResultadoFinal)
        outletBotaoDegOuRad.titleLabel!.font = UIFont(name: outletBotaoDegOuRad.titleLabel!.font.fontName, size: tamanhoFonteOpcoes)
        outletLabelExpressaoMatematica.font = UIFont(name: outletLabelExpressaoMatematica.font.fontName, size: tamanhoFonteVisorCalculo)
        atribuiTamanhoFonteTecladoGeral(tamanhoFonteTecladoGeral)
    }
    
    
    /**
     
     Atribui tamanho para todas as fontes.
     
     - Parâmetros: Tamanho geral da fonte das teclas, do botão de configurações, histórico, informações, resultado antigo, final e cálculo.
     - Retorna: Nada.
     
    */
    func defineOTamanhoDasFontes(tamanhoGeralDasTeclas: CGFloat, tamanhoBotaoConfig: CGFloat, tamanhoBotaoHistorico: CGFloat, tamanhoBotaoInfo: CGFloat, tamanhoFonteResultadoAntigo: CGFloat, tamanhoFonteResultadoFinal: CGFloat, tamanhoFonteCalculo: CGFloat) {
        atribuiTamanhoDeFonteBotoesMemoria(tamanhoBotaoConfig - 8.0)
        atribuiTamanhoFonteTecladoGeral(tamanhoGeralDasTeclas)
        botaoConfig.titleLabel!.font = UIFont(name: botaoConfig.titleLabel!.font.fontName, size: tamanhoBotaoConfig)
        outletBotaoVoltarMenuOpcoes.titleLabel!.font = UIFont(name: outletBotaoVoltarMenuOpcoes.titleLabel!.font.fontName, size: tamanhoBotaoConfig)
        botaoHistorico.titleLabel!.font = UIFont(name: botaoHistorico.titleLabel!.font.fontName, size: tamanhoBotaoHistorico)
        outletBotaoCoresMenuOpcoes.titleLabel!.font = UIFont(name: outletBotaoCoresMenuOpcoes.titleLabel!.font.fontName, size: tamanhoBotaoInfo)
        outletBotaoAjudaMenuOpcoes.titleLabel!.font = UIFont(name: outletBotaoAjudaMenuOpcoes.titleLabel!.font.fontName, size: tamanhoBotaoInfo)
        outletBotaoMaisOpcoesMenuOpcoes.titleLabel!.font = UIFont(name: outletBotaoMaisOpcoesMenuOpcoes.titleLabel!.font.fontName, size: tamanhoBotaoConfig)
        
        resultadoAntigo.font = UIFont(name: resultadoAntigo.font.fontName, size: tamanhoFonteResultadoAntigo)
        outletVisorDeMemoria.font = UIFont(name: outletVisorDeMemoria.font.fontName, size: tamanhoFonteResultadoAntigo)
        
        outletLabelResultadoFinal.font = UIFont(name: outletLabelResultadoFinal.font.fontName, size: tamanhoFonteResultadoFinal)
        outletLabelExpressaoMatematica.font = UIFont(name: outletLabelExpressaoMatematica.font.fontName, size: tamanhoFonteCalculo)
    }
    
    
    /**
     
     Atribui o tamanho de fonte para o último resultado e valor de memória.
     
     - Parâemtros: Tamanho da fonte. (CGFloat)
     - Retorna: Nada.
     
     */
    func atribuiTamanhoDeFonteUltimoResultadoEVisorMemoria(tamanhoFonte: CGFloat) {
        resultadoAntigo.font = UIFont(name: resultadoAntigo.font.fontName, size: tamanhoFonte)
        outletVisorDeMemoria.font = UIFont(name: outletVisorDeMemoria.font.fontName, size: tamanhoFonte)
    }
    
    /**
     
     Atribui o tamanho de fonte dos elementos do menu de configurações.
     
     - Parâemtros: Tamanho da fonte. (CGFloat)
     - Retorna: Nada.
     
     */
    func atribuiTamanhoDeFontesConfiguracoes(tamanhoFonte: CGFloat) {
        botaoConfig.titleLabel!.font = UIFont(name: botaoConfig.titleLabel!.font.fontName, size: tamanhoFonte * 1.3)
        botaoHistorico.titleLabel!.font = UIFont(name: botaoHistorico.titleLabel!.font.fontName, size: tamanhoFonte * 1.3)
        outletBotaoVoltarMenuOpcoes.titleLabel!.font = UIFont(name: outletBotaoVoltarMenuOpcoes.titleLabel!.font.fontName, size: tamanhoFonte)
        outletBotaoCoresMenuOpcoes.titleLabel!.font = UIFont(name: outletBotaoCoresMenuOpcoes.titleLabel!.font.fontName, size: tamanhoFonte)
        outletBotaoAjudaMenuOpcoes.titleLabel!.font = UIFont(name: outletBotaoAjudaMenuOpcoes.titleLabel!.font.fontName, size: tamanhoFonte)
        outletBotaoMaisOpcoesMenuOpcoes.titleLabel!.font = UIFont(name: outletBotaoMaisOpcoesMenuOpcoes.titleLabel!.font.fontName, size: tamanhoFonte)
    }
    
    /**
     
     Atribui tamanho de fontes para os botões de memória.
     
     - Parâmetros: Tamanho da fonte. (CGFloat)
     - Retorna: Nada.
     
    */
    func atribuiTamanhoDeFonteBotoesMemoria(tamanhoFonte: CGFloat) {
        outletBotaoMc.titleLabel!.font = UIFont(name: outletBotaoMc.titleLabel!.font.fontName, size: tamanhoFonte)
        outletBotaoMMais.titleLabel!.font = UIFont(name: outletBotaoMMais.titleLabel!.font.fontName, size: tamanhoFonte)
        outletBotaoMMenos.titleLabel!.font = UIFont(name: outletBotaoMMenos.titleLabel!.font.fontName, size: tamanhoFonte)
        outletBotaoMS.titleLabel!.font = UIFont(name: outletBotaoMS.titleLabel!.font.fontName, size: tamanhoFonte)
    }
    
    /**
     
     Esconde ou mostra fileiras do teclado.
     
     - Parâmetros: Status de exibição (Verdadeiro ou Falso) das fileiras 05 à 09.
     - Retorna: Nada.
     
    */
    func escondeOuMostraFileirasDoTecladoPrincipal(fileira05 aFileira05: Bool, fileira06: Bool, fileira07: Bool, fileira08: Bool, fileira09: Bool, fileiraHorizontal01Escondida: Bool, fileiraHorizontal02Escondida: Bool, fileiraHorizontal03Escondida: Bool, fileiraHorizontal04Escondida: Bool) {
        tecladoFileira05.hidden = aFileira05
        tecladoFileira06.hidden = fileira06
        tecladoFileira07.hidden = fileira07
        tecladoFileira08.hidden = fileira08
        tecladoFileira09.hidden = fileira09
        escondeOuMostraFileirasHorizontais(fileiraHorizontal01Escondida, fileiraHorizontal02Escondida: fileiraHorizontal02Escondida, fileiraHorizontal03Escondida: fileiraHorizontal03Escondida, fileiraHorizontal04Escondida: fileiraHorizontal04Escondida)
    }
    
    /**
     
     Esconde ou mostra as fileiras horizontais.
     
     - Parâmetros: Status de exibição das fileiras horizontais 01, 02, 03 e 04. (Verdadeiro ou Falso)
     - Retorna: Nada.
     
    */
    func escondeOuMostraFileirasHorizontais(fileiraHorizontal01Escondida: Bool, fileiraHorizontal02Escondida: Bool, fileiraHorizontal03Escondida: Bool, fileiraHorizontal04Escondida: Bool) {
        outletBotaoEHorizontal.hidden = fileiraHorizontal01Escondida
        outletBotaoLogHorizontal.hidden = fileiraHorizontal01Escondida
        outletBotaoSinHorizontal.hidden = fileiraHorizontal01Escondida
        outletBotaoCosHorizontal.hidden = fileiraHorizontal01Escondida
        outletBotaoTanHorizontal.hidden = fileiraHorizontal01Escondida
        
        outletBotaoPiHorizontal.hidden = fileiraHorizontal02Escondida
        outletBotaoXlogHorizontal.hidden = fileiraHorizontal02Escondida
        outletBotaoSinhHorizontal.hidden = fileiraHorizontal02Escondida
        outletBotaoCoshHorizontal.hidden = fileiraHorizontal02Escondida
        outletBotaoTanhHorizontal.hidden = fileiraHorizontal02Escondida
        
        outletBotaoGoldenRatioHorizontal.hidden = fileiraHorizontal03Escondida
        outleBotaoLnHorizontal.hidden = fileiraHorizontal03Escondida
        outletBotaoAsinHorizontal.hidden = fileiraHorizontal03Escondida
        outletBotaoAcosHorizontal.hidden = fileiraHorizontal03Escondida
        outletBotaoAtanHorizontal.hidden = fileiraHorizontal03Escondida
        
        outletBotaoRandHorizontal.hidden = fileiraHorizontal04Escondida
        outletBotaoXrootHorizontal.hidden = fileiraHorizontal04Escondida
        outletBotaoAsinhHorizontal.hidden = fileiraHorizontal04Escondida
        outletBotaoAcoshHorizontal.hidden = fileiraHorizontal04Escondida
        outletBotaoAtanhHorizontal.hidden = fileiraHorizontal04Escondida
    }
    
    /**
     
     Atualiza um Stack View qualquer (Esconde e exibe o StackView).
     
     - Parâmetros: StackView. (UIStackView)
     - Retorna: Nada.
     
    */
    func atualizaUmStackViewQualquer(stackView: UIStackView) {
        stackView.hidden = !stackView.hidden
        stackView.hidden = !stackView.hidden
    }
    
    
    
    
    
    /**
     
     Mosta ou esconde o botão de graus e radianos.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func mostraOuEscondeBotaoDegOuRad() {
        
        if verificaSeBotaoRadOuDegEstaAtivado() == true {
            
            larguraViewDoBotaoDegRad.constant = 80
            
        } else {
            
            larguraViewDoBotaoDegRad.constant = 20
            
        }
    }
    
    /**
     
     Mostra ou esconde o visor de último resultado.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func mostraOuEscondeUltimoResultado() {
        outletViewResultadoAntigo.hidden = !verificaSeUltimoResultadoEstaAtivado()
    }
    
    /**
     
     Mostra ou esconde os botões e visor de memória.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func mostraOuEscondeMemoria() {
        outletStackViewMemoria.hidden = !verificaSeModoMemoriaEstaAtivado()
        outletViewMemoria.hidden = !verificaSeModoMemoriaEstaAtivado()
    }
    
    /**
     
     Mostra ou esconde o Stack View que contém os visores de memória e último resultado.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func mostraOuEscondeStackViewUltimoResultadoEMemoria() {
        if verificaSeModoMemoriaEstaAtivado() == false && verificaSeUltimoResultadoEstaAtivado() == false {
            resultadoAntigoStack.hidden = true
        } else {
            resultadoAntigoStack.hidden = false
        }
    }
    
    
    
    /**
     
     Verifica as configurações do usuário e aplica elas na interface.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func verificaEAplicaMaisOpcoes() {
        
        // Mostra ou esconde o último resultado:
        mostraOuEscondeUltimoResultado()
        
        // Mostra ou esconde o botão Deg/Rad:
        mostraOuEscondeBotaoDegOuRad()
        
        // Mostra ou esconde os botões de memória e seu visor:
        mostraOuEscondeMemoria()
        
        // Mostra ou esconde o Stack View pai dos views de memória e última resposta:
        mostraOuEscondeStackViewUltimoResultadoEMemoria()
        
        // Atualiza o StackView dos Visores:
        atualizaUmStackViewQualquer(outletStackViewVisores)
        
    }
    
    
    
    /**
     
     Define a altura do menu de opções (cabeçalho) e do teclado.
     
     - Parâmetros: alturas do cabeçalho e teclado (visor memória e último resultado ligado e desligado)
     - Retorna: Nada.
     
     */
    func defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo alturaCabecalhoVisorAtivo: CGFloat, alturaTecladoVisorAtivo: CGFloat, alturaCabecalhoVisorDesligado: CGFloat, alturaTecladoVisorDesligado: CGFloat) {
        if verificaSeModoMemoriaEstaAtivado() == true || verificaSeUltimoResultadoEstaAtivado() == true {
            
            outletConstraintAlturaCabecalho.constant = alturaCabecalhoVisorAtivo
            outletConstraintAlturaStackViewTeclado.constant = alturaTecladoVisorAtivo
            
        } else { // Último resultado e Memória Desativados:
            
            outletConstraintAlturaCabecalho.constant = alturaCabecalhoVisorDesligado
            outletConstraintAlturaStackViewTeclado.constant = alturaTecladoVisorDesligado
        }
    }
    
    /**
     
     Define a altura do resultado final e da expressão matemática.
     
     - Parâmetros: Altura do resultado final e expressão matemática.
     - Retorna: Nada.
     
    */
    func defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos alturaResultadoFinalVisoresAtivos: CGFloat, alturaExpressaoMatematicaVisoresAtivos: CGFloat, alturaResultadoFinalVisoresDesligados: CGFloat, alturaExpressaoMatematicaVisoresDesligados: CGFloat) {
        
        if verificaSeModoMemoriaEstaAtivado() == true || verificaSeUltimoResultadoEstaAtivado() == true {
            
            outletConstraintAlturaResultadoFinal.constant = alturaResultadoFinalVisoresAtivos
            outletConstraintAlturaExpressaoMatematica.constant = alturaExpressaoMatematicaVisoresAtivos
            
        } else { // Último resultado e Memória Desativados:
            
            outletConstraintAlturaResultadoFinal.constant = alturaResultadoFinalVisoresDesligados
            outletConstraintAlturaExpressaoMatematica.constant = alturaExpressaoMatematicaVisoresDesligados
        }
    }
    
    
    
    /**
     
     Realiza tratamentos de interface de acordo com o tipo e orientação da tela.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func escondeFileirasDeAcordoComTipoDeTela() {
        
        // Função do Timer: Evita que a função 'retornaTipoDeTela()' retorne a resolução da tela anterior.
        let seconds = 0.00001
        let delay = seconds * Double(NSEC_PER_SEC)
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), { // Inicio do Timer.
 
            self.verificaEAplicaMaisOpcoes()
            
            // Detecta o tipo de tela:
            let modoDeTela = detectaTipoDeTela(self.viewPrincipal.bounds)
            
            switch modoDeTela {
                
            // ---------
            // iPad Pro
            // ---------
            case "ipadProPortrait": // Portrait
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 230.0, alturaExpressaoMatematicaVisoresAtivos: 100.0, alturaResultadoFinalVisoresDesligados: 210.0, alturaExpressaoMatematicaVisoresDesligados: 170.0)
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 120.0, alturaTecladoVisorAtivo: 680.0, alturaCabecalhoVisorDesligado: 120.0, alturaTecladoVisorDesligado: 770.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 26, tamanhoFonteMemoria: 26, tamanhoFonteUltimoResultadoEVisorMemoria: 40, tamanhoFonteResultadoFinal: 120, tamanhoFonteVisorCalculo: 50, tamanhoFonteTecladoGeral: 33)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: self.verificaSeModoSimplesEstaAtivado(), fileira06: self.verificaSeModoSimplesEstaAtivado(), fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: true, fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
            case "ipadProLandscape": // Landscape
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 120.0, alturaTecladoVisorAtivo: 550.0, alturaCabecalhoVisorDesligado: 120.0, alturaTecladoVisorDesligado: 600.0)
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 100.0, alturaExpressaoMatematicaVisoresAtivos: 70.0, alturaResultadoFinalVisoresDesligados: 130.0, alturaExpressaoMatematicaVisoresDesligados: 80.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 26, tamanhoFonteMemoria: 26, tamanhoFonteUltimoResultadoEVisorMemoria: 40, tamanhoFonteResultadoFinal: 70, tamanhoFonteVisorCalculo: 40, tamanhoFonteTecladoGeral: 28)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: false, fileira07: false, fileira08: false, fileira09: false, fileiraHorizontal01Escondida: true, fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
            case "ipadProPortraitSlideOver": // Slide Over Portrait
                
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 120.0, alturaTecladoVisorAtivo: 680.0, alturaCabecalhoVisorDesligado: 120.0, alturaTecladoVisorDesligado: 680.0)
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 160.0, alturaExpressaoMatematicaVisoresAtivos: 100.0, alturaResultadoFinalVisoresDesligados: 230.0, alturaExpressaoMatematicaVisoresDesligados: 120.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 17, tamanhoFonteMemoria: 22, tamanhoFonteUltimoResultadoEVisorMemoria: 40, tamanhoFonteResultadoFinal: 110, tamanhoFonteVisorCalculo: 40, tamanhoFonteTecladoGeral: 25)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: true, fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: false, fileiraHorizontal02Escondida: false, fileiraHorizontal03Escondida: false, fileiraHorizontal04Escondida: false)
                
                
            case "ipadProLandscapeSlideOver": // Slide Over Landscape
                
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 100.0, alturaTecladoVisorAtivo: 600.0, alturaCabecalhoVisorDesligado: 120.0, alturaTecladoVisorDesligado: 680.0)
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 100.0, alturaExpressaoMatematicaVisoresAtivos: 70.0, alturaResultadoFinalVisoresDesligados: 100.0, alturaExpressaoMatematicaVisoresDesligados: 70.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 17, tamanhoFonteMemoria: 22, tamanhoFonteUltimoResultadoEVisorMemoria: 25, tamanhoFonteResultadoFinal: 75, tamanhoFonteVisorCalculo: 40, tamanhoFonteTecladoGeral: 25)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: true, fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: false, fileiraHorizontal02Escondida: false, fileiraHorizontal03Escondida: false, fileiraHorizontal04Escondida: false)
                
                
            // -----
            // iPad
            // -----
            case "ipadPortrait": // Portrait
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 180.0, alturaExpressaoMatematicaVisoresAtivos: 100.0, alturaResultadoFinalVisoresDesligados: 180.0, alturaExpressaoMatematicaVisoresDesligados: 100.0)
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 80.0, alturaTecladoVisorAtivo: 500.0, alturaCabecalhoVisorDesligado: 160.0, alturaTecladoVisorDesligado: 550.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 19, tamanhoFonteMemoria: 22, tamanhoFonteUltimoResultadoEVisorMemoria: 32, tamanhoFonteResultadoFinal: 95, tamanhoFonteVisorCalculo: 35, tamanhoFonteTecladoGeral: 32)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: self.verificaSeModoSimplesEstaAtivado(), fileira06: self.verificaSeModoSimplesEstaAtivado(), fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: true, fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
            case "ipadLandscape": // Landscape
                
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 100.0, alturaExpressaoMatematicaVisoresAtivos: 70.0, alturaResultadoFinalVisoresDesligados: 100.0, alturaExpressaoMatematicaVisoresDesligados: 70.0)
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 70.0, alturaTecladoVisorAtivo: 400.0, alturaCabecalhoVisorDesligado: 120.0, alturaTecladoVisorDesligado: 425.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 19, tamanhoFonteMemoria: 20, tamanhoFonteUltimoResultadoEVisorMemoria: 28, tamanhoFonteResultadoFinal: 60, tamanhoFonteVisorCalculo: 30, tamanhoFonteTecladoGeral: 29)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: false, fileira07: false, fileira08: false, fileira09: false, fileiraHorizontal01Escondida: true, fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
            case "ipadPortraitSlideOver": // Slide Over Portrait
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 140.0, alturaExpressaoMatematicaVisoresAtivos: 80.0, alturaResultadoFinalVisoresDesligados: 230.0, alturaExpressaoMatematicaVisoresDesligados: 100.0)
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 70.0, alturaTecladoVisorAtivo: 550.0, alturaCabecalhoVisorDesligado: 100.0, alturaTecladoVisorDesligado: 560.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 15, tamanhoFonteMemoria: 20, tamanhoFonteUltimoResultadoEVisorMemoria: 30, tamanhoFonteResultadoFinal: 85, tamanhoFonteVisorCalculo: 30, tamanhoFonteTecladoGeral: 22)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: true, fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: false, fileiraHorizontal02Escondida: false, fileiraHorizontal03Escondida: false, fileiraHorizontal04Escondida: false)
                
            case "ipadLandscapeSlideOver": // Slide Over Landscape
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 80.0, alturaExpressaoMatematicaVisoresAtivos: 50.0, alturaResultadoFinalVisoresDesligados: 80.0, alturaExpressaoMatematicaVisoresDesligados: 60.0)
                
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 60.0, alturaTecladoVisorAtivo: 460.0, alturaCabecalhoVisorDesligado: 80.0, alturaTecladoVisorDesligado: 500.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 15, tamanhoFonteMemoria: 20, tamanhoFonteUltimoResultadoEVisorMemoria: 20, tamanhoFonteResultadoFinal: 55, tamanhoFonteVisorCalculo: 25, tamanhoFonteTecladoGeral: 22)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: true, fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: false, fileiraHorizontal02Escondida: false, fileiraHorizontal03Escondida: false, fileiraHorizontal04Escondida: false)
                
            // --------------
            // iPhone 6 Plus
            // --------------
            case "iphone6PlusPortrait": // Portrait
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 50.0, alturaTecladoVisorAtivo: 400.0, alturaCabecalhoVisorDesligado: 90.0, alturaTecladoVisorDesligado: 450.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 18, tamanhoFonteMemoria: 22, tamanhoFonteUltimoResultadoEVisorMemoria: 25, tamanhoFonteResultadoFinal: 60, tamanhoFonteVisorCalculo: 26, tamanhoFonteTecladoGeral: 26)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: self.verificaSeModoSimplesEstaAtivado(), fileira06: true, fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: self.verificaSeModoSimplesEstaAtivado(), fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
                self.outletBarraDeStatus.hidden = false
                
            case "iphone6PlusLandscape": // Landscape
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 45.0, alturaTecladoVisorAtivo: 220.0, alturaCabecalhoVisorDesligado: 50.0, alturaTecladoVisorDesligado: 270.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 17, tamanhoFonteMemoria: 17, tamanhoFonteUltimoResultadoEVisorMemoria: 19, tamanhoFonteResultadoFinal: 34, tamanhoFonteVisorCalculo: 19, tamanhoFonteTecladoGeral: 20)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: false, fileira07: false, fileira08: false, fileira09: false, fileiraHorizontal01Escondida: true, fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                self.outletBarraDeStatus.hidden = true
            
            // ---------
            // iPhone 6
            // ---------
            case "iphone6Portrait": // Portrait
                
                
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 80.0, alturaExpressaoMatematicaVisoresAtivos: 50.0, alturaResultadoFinalVisoresDesligados: 80.0, alturaExpressaoMatematicaVisoresDesligados: 60.0)
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 50.0, alturaTecladoVisorAtivo: 370.0, alturaCabecalhoVisorDesligado: 60.0, alturaTecladoVisorDesligado: 440.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 17, tamanhoFonteMemoria: 20, tamanhoFonteUltimoResultadoEVisorMemoria: 22, tamanhoFonteResultadoFinal: 60, tamanhoFonteVisorCalculo: 25, tamanhoFonteTecladoGeral: 26)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: self.verificaSeModoSimplesEstaAtivado(), fileira06: true, fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: self.verificaSeModoSimplesEstaAtivado(), fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
                self.outletBarraDeStatus.hidden = false
                
            case "iphone6Landscape": // Landscape
                
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 44, alturaExpressaoMatematicaVisoresAtivos: 44, alturaResultadoFinalVisoresDesligados: 44, alturaExpressaoMatematicaVisoresDesligados: 44)
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 44, alturaTecladoVisorAtivo: 200.0, alturaCabecalhoVisorDesligado: 44, alturaTecladoVisorDesligado: 260.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 17, tamanhoFonteMemoria: 17, tamanhoFonteUltimoResultadoEVisorMemoria: 17, tamanhoFonteResultadoFinal: 27, tamanhoFonteVisorCalculo: 15, tamanhoFonteTecladoGeral: 22)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: false, fileira07: false, fileira08: false, fileira09: false, fileiraHorizontal01Escondida: true, fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                self.outletBarraDeStatus.hidden = true
                
            // ---------
            // iPhone 5
            // ---------
            case "iphone5Portrait": // Portrait
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 55.0, alturaExpressaoMatematicaVisoresAtivos: 44.0, alturaResultadoFinalVisoresDesligados: 60.0, alturaExpressaoMatematicaVisoresDesligados: 48.0)
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 50.0, alturaTecladoVisorAtivo: 310.0, alturaCabecalhoVisorDesligado: 60.0, alturaTecladoVisorDesligado: 380.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 15, tamanhoFonteMemoria: 18, tamanhoFonteUltimoResultadoEVisorMemoria: 20, tamanhoFonteResultadoFinal: 35, tamanhoFonteVisorCalculo: 20, tamanhoFonteTecladoGeral: 23)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: self.verificaSeModoSimplesEstaAtivado(), fileira06: true, fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: self.verificaSeModoSimplesEstaAtivado(), fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
                self.outletBarraDeStatus.hidden = false
                
            case "iphone5Landscape": // Landscape
                
                self.outletBarraDeStatus.hidden = true
                self.resultadoAntigoStack.hidden = true
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 40, alturaExpressaoMatematicaVisoresAtivos: 30, alturaResultadoFinalVisoresDesligados: 40, alturaExpressaoMatematicaVisoresDesligados: 30)
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 44.0, alturaTecladoVisorAtivo: 206.0, alturaCabecalhoVisorDesligado: 44.0, alturaTecladoVisorDesligado: 206.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 15, tamanhoFonteMemoria: 14, tamanhoFonteUltimoResultadoEVisorMemoria: 15, tamanhoFonteResultadoFinal: 22, tamanhoFonteVisorCalculo: 15, tamanhoFonteTecladoGeral: 20)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: false, fileira07: false, fileira08: false, fileira09: false, fileiraHorizontal01Escondida: true, fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
            // ----------
            // iPhone 4S
            // ----------
            case "iphone4sPortrait": // Portrait
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 36.0, alturaExpressaoMatematicaVisoresAtivos: 44.0, alturaResultadoFinalVisoresDesligados: 44.0, alturaExpressaoMatematicaVisoresDesligados: 50.0)
                
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 44.0, alturaTecladoVisorAtivo: 250.0, alturaCabecalhoVisorDesligado: 44.0, alturaTecladoVisorDesligado: 290)
                
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 15, tamanhoFonteMemoria: 18, tamanhoFonteUltimoResultadoEVisorMemoria: 20, tamanhoFonteResultadoFinal: 35, tamanhoFonteVisorCalculo: 20, tamanhoFonteTecladoGeral: 23)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: self.verificaSeModoSimplesEstaAtivado(), fileira06: true, fileira07: true, fileira08: true, fileira09: true, fileiraHorizontal01Escondida: true, fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
                self.outletBarraDeStatus.hidden = false
                
            case "iphone4sLandscape": // Landscape
                
                
                self.outletBarraDeStatus.hidden = true
                self.resultadoAntigoStack.hidden = true
                
                self.defineAlturaDeResultadoFinalEExpressaoMatematica(alturaResultadoFinalVisoresAtivos: 40, alturaExpressaoMatematicaVisoresAtivos: 30, alturaResultadoFinalVisoresDesligados: 40, alturaExpressaoMatematicaVisoresDesligados: 30)
                
                self.defineTamanhoDeCabecalhoETeclado(alturaCabecalhoVisorAtivo: 44.0, alturaTecladoVisorAtivo: 206.0, alturaCabecalhoVisorDesligado: 44.0, alturaTecladoVisorDesligado: 206.0)
                
                self.aplicaTamanhoDeFontes(tamanhoFonteOpcoes: 15, tamanhoFonteMemoria: 14, tamanhoFonteUltimoResultadoEVisorMemoria: 15, tamanhoFonteResultadoFinal: 22, tamanhoFonteVisorCalculo: 15, tamanhoFonteTecladoGeral: 20)
                
                self.escondeOuMostraFileirasDoTecladoPrincipal(fileira05: false, fileira06: false, fileira07: false, fileira08: false, fileira09: false, fileiraHorizontal01Escondida: true, fileiraHorizontal02Escondida: true, fileiraHorizontal03Escondida: true, fileiraHorizontal04Escondida: true)
                
            default:
                break
            }
       
        
        }) // Fim do Timer.
    
    }
    
    /**
     
     Atribuir tamanho para as fontes do teclado.
     
     - Parâemtros: Tamanho da fonte.
     - Retorna: Nada.
     
    */
    func atribuiTamanhoFonteTecladoGeral(tamanhoFonte: CGFloat) {
        
        let tipoETamanhoDeFonteDoTeclado = UIFont(name: ".SFUIDisplay-Light", size: tamanhoFonte)
        
        pontoOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        zeroOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        umOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        doisOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        tresOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        quatroOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        cincoOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        seisOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        seteOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        oitoOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        noveOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        cOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        delOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        abreParentesesOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        fechaParentesesOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        abreEFechaParentesesOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        dividirOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        vezesOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        menosOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        maisOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        maisOuMenosOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        raizQuadradaOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        porCentoOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        potenciaOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        fatorialOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        sinOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        cosOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        tanOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        sinhOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        coshOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        tanhOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        asinOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        acosOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        atanOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        asinhOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        acoshOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        atanhOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        piOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        eOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoGoldenRatio.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        randOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        lnOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        logXOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        log10outlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        xRootOutlet.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        // Fileiras Horizontais:
        outletBotaoEHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoLogHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoSinHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoCosHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoTanHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        outletBotaoPiHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoXlogHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoSinhHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoCoshHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoTanhHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        outletBotaoGoldenRatioHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outleBotaoLnHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoAsinHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoAcosHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoAtanHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
        outletBotaoRandHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoXrootHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoAsinhHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoAcoshHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        outletBotaoAtanhHorizontal.titleLabel!.font = tipoETamanhoDeFonteDoTeclado
        
    }
    
} // Fim extension ViewController







