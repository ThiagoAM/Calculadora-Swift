//
//  Cores.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import UIKit



extension ViewController {
    
    /**
     
     Aplica a cor de fundo do menu de configurações.
     
     - Parâmetros: Cor de fundo do menu aberto. (UIColor)
     - Retorna: Nada.
     
    */
    func aplicaCorDeFundoMenuDeConfiguracoes(corMenuAberto: UIColor) {
        
        if verificaSeMenuConfiguracoesEstaAberto() == true {
            outletViewStackViewCabecalho.backgroundColor = corMenuAberto
        } else {
            outletViewStackViewCabecalho.backgroundColor = .None
        }
        
        corFundoMenuDeOpcoes = corMenuAberto // Variável Global:
    }
    
            
    // ---------------------------------
    //
    //      COR DE FUNDO DO TECLADO:
    //
    // ---------------------------------
    
    /**
     
     Altera a cor do caractere dos botões de memória.
     
     - Parâmetros: Cor dos caracteres. (UIColor)
     - Retorna: Nada.
     
    */
    func alteraCorCaractereBotoesMemoria(corCaractere: UIColor) {
        outletBotaoMc.setTitleColor(corCaractere, forState: UIControlState.Normal)
        outletBotaoMMais.setTitleColor(corCaractere, forState: UIControlState.Normal)
        outletBotaoMMenos.setTitleColor(corCaractere, forState: UIControlState.Normal)
        outletBotaoMS.setTitleColor(corCaractere, forState: UIControlState.Normal)
        
    }
    
    /**
     
     Altera a cor de fundo dos botões C/AC e Del.
     
     - Parâmetros: Cor de fundo e opacidade da cor. (UIColor, CGFloat)
     - Retorna: Nada.
     
     */
    func alteraCorFundoTecladoBotaoCEDel(corDeFundo: UIColor, opacidadeDaCor: CGFloat) {
        colocaCorDeFundoEmUmBotao(cOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(delOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
    }
    
    /**
     
     Altera a cor de fundo dos botões de parênteses.
     
     - Parâmetros: Cor de fundo e opacidade da cor. (UIColor, CGFloat)
     - Retorna: Nada.
     
     */
    func alteraCorFundoTecladoParenteses(corDeFundo: UIColor, opacidadeDaCor: CGFloat) {
        colocaCorDeFundoEmUmBotao(abreParentesesOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(fechaParentesesOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(abreEFechaParentesesOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
    }
    
    /**
     
     Altera a cor de fundo do teclado numérico.
     
     - Parâmetros: Cor de fundo e opacidade da cor. (UIColor, CGFloat)
     - Retorna: Nada.
     
     */
    func alteraCorFundoTecladoNumerico(corDeFundo: UIColor, opacidadeDaCor: CGFloat) {
        colocaCorDeFundoEmUmBotao(zeroOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(umOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(doisOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(tresOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(quatroOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(cincoOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(seisOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(seteOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(oitoOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(noveOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(pontoOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
    }
    
    /**
     
     Altera a cor de fundo dos botões de vírgula e mais ou menos.
     
     - Parâmetros: Cor de fundo e opacidade da cor. (UIColor, CGFloat)
     - Retorna: Nada.
     
     */
    func alteraCorFundoTecladoVirgulaEMaisOuMenos(corDeFundo: UIColor, opacidadeDaCor: CGFloat) {
        colocaCorDeFundoEmUmBotao(pontoOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(maisOuMenosOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
    }
    
    /**
     
     Altera a cor de fundo dos botões de operação simples 01.
     
     - Parâmetros: Cor de fundo e opacidade da cor. (UIColor, CGFloat)
     - Retorna: Nada.
     
     */
    func alteraCorFundoTecladoOperacoesSimples01(corDeFundo: UIColor, opacidadeDaCor: CGFloat) {
        colocaCorDeFundoEmUmBotao(maisOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(menosOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(vezesOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(dividirOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
    }
    
    /**
     
     Altera a cor de fundo dos botões de operações simples 02.
     
     - Parâmetros: Cor de fundo e opacidade da cor. (UIColor, CGFloat)
     - Retorna: Nada.
     
     */
    func alteraCorFundoTecladoOperacoesSimples02(corDeFundo: UIColor, opacidadeDaCor: CGFloat) {
        colocaCorDeFundoEmUmBotao(raizQuadradaOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(porCentoOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(potenciaOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(fatorialOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
    }
    
    /**
     
     Altera a cor de fundo dos botões de operações complexas 01.
     
     - Parâmetros: Cor de fundo e opacidade da cor. (UIColor, CGFloat)
     - Retorna: Nada.
     
     */
    func alteraCorFundoTecladoOperacoesComplexas01(corDeFundo: UIColor, opacidadeDaCor: CGFloat) {
        // Fileiras Verticais:
        colocaCorDeFundoEmUmBotao(piOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(eOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoGoldenRatio, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(randOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(lnOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(logXOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(log10outlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(xRootOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        
        // Fileiras Horizontais:
        colocaCorDeFundoEmUmBotao(outletBotaoPiHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoLogHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoEHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoXlogHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoRandHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outleBotaoLnHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoGoldenRatioHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoXrootHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
    }
    
    /**
     
     Altera a cor de fundo dos botões de operações complexas 02.
     
     - Parâmetros: Cor de fundo e opacidade da cor. (UIColor, CGFloat)
     - Retorna: Nada.
     
     */
    func alteraCorFundoTecladoOperacoesComplexas02(corDeFundo: UIColor, opacidadeDaCor: CGFloat) {
        // Fileiras Verticais:
        colocaCorDeFundoEmUmBotao(sinOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(cosOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(tanOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(sinhOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(coshOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(tanhOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(asinOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(acosOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(atanOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(asinhOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(acoshOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(atanhOutlet, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        
        // Fileiras Horizontais:
        colocaCorDeFundoEmUmBotao(outletBotaoSinHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoCosHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoTanHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoSinhHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoCoshHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoTanhHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoAsinHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoAcosHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoAtanHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoAsinhHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoAcoshHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
        colocaCorDeFundoEmUmBotao(outletBotaoAtanhHorizontal, cor: corDeFundo, opacidadeDaCor: opacidadeDaCor)
    }
    
    
    // -------------------------------------------
    //
    //      COR DE CARACTERES DO MENU DE OPÇÕES:
    //
    // -------------------------------------------
    
    /**
     
     Altera a cor dos caracteres do menu de opções (Fechado).
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresMenuDeOpcoesFechado(corDoCaractere: UIColor) {
        botaoConfig.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        botaoHistorico.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    
    /**
     
     Altera a cor dos caracteres do menu de opções (Aberto).
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresMenuDeOpcoesAberto(corDoCaractere: UIColor) {
        outletBotaoVoltarMenuOpcoes.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoCoresMenuOpcoes.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoAjudaMenuOpcoes.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoMaisOpcoesMenuOpcoes.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    
    
    
    // --------------------------------------------------
    //
    //      COR DOS CARACTERES DE RESULTADOS E CÁLCULO:
    //
    // --------------------------------------------------
    
    /**
     
     Altera a cor dos caracteres do resultado final, expressão matemática, resultado antigo e memória.
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresResultadosECalculo(corDoCaractere: UIColor) {
        outletVisorDeMemoria.textColor = corDoCaractere
        resultadoAntigo.textColor = corDoCaractere
        outletLabelResultadoFinal.textColor = corDoCaractere
        outletLabelExpressaoMatematica.textColor = corDoCaractere
    }
    
    
    
    // -------------------------------------
    //
    //      COR DE CARACTERES DO TECLADO:
    //
    // -------------------------------------
    
    /**
     
     Altera a cor dos caracteres dos botões de C/AC e Del.
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresTecladoCEDel(corDoCaractere: UIColor) {
        cOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        delOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    
    /**
     
     Altera a cor dos caracteres dos botões de parênteses.
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresTecladoParenteses(corDoCaractere: UIColor) {
        abreParentesesOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        fechaParentesesOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        abreEFechaParentesesOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    
    /**
     
     Altera a cor dos caracteres dos botões do teclado numérico.
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresTecladoNumerico(corDoCaractere: UIColor) {
        zeroOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        umOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        doisOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        tresOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        quatroOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        cincoOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        seisOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        seteOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        oitoOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        noveOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    
    /**
     
     Altera a cor dos caracteres dos botões de vírgula e mais ou menos.
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresTecladoVirgulaEMaisOuMenos(corDoCaractere: UIColor) {
        pontoOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        maisOuMenosOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    
    /**
     
     Altera a cor dos caracteres do teclado de operações simples 01.
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresTecladoOperacoesSimples01(corDoCaractere: UIColor) {
        dividirOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        vezesOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        menosOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        maisOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    
    /**
     
     Altera a cor dos caracteres do teclado de operações simples 02.
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresTecladoOperacoesSimples02(corDoCaractere: UIColor) {
        raizQuadradaOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        porCentoOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        potenciaOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        fatorialOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    
    /**
     
     Altera a cor dos caracteres dos botões do teclado de operações complexas 01.
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresTecladoOperacoesComplexas01(corDoCaractere: UIColor) {
        // Fileiras Verticais:
        piOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        eOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoGoldenRatio.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        randOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        lnOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        logXOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        log10outlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        xRootOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        
        // Fileiras Horizontais:
        outletBotaoPiHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoLogHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoEHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoXlogHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoRandHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outleBotaoLnHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoGoldenRatioHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoXrootHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    
    /**
     
     Altera a cor dos caracteres dos botões do teclado de operações complexas 02.
     
     - Parâmetros: Cor do caractere. (UIColor)
     - Retorna: Nada.
     
     */
    func alteraCorCaracteresTecladoOperacoesComplexas02(corDoCaractere: UIColor) {
        // Fileiras Verticais:
        sinOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        cosOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        tanOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        sinhOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        coshOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        tanhOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        asinOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        acosOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        atanOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        asinhOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        acoshOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        atanhOutlet.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        
        // Fileiras Horizontais:
        outletBotaoSinHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoCosHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoTanHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoSinhHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoCoshHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoTanhHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoAsinHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoAcosHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoAtanHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoAsinhHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoAcoshHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
        outletBotaoAtanhHorizontal.setTitleColor(corDoCaractere, forState: UIControlState.Normal)
    }
    

    
    /**
     
     Coloca uma cor de fundo em qualquer objeto do tipo UIButton.
     
     - Parâmetros: Botão, cor e opacidade da cor. (UIButton, UIColor, CGFloat)
     - Retorna: Nada.
     
    */
    func colocaCorDeFundoEmUmBotao(botao: UIButton, cor: UIColor, opacidadeDaCor: CGFloat) {
        botao.backgroundColor = cor.colorWithAlphaComponent(opacidadeDaCor)
    }
    
    
    /**
     
     Colocar uma borda em qualquer objeto do tipo UIButton.
     
     - Parâmetros: Botão, cor de largura da linha.
     - Retorna: Nada.
     
     */
    func colocaBordaEmUmBotao(botao: UIButton, cor: UIColor, larguraLinha: CGFloat) {
        botao.layer.borderWidth = larguraLinha
        botao.layer.borderColor = cor.CGColor
    }
    
    
    /**
     
     Coloca uma borda em todos os botões do teclado de cálculo.
     
     - Parâmetros: Cor e largura das linhas.
     - Retorna: Nada.
     
     */
    func colocaBordaEmTodosOsBotoesTecladoCalculo(cor: UIColor, larguraLinhas: CGFloat) {
        
        colocaBordaEmUmView(outletViewStackViewTeclado, cor: cor, larguraLinha: larguraLinhas + (0.2 * larguraLinhas))
        
        // Fileiras Normais:
        colocaBordaEmUmBotao(zeroOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(umOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(doisOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(tresOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(quatroOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(cincoOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(seisOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(seteOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(oitoOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(noveOutlet, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(cOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(delOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(abreParentesesOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(fechaParentesesOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(abreEFechaParentesesOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(pontoOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(maisOuMenosOutlet, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(maisOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(menosOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(vezesOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(dividirOutlet, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(raizQuadradaOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(porCentoOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(potenciaOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(fatorialOutlet, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(piOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(logXOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(sinOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(cosOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(tanOutlet, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(eOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(log10outlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(sinhOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(coshOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(tanhOutlet, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(outletBotaoGoldenRatio, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(randOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(asinOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(acosOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(atanOutlet, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(lnOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(xRootOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(fatorialOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(asinhOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(acoshOutlet, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(atanhOutlet, cor: cor, larguraLinha: larguraLinhas)
        
        // Fileiras Horizontais:
        
        colocaBordaEmUmBotao(outletBotaoPiHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoLogHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoSinHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoCosHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoTanHorizontal, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(outletBotaoEHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoXlogHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoSinhHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoCoshHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoTanhHorizontal, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(outletBotaoGoldenRatioHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outleBotaoLnHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoAsinHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoAcosHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoAtanHorizontal, cor: cor, larguraLinha: larguraLinhas)
        
        colocaBordaEmUmBotao(outletBotaoRandHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoXrootHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoAsinhHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoAcoshHorizontal, cor: cor, larguraLinha: larguraLinhas)
        colocaBordaEmUmBotao(outletBotaoAtanhHorizontal, cor: cor, larguraLinha: larguraLinhas)
        
    }
    
    
    /**
     
     Aplica uma cor de fundo no view de fundo da calculadora.
     
     - Parâmetros: Cor de fundo. (UIColor)
     - Retorna: Nada.
     
    */
    func mudaCorDeFundoDaCalculadora(cor: UIColor) {
        viewPrincipal.backgroundColor = cor
    }
    
    
    /**
     
     Troca o tema da calculadora.
     
     - Parâmetros: Nome do Tema. (String)
     - Retorna: Nada.
     
     */
    func alteraTemaDaCalculadora(tema: String) {
                        
        //  Cores Gerais:
        //
        let corBranco = UIColor(white:1.0, alpha:1.0)
        let corPreto = UIColor.blackColor()
        
        //
        //
        //  Cores Gerais de caracteres:
        //
        let corPretoCinzaFonteCaracteres = UIColor(white:0.13, alpha:1.0)
                                                                
        armazenaCorDaCalculadora(tema)
        
        switch tema {
            
        case "Space Cowboy":
            
            
            // ---------------------------------
            // CRIAÇÃO DAS CORES (SPACE COWBOY)
            // ---------------------------------
            //
            //
            //
            //
            //
            let corFundoSpaceCowboy = UIColor(red:0.15, green:0.16, blue:0.13, alpha:1.0)
            //
            //         - Cor da fonte das configurações e resultado antigo:
            //
            let corMarromClaroTeclaSpaceCowboy = UIColor(red:0.46, green:0.44, blue:0.37, alpha:1.0)
            //
            //         - Cor do fundo das Teclas:
            //
            let corVerdeFundoTeclaSpaceCowboy = UIColor(red:0.65, green:0.89, blue:0.18, alpha:1.0)
            let corAzulFundoTeclaSpaceCowboy = UIColor(red:0.4, green:0.85, blue:0.94, alpha:1.0)
            let corRoxoFundoTeclaSpaceCowboy = UIColor(red:0.68, green:0.51, blue:1.0, alpha:1.0)
            let corAmareloFundoTeclaSpaceCowboy = UIColor(red:0.9, green:0.86, blue:0.45, alpha:1.0)
            
            
            // ----------------
            // CORES DE FUNDO:
            // ----------------
            
            // Altera a cor da barra de status:
            outletBarraDeStatus.backgroundColor = corPreto.colorWithAlphaComponent(0.2)
            
            
            // Altera a cor de fundo dos botões de configurações:
            aplicaCorDeFundoMenuDeConfiguracoes(corPreto.colorWithAlphaComponent(0.2))
            //aplicaCorDeFundoBotoesConfiguracoes(corPreto.colorWithAlphaComponent(0.2))
            
            
            // Altera a cor de fundo da calculadora:
            mudaCorDeFundoDaCalculadora(corFundoSpaceCowboy)
            
            
            // Altera cor de fundo das teclas:
            alteraCorFundoTecladoBotaoCEDel(corVerdeFundoTeclaSpaceCowboy, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoParenteses(corAzulFundoTeclaSpaceCowboy, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoNumerico(corBranco, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoVirgulaEMaisOuMenos(corBranco, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesSimples01(corRoxoFundoTeclaSpaceCowboy, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesSimples02(corRoxoFundoTeclaSpaceCowboy, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesComplexas01(corAmareloFundoTeclaSpaceCowboy, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesComplexas02(corAmareloFundoTeclaSpaceCowboy, opacidadeDaCor: 1.0)
            
            
            // ---------------------
            // CORES DE CARACTERES:
            // ---------------------
            
            // Altera a cor dos caracteres do menu de opções:
            alteraCorCaracteresMenuDeOpcoesFechado(corMarromClaroTeclaSpaceCowboy)
            alteraCorCaracteresMenuDeOpcoesAberto(corMarromClaroTeclaSpaceCowboy)
            
            // Altera a cor dos botões de memória:
            alteraCorCaractereBotoesMemoria(corMarromClaroTeclaSpaceCowboy)
            
            // Altera a cor dos caracteres de: Resultado Antigo, Resultado Final e Cálculo:
            resultadoAntigo.textColor = UIColor.whiteColor()
            outletVisorDeMemoria.textColor = UIColor.whiteColor()
            
            outletLabelResultadoFinal.textColor = corBranco
            outletLabelExpressaoMatematica.textColor = corBranco
            
            // Altera a cor do botão Deg ou Rad:
            outletBotaoDegOuRad.setTitleColor(corMarromClaroTeclaSpaceCowboy, forState: UIControlState.Normal)
            
            // Altera a cor dos caracteres das teclas:
            alteraCorCaracteresTecladoCEDel(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoParenteses(corPretoCinzaFonteCaracteres)
            
            alteraCorCaracteresTecladoNumerico(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoVirgulaEMaisOuMenos(corPretoCinzaFonteCaracteres)
            
            alteraCorCaracteresTecladoOperacoesSimples01(corBranco)
            alteraCorCaracteresTecladoOperacoesSimples02(corBranco)
            
            alteraCorCaracteresTecladoOperacoesComplexas01(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoOperacoesComplexas02(corPretoCinzaFonteCaracteres)
            
            
            // -------------------
            // BORDA DO TECLADO:
            // -------------------
            
            // Altera a cor e largura da borda do teclado:
            colocaBordaEmTodosOsBotoesTecladoCalculo(corFundoSpaceCowboy, larguraLinhas: 0.25)

            
            
        case "Musk":
            
            // -------------------------
            // CRIAÇÃO DAS CORES (MUSK)
            // -------------------------
            //
            //
            //
            //
            //
            let corFundoMusk = UIColor(red:0.16, green:0.17, blue:0.21, alpha:1.0)
            //
            //
            let corVerdeFundoTeclaMusk = UIColor(red:0.58, green:0.78, blue:0.44, alpha:1.0)
            let corAzulFundoTeclaMusk = UIColor(red:0.02, green:0.69, blue:0.78, alpha:1.0)
            let corRozaFundoTeclaMusk = UIColor(red:0.75, green:0.22, blue:0.6, alpha:1.0)
            let corRoxoFundoTeclaMusk = UIColor(red:0.55, green:0.52, blue:0.8, alpha:1.0)
            let corVermelhoFundoTeclaMusk = UIColor(red:0.89, green:0.27, blue:0.3, alpha:1.0)
            //
            //
            
            // ----------------
            // CORES DE FUNDO:
            // ----------------
            
            // Altera a cor da barra de status:
            outletBarraDeStatus.backgroundColor = corPreto.colorWithAlphaComponent(0.2)
            
            
            // Altera a cor de fundo dos botões de configurações:
            aplicaCorDeFundoMenuDeConfiguracoes(corPreto.colorWithAlphaComponent(0.2))
            //aplicaCorDeFundoBotoesConfiguracoes(corPreto.colorWithAlphaComponent(0.2))
            
            
            // Altera a cor de fundo da calculadora:
            mudaCorDeFundoDaCalculadora(corFundoMusk)
            
            
            // Altera cor de fundo das teclas:
            alteraCorFundoTecladoBotaoCEDel(corAzulFundoTeclaMusk, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoParenteses(corBranco, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoNumerico(corVerdeFundoTeclaMusk, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoVirgulaEMaisOuMenos(corVerdeFundoTeclaMusk, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesSimples01(corRozaFundoTeclaMusk, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesSimples02(corRozaFundoTeclaMusk, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesComplexas01(corRoxoFundoTeclaMusk, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesComplexas02(corVermelhoFundoTeclaMusk, opacidadeDaCor: 1.0)
            
            
            // ---------------------
            // CORES DE CARACTERES:
            // ---------------------
            
            // Altera a cor dos caracteres do menu de opções:
            alteraCorCaracteresMenuDeOpcoesFechado(corBranco)
            alteraCorCaracteresMenuDeOpcoesAberto(corBranco)
            
            // Altera a cor dos botões de memória:
            alteraCorCaractereBotoesMemoria(corBranco)
            
            // Altera a cor dos caracteres de: Resultado Antigo, Resultado Final e Cálculo:
            alteraCorCaracteresResultadosECalculo(corBranco)
            
            // Altera a cor do botão Deg ou Rad:
            outletBotaoDegOuRad.setTitleColor(corBranco, forState: UIControlState.Normal)
            
            // Altera a cor dos caracteres das teclas:
            alteraCorCaracteresTecladoCEDel(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoParenteses(corPretoCinzaFonteCaracteres)
            
            alteraCorCaracteresTecladoNumerico(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoVirgulaEMaisOuMenos(corPretoCinzaFonteCaracteres)
            
            alteraCorCaracteresTecladoOperacoesSimples01(corBranco)
            alteraCorCaracteresTecladoOperacoesSimples02(corBranco)
            
            alteraCorCaracteresTecladoOperacoesComplexas01(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoOperacoesComplexas02(corPretoCinzaFonteCaracteres)
            
            
            // -------------------
            // BORDA DO TECLADO:
            // -------------------
            
            // Altera a cor e largura da borda do teclado:
            colocaBordaEmTodosOsBotoesTecladoCalculo(corFundoMusk, larguraLinhas: 0.25)
            
            
            
        case "Phantom":
            
            
            // ----------------------------
            // CRIAÇÃO DAS CORES (PHANTOM)
            // ----------------------------
            //
            //
            //
            //
            //
            let corFundoPhantom = UIColor(red:0.18, green:0.19, blue:0.2, alpha:1.0)
            //
            //
            let corCinzaFundoTecladoNumericoPhantom = UIColor(red:0.15, green:0.15, blue:0.16, alpha:1.0)
            
            let corCinzaFundoTecladoOperacoesComplexasPhantom = UIColor(red:0.12, green:0.12, blue:0.12, alpha:1.0)
            
            let corVermelhoFundoTeclaPhamtom = UIColor(red:0.71, green:0.26, blue:0.18, alpha:1.0)
            
            



            
            // ----------------
            // CORES DE FUNDO:
            // ----------------
            
            // Altera a cor da barra de status:
            outletBarraDeStatus.backgroundColor = corPreto.colorWithAlphaComponent(0.2)
            
            
            // Altera a cor de fundo dos botões de configurações:
            aplicaCorDeFundoMenuDeConfiguracoes(corPreto.colorWithAlphaComponent(0.2))
            //aplicaCorDeFundoBotoesConfiguracoes(corFundoPhantom)
            
            
            // Altera a cor de fundo da calculadora:
            mudaCorDeFundoDaCalculadora(corFundoPhantom)
            
            
            // Altera cor de fundo das teclas:
            alteraCorFundoTecladoBotaoCEDel(corCinzaFundoTecladoOperacoesComplexasPhantom, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoParenteses(corCinzaFundoTecladoOperacoesComplexasPhantom, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoNumerico(corCinzaFundoTecladoNumericoPhantom, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoVirgulaEMaisOuMenos(corCinzaFundoTecladoNumericoPhantom, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesSimples01(corVermelhoFundoTeclaPhamtom, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesSimples02(corVermelhoFundoTeclaPhamtom, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesComplexas01(corCinzaFundoTecladoOperacoesComplexasPhantom, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesComplexas02(corCinzaFundoTecladoOperacoesComplexasPhantom, opacidadeDaCor: 1.0)
            
            
            // ---------------------
            // CORES DE CARACTERES:
            // ---------------------
            
            // Altera a cor dos caracteres do menu de opções:
            alteraCorCaracteresMenuDeOpcoesFechado(corBranco)
            alteraCorCaracteresMenuDeOpcoesAberto(corBranco)
            
            // Altera a cor dos botões de memória:
            alteraCorCaractereBotoesMemoria(corBranco)
            
            // Altera a cor dos caracteres de: Resultado Antigo, Resultado Final e Cálculo:
            alteraCorCaracteresResultadosECalculo(corBranco)
            
            // Altera a cor do botão Deg ou Rad:
            outletBotaoDegOuRad.setTitleColor(corBranco, forState: UIControlState.Normal)
            
            // Altera a cor dos caracteres das teclas:
            alteraCorCaracteresTecladoCEDel(corBranco)
            alteraCorCaracteresTecladoParenteses(corBranco)
            
            alteraCorCaracteresTecladoNumerico(corBranco)
            alteraCorCaracteresTecladoVirgulaEMaisOuMenos(corBranco)
            
            alteraCorCaracteresTecladoOperacoesSimples01(corBranco)
            alteraCorCaracteresTecladoOperacoesSimples02(corBranco)
            
            alteraCorCaracteresTecladoOperacoesComplexas01(corBranco)
            alteraCorCaracteresTecladoOperacoesComplexas02(corBranco)
            
            
            // -------------------
            // BORDA DO TECLADO:
            // -------------------
            
            // Altera a cor e largura da borda do teclado:
            colocaBordaEmTodosOsBotoesTecladoCalculo(corPreto, larguraLinhas: 0.25)
            
            
            
        case "Gatsu":
            
            // --------------------------
            // CRIAÇÃO DAS CORES (GATSU)
            // --------------------------
            //
            //
            let corFundoGatsu = UIColor(red:0.11, green:0.12, blue:0.1, alpha:1.0)
            //
            //
            let corCremeFundoTeclaGatsu = UIColor(red:0.99, green:0.96, blue:0.86, alpha:1.0)
            let corVerdeFundoTeclaGatsu = UIColor(red:0.33, green:0.65, blue:0.2, alpha:1.0)
            let corLaranjaFundoTeclaGatsu = UIColor(red:1.0, green:0.3, blue:0.0, alpha:1.0)
            
            
            // ----------------
            // CORES DE FUNDO:
            // ----------------
            
            // Altera a cor da barra de status:
            outletBarraDeStatus.backgroundColor = corPreto.colorWithAlphaComponent(0.2)
            
            
            // Altera a cor de fundo dos botões de configurações:
            aplicaCorDeFundoMenuDeConfiguracoes(corPreto.colorWithAlphaComponent(0.2))
            //aplicaCorDeFundoBotoesConfiguracoes(corPreto.colorWithAlphaComponent(0.2))
            
            
            // Altera a cor de fundo da calculadora:
            mudaCorDeFundoDaCalculadora(corFundoGatsu)
            
            
            // Altera cor de fundo das teclas:
            alteraCorFundoTecladoBotaoCEDel(corCremeFundoTeclaGatsu, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoParenteses(corCremeFundoTeclaGatsu, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoNumerico(corCremeFundoTeclaGatsu, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoVirgulaEMaisOuMenos(corCremeFundoTeclaGatsu, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesSimples01(corCremeFundoTeclaGatsu, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesSimples02(corCremeFundoTeclaGatsu, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesComplexas01(corVerdeFundoTeclaGatsu, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesComplexas02(corLaranjaFundoTeclaGatsu, opacidadeDaCor: 1.0)
            
            
            // ---------------------
            // CORES DE CARACTERES:
            // ---------------------
            
            // Altera a cor dos caracteres do menu de opções:
            alteraCorCaracteresMenuDeOpcoesFechado(corCremeFundoTeclaGatsu)
            alteraCorCaracteresMenuDeOpcoesAberto(corCremeFundoTeclaGatsu)
            
            // Altera a cor dos botões de memória:
            alteraCorCaractereBotoesMemoria(corCremeFundoTeclaGatsu)
            
            // Altera a cor dos caracteres de: Resultado Antigo, Resultado Final e Cálculo:
            alteraCorCaracteresResultadosECalculo(corCremeFundoTeclaGatsu)
            
            // Altera a cor do botão Deg ou Rad:
            outletBotaoDegOuRad.setTitleColor(corCremeFundoTeclaGatsu, forState: UIControlState.Normal)
            
            // Altera a cor dos caracteres das teclas:
            alteraCorCaracteresTecladoCEDel(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoParenteses(corPretoCinzaFonteCaracteres)
            
            alteraCorCaracteresTecladoNumerico(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoVirgulaEMaisOuMenos(corPretoCinzaFonteCaracteres)
            
            alteraCorCaracteresTecladoOperacoesSimples01(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoOperacoesSimples02(corPretoCinzaFonteCaracteres)
            
            alteraCorCaracteresTecladoOperacoesComplexas01(corBranco)
            alteraCorCaracteresTecladoOperacoesComplexas02(corBranco)
            
            
            // -------------------
            // BORDA DO TECLADO:
            // -------------------
            
            // Altera a cor e largura da borda do teclado:
            colocaBordaEmTodosOsBotoesTecladoCalculo(UIColor.blackColor(), larguraLinhas: 0.25)
            
            
            
        case "Apple Classic":
            
            
            // ----------------------------------
            // CRIAÇÃO DAS CORES (APPLE CLASSIC)
            // ----------------------------------
            //
            //
            //
            let corFundoAppleClassic = UIColor(white:0.13, alpha:1.0)
            //
            //
            //
            let corLaranjaFundoTeclaAppleClassic = UIColor(red:0.98, green:0.53, blue:0.06, alpha:1.0)
            let corCinzaMaisClaroFundoTeclaAppleClassic = UIColor(red:0.81, green:0.82, blue:0.83, alpha:1.0)
            let corCinzaMaisEscuroFundoTeclaAppleClassic = UIColor(red:0.76, green:0.77, blue:0.78, alpha:1.0)
            
            
            
            // ----------------
            // CORES DE FUNDO:
            // ----------------
            
            // Altera a cor da barra de status:
            outletBarraDeStatus.backgroundColor = corPreto.colorWithAlphaComponent(0.2)
            
            
            // Altera a cor de fundo dos botões de configurações:
            aplicaCorDeFundoMenuDeConfiguracoes(corPreto.colorWithAlphaComponent(0.2))
            //aplicaCorDeFundoBotoesConfiguracoes(corPreto.colorWithAlphaComponent(0.2))
            
            
            // Altera a cor de fundo da calculadora:
            mudaCorDeFundoDaCalculadora(corFundoAppleClassic)
            
            
            // Altera cor de fundo das teclas:
            alteraCorFundoTecladoBotaoCEDel(corCinzaMaisEscuroFundoTeclaAppleClassic, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoParenteses(corCinzaMaisEscuroFundoTeclaAppleClassic, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoNumerico(corCinzaMaisClaroFundoTeclaAppleClassic, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoVirgulaEMaisOuMenos(corCinzaMaisClaroFundoTeclaAppleClassic, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesSimples01(corLaranjaFundoTeclaAppleClassic, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesSimples02(corLaranjaFundoTeclaAppleClassic, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesComplexas01(corCinzaMaisEscuroFundoTeclaAppleClassic, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesComplexas02(corCinzaMaisEscuroFundoTeclaAppleClassic, opacidadeDaCor: 1.0)
            
            
            // ---------------------
            // CORES DE CARACTERES:
            // ---------------------
            
            // Altera a cor dos caracteres do menu de opções:
            alteraCorCaracteresMenuDeOpcoesFechado(corBranco)
            alteraCorCaracteresMenuDeOpcoesAberto(corBranco)
            
            // Altera a cor dos botões de memória:
            alteraCorCaractereBotoesMemoria(corBranco)
            
            // Altera a cor dos caracteres de: Resultado Antigo, Resultado Final e Cálculo:
            alteraCorCaracteresResultadosECalculo(corBranco)
            
            // Altera a cor do botão Deg ou Rad:
            outletBotaoDegOuRad.setTitleColor(corBranco, forState: UIControlState.Normal)
            
            // Altera a cor dos caracteres das teclas:
            alteraCorCaracteresTecladoCEDel(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoParenteses(corPretoCinzaFonteCaracteres)
            
            alteraCorCaracteresTecladoNumerico(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoVirgulaEMaisOuMenos(corPretoCinzaFonteCaracteres)
            
            alteraCorCaracteresTecladoOperacoesSimples01(corBranco)
            alteraCorCaracteresTecladoOperacoesSimples02(corBranco)
            
            alteraCorCaracteresTecladoOperacoesComplexas01(corPretoCinzaFonteCaracteres)
            alteraCorCaracteresTecladoOperacoesComplexas02(corPretoCinzaFonteCaracteres)
            
            
            // -------------------
            // BORDA DO TECLADO:
            // -------------------
            
            // Altera a cor e largura da borda do teclado:
            colocaBordaEmTodosOsBotoesTecladoCalculo(corFundoAppleClassic, larguraLinhas: 0.25)
            
            
            
        case "Droid":
            
            // ----------------------------------
            // CRIAÇÃO DAS CORES (DROID)
            // ----------------------------------
            //
            //
            //
            //
            let corCinzaEscuroFundoTeclaDroid = UIColor(white:0.26, alpha:1.0)
            let corCinzaClaroFundoTeclaDroid = UIColor(white:0.39, alpha:1.0)
            let corVerdeFundoTeclaDroid = UIColor(red:0.11, green:0.91, blue:0.71, alpha:1.0)
            let corCyanDroid = UIColor(red:0.0, green:0.74, blue:0.83, alpha:1.0)
            
            
            // ----------------
            // CORES DE FUNDO:
            // ----------------
            
            // Altera a cor da barra de status:
            outletBarraDeStatus.backgroundColor = corCyanDroid
            
            
            // Altera a cor de fundo dos botões de configurações:
            aplicaCorDeFundoMenuDeConfiguracoes(corCyanDroid)
            //aplicaCorDeFundoBotoesConfiguracoes(corCyanDroid)
            
            
            // Altera a cor de fundo da calculadora:
            mudaCorDeFundoDaCalculadora(corBranco)
            
            
            // Altera cor de fundo das teclas:
            alteraCorFundoTecladoBotaoCEDel(corCinzaClaroFundoTeclaDroid, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoParenteses(corCinzaClaroFundoTeclaDroid, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoNumerico(corCinzaEscuroFundoTeclaDroid, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoVirgulaEMaisOuMenos(corCinzaEscuroFundoTeclaDroid, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesSimples01(corCinzaEscuroFundoTeclaDroid, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesSimples02(corCinzaEscuroFundoTeclaDroid, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesComplexas01(corVerdeFundoTeclaDroid, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesComplexas02(corVerdeFundoTeclaDroid, opacidadeDaCor: 1.0)
            
            
            // ---------------------
            // CORES DE CARACTERES:
            // ---------------------
            
            // Altera a cor dos caracteres do menu de opções:
            alteraCorCaracteresMenuDeOpcoesFechado(corCinzaEscuroFundoTeclaDroid)
            alteraCorCaracteresMenuDeOpcoesAberto(UIColor.whiteColor())
            
            // Altera a cor dos botões de memória:
            alteraCorCaractereBotoesMemoria(corCinzaEscuroFundoTeclaDroid)
            
            // Altera a cor dos caracteres de: Resultado Antigo, Resultado Final e Cálculo:
            alteraCorCaracteresResultadosECalculo(corCinzaEscuroFundoTeclaDroid)
            
            // Altera a cor do botão Deg ou Rad:
            outletBotaoDegOuRad.setTitleColor(corCinzaEscuroFundoTeclaDroid, forState: UIControlState.Normal)
            
            // Altera a cor dos caracteres das teclas:
            alteraCorCaracteresTecladoCEDel(corBranco)
            alteraCorCaracteresTecladoParenteses(corBranco)
            
            alteraCorCaracteresTecladoNumerico(corBranco)
            alteraCorCaracteresTecladoVirgulaEMaisOuMenos(corBranco)
            
            alteraCorCaracteresTecladoOperacoesSimples01(corBranco)
            alteraCorCaracteresTecladoOperacoesSimples02(corBranco)
            
            alteraCorCaracteresTecladoOperacoesComplexas01(corCinzaEscuroFundoTeclaDroid)
            alteraCorCaracteresTecladoOperacoesComplexas02(corCinzaEscuroFundoTeclaDroid)
            
            
            // -------------------
            // BORDA DO TECLADO:
            // -------------------
            
            // Altera a cor e largura da borda do teclado:
            colocaBordaEmTodosOsBotoesTecladoCalculo(corBranco, larguraLinhas: 0.0)

            
            
        case "Revolutionary Girl":
            
            // ---------------------------------------
            // CRIAÇÃO DAS CORES (REVOLUTIONARY GIRL)
            // ---------------------------------------
            //
            //
            //
            let corFundoRevolutionaryGirl = UIColor.whiteColor()
            //
            //
            let corRozaFundoTecladoRevolutionaryGirl = UIColor(red:0.91, green:0.12, blue:0.39, alpha:1.0)
            let corVerdeFundoTeclaRevolutionaryGirl = UIColor(red:0.26, green:0.63, blue:0.28, alpha:1.0)
            let corRoxoFundoTeclaRevolutionaryGirl = UIColor(red:0.29, green:0.08, blue:0.55, alpha:1.0)
            let corLaranjaFundoTeclaRevolutionaryGirl = UIColor(red:0.94, green:0.42, blue:0.0, alpha:1.0)
            let corCinzaCaractereRevolutionaryGirl = UIColor(white:0.26, alpha:1.0)
            
            
            
            // ----------------
            // CORES DE FUNDO:
            // ----------------
            
            // Altera a cor da barra de status:
            outletBarraDeStatus.backgroundColor = corCinzaCaractereRevolutionaryGirl
            
            // Altera a cor de fundo dos botões de configurações:
            aplicaCorDeFundoMenuDeConfiguracoes(corCinzaCaractereRevolutionaryGirl)
            
            // Altera a cor de fundo da calculadora:
            mudaCorDeFundoDaCalculadora(corFundoRevolutionaryGirl)            
            
            // Altera cor de fundo das teclas:
            alteraCorFundoTecladoBotaoCEDel(corVerdeFundoTeclaRevolutionaryGirl, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoParenteses(corRoxoFundoTeclaRevolutionaryGirl, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoNumerico(corRozaFundoTecladoRevolutionaryGirl, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoVirgulaEMaisOuMenos(corRozaFundoTecladoRevolutionaryGirl, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesSimples01(UIColor(red:0.61, green:0.15, blue:0.69, alpha:1.0), opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesSimples02(UIColor(red:0.42, green:0.11, blue:0.6, alpha:1.0), opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesComplexas01(UIColor(red:0.01, green:0.61, blue:0.9, alpha:1.0), opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesComplexas02(corLaranjaFundoTeclaRevolutionaryGirl, opacidadeDaCor: 1.0)
            
            
            // ---------------------
            // CORES DE CARACTERES:
            // ---------------------
            
            // Altera a cor dos caracteres do menu de opções:
            alteraCorCaracteresMenuDeOpcoesFechado(UIColor(white:0.38, alpha:1.0))
            alteraCorCaracteresMenuDeOpcoesAberto(UIColor.whiteColor())
            
            // Altera a cor dos botões de memória:
            alteraCorCaractereBotoesMemoria(corCinzaCaractereRevolutionaryGirl)
            
            // Altera a cor dos caracteres de: Resultado Antigo, Resultado Final e Cálculo:
            alteraCorCaracteresResultadosECalculo(corCinzaCaractereRevolutionaryGirl)
            
            // Altera a cor do botão Deg ou Rad:
            outletBotaoDegOuRad.setTitleColor(UIColor(white:0.38, alpha:1.0), forState: UIControlState.Normal)
            
            // Altera a cor dos caracteres das teclas:
            alteraCorCaracteresTecladoCEDel(UIColor.whiteColor())
            alteraCorCaracteresTecladoParenteses(UIColor.whiteColor())
            
            alteraCorCaracteresTecladoNumerico(UIColor.whiteColor())
            alteraCorCaracteresTecladoVirgulaEMaisOuMenos(UIColor.whiteColor())
            
            alteraCorCaracteresTecladoOperacoesSimples01(UIColor.whiteColor())
            alteraCorCaracteresTecladoOperacoesSimples02(UIColor.whiteColor())
            
            alteraCorCaracteresTecladoOperacoesComplexas01(UIColor.whiteColor())
            alteraCorCaracteresTecladoOperacoesComplexas02(UIColor.whiteColor())
            
            
            // -------------------
            // BORDA DO TECLADO:
            // -------------------
            
            // Altera a cor e largura da borda do teclado:
            colocaBordaEmTodosOsBotoesTecladoCalculo(UIColor.whiteColor().colorWithAlphaComponent(0.3), larguraLinhas: 0.25)
           
        case "Minimal Paper":
            
            // ----------------
            // CORES DE FUNDO:
            // ----------------
            
            // Altera a cor da barra de status:
            outletBarraDeStatus.backgroundColor = UIColor(white:0.46, alpha:1.0)
            
            
            // Altera a cor de fundo dos botões de configurações:
            
            aplicaCorDeFundoMenuDeConfiguracoes(UIColor(white:0.46, alpha:1.0))
            //aplicaCorDeFundoBotoesConfiguracoes(UIColor(white:0.46, alpha:1.0))
            
            
            // Altera a cor de fundo da calculadora:
            mudaCorDeFundoDaCalculadora(UIColor.whiteColor())
            
            
            // Altera cor de fundo das teclas:
            alteraCorFundoTecladoBotaoCEDel(UIColor.whiteColor(), opacidadeDaCor: 1.0)
            alteraCorFundoTecladoParenteses(UIColor.whiteColor(), opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoNumerico(UIColor.whiteColor(), opacidadeDaCor: 1.0)
            alteraCorFundoTecladoVirgulaEMaisOuMenos(UIColor.whiteColor(), opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesSimples01(UIColor.whiteColor(), opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesSimples02(UIColor.whiteColor(), opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesComplexas01(UIColor.whiteColor(), opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesComplexas02(UIColor.whiteColor(), opacidadeDaCor: 1.0)
            
            
            // ---------------------
            // CORES DE CARACTERES:
            // ---------------------
            
            // Altera a cor dos caracteres do menu de opções:
            alteraCorCaracteresMenuDeOpcoesFechado(UIColor(white:0.26, alpha:1.0))
            alteraCorCaracteresMenuDeOpcoesAberto(UIColor.whiteColor())
            
            // Altera a cor dos botões de memória:
            alteraCorCaractereBotoesMemoria(UIColor(white:0.26, alpha:1.0))
            
            // Altera a cor dos caracteres de: Resultado Antigo, Resultado Final e Cálculo:
            alteraCorCaracteresResultadosECalculo(UIColor(white:0.26, alpha:1.0))
            
            // Altera a cor do botão Deg ou Rad:
            outletBotaoDegOuRad.setTitleColor(UIColor(white:0.26, alpha:1.0), forState: UIControlState.Normal)
            
            // Altera a cor dos caracteres das teclas:
            alteraCorCaracteresTecladoCEDel(UIColor(red:0.91, green:0.12, blue:0.39, alpha:1.0))
            alteraCorCaracteresTecladoParenteses(UIColor(red:0.61, green:0.15, blue:0.69, alpha:1.0))
            
            alteraCorCaracteresTecladoNumerico(UIColor(white:0.26, alpha:1.0))
            alteraCorCaracteresTecladoVirgulaEMaisOuMenos(UIColor(red:0.41, green:0.62, blue:0.22, alpha:1.0))
            
            alteraCorCaracteresTecladoOperacoesSimples01(UIColor(red:0.96, green:0.26, blue:0.21, alpha:1.0))
            alteraCorCaracteresTecladoOperacoesSimples02(UIColor(red:0.96, green:0.26, blue:0.21, alpha:1.0))
            
            alteraCorCaracteresTecladoOperacoesComplexas01(UIColor(red:0.0, green:0.59, blue:0.53, alpha:1.0))
            alteraCorCaracteresTecladoOperacoesComplexas02(UIColor(red:0.25, green:0.32, blue:0.71, alpha:1.0))
            
            
            // -------------------
            // BORDA DO TECLADO:
            // -------------------
            
            // Altera a cor e largura da borda do teclado:
            colocaBordaEmTodosOsBotoesTecladoCalculo(UIColor(white:0.74, alpha:1.0), larguraLinhas: 0.25)
            
            
        case "細い":
            
            
            // ----------------------------
            // CRIAÇÃO DAS CORES (細い)
            // ----------------------------
            //
            
            let corBarraDeStatus = UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0)
            
            let corMenuOpcoesAberto = UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0)
            
            let corDeFundo = UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0)

            
            let corBotaoC = UIColor(red:0.64, green:0.84, blue:0.53, alpha:1.0)
            let corBotaoDel = UIColor(red:0.74, green:0.35, blue:0.33, alpha:1.0)
            
            let corParenteses = UIColor(red:0.34, green:0.66, blue:0.8, alpha:1.0)
                        
            let corTecladoNumerico = UIColor(white:0.87, alpha:1.0)
            
            let corTecladoVirgulaEMaisOuMenos = UIColor(white:0.87, alpha:1.0)
            
            let corOperacoesSimples01 = UIColor(white:0.87, alpha:1.0)
            let corOperacoesSimples02 = UIColor(red:0.57, green:0.59, blue:0.62, alpha:1.0)
            
            let corOperacoesComplexas01 = UIColor(red:0.93, green:0.72, blue:0.51, alpha:1.0)
            let corOperacoesComplexas02 = UIColor(red:0.93, green:0.72, blue:0.51, alpha:1.0)

            
            
            // ----------------
            // CORES DE FUNDO:
            // ----------------
            
            // Altera a cor da barra de status:
            outletBarraDeStatus.backgroundColor = corBarraDeStatus
            
            
            // Altera a cor de fundo dos botões de configurações:
            aplicaCorDeFundoMenuDeConfiguracoes(corMenuOpcoesAberto)
            
            
            // Altera a cor de fundo da calculadora:
            mudaCorDeFundoDaCalculadora(corDeFundo)
            
            
            // Altera cor de fundo das teclas:
            colocaCorDeFundoEmUmBotao(cOutlet, cor: corBotaoC, opacidadeDaCor: 1.0)
            colocaCorDeFundoEmUmBotao(delOutlet, cor: corBotaoDel, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoParenteses(corParenteses, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoNumerico(corTecladoNumerico, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoVirgulaEMaisOuMenos(corTecladoVirgulaEMaisOuMenos, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesSimples01(corOperacoesSimples01, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesSimples02(corOperacoesSimples02, opacidadeDaCor: 1.0)
            
            alteraCorFundoTecladoOperacoesComplexas01(corOperacoesComplexas01, opacidadeDaCor: 1.0)
            alteraCorFundoTecladoOperacoesComplexas02(corOperacoesComplexas02, opacidadeDaCor: 1.0)
            
            
            // ---------------------
            // CORES DE CARACTERES:
            // ---------------------
            
            let corCaracteresMenuOpcoesFechado = UIColor(white:0.87, alpha:1.0)
            let corCaracteresMenuOpcoesAberto = UIColor(white:0.87, alpha:1.0)
            
            let corCaractereUltimoResultadoEMemoria = UIColor(white:0.87, alpha:1.0)
            let corCaractereResultadoFinalECalculo = UIColor(white:0.87, alpha:1.0)
            
            let corCaractereBotaoGraRad = UIColor(white:0.87, alpha:1.0)
            
            // Altera a cor dos caracteres do menu de opções:
            alteraCorCaracteresMenuDeOpcoesFechado(corCaracteresMenuOpcoesFechado)
            alteraCorCaracteresMenuDeOpcoesAberto(corCaracteresMenuOpcoesAberto)
            
            // Altera a cor dos botões de memória:
            alteraCorCaractereBotoesMemoria(corCaractereUltimoResultadoEMemoria)
            
            // Altera a cor dos caracteres de: Resultado Antigo, Resultado Final e Cálculo:
            alteraCorCaracteresResultadosECalculo(corCaractereResultadoFinalECalculo)
            
            // Altera a cor do botão Deg ou Rad:
            outletBotaoDegOuRad.setTitleColor(corCaractereBotaoGraRad, forState: UIControlState.Normal)
            
            // Altera a cor dos caracteres das teclas:
            alteraCorCaracteresTecladoCEDel(UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0))
            alteraCorCaracteresTecladoParenteses(UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0))
            
            alteraCorCaracteresTecladoNumerico(UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0))
            alteraCorCaracteresTecladoVirgulaEMaisOuMenos(UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0))
            
            alteraCorCaracteresTecladoOperacoesSimples01(UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0))
            alteraCorCaracteresTecladoOperacoesSimples02(corBranco)
            
            alteraCorCaracteresTecladoOperacoesComplexas01(UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0))
            alteraCorCaracteresTecladoOperacoesComplexas02(UIColor(red:0.1, green:0.11, blue:0.13, alpha:1.0))
            
            
            // -------------------
            // BORDA DO TECLADO:
            // -------------------
            
            // Altera a cor e largura da borda do teclado:
            colocaBordaEmTodosOsBotoesTecladoCalculo(UIColor.blackColor().colorWithAlphaComponent(0.5), larguraLinhas: 0.25)
            
            
        default:
            viewPrincipal.backgroundColor = corPreto
        }
    }
    
    
} // Fim extension ViewController












