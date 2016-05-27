//
//  ArmazenamentoLocal.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import Foundation

extension ViewController {
    
    // ____________--------------------------____________
    // ------------         SALVAR           ------------
    // ____________--------------------------____________
    
    /**
     
     Armazena localmente o dicionário de histórico de suas linhas do tempo.
     
     - Parâmetros: dicionário de histórico e linhas do tempo. [String:AnyObject]
     - Retorna: Nada.
     
    */
    func armazenaHistoricoELinhasDoTempo(historicoELinhasDoTempo: [String:AnyObject]) {
        let chaveDeArmazenamento = NSUserDefaults.standardUserDefaults()
        chaveDeArmazenamento.setObject(historicoELinhasDoTempo, forKey: chavesDeArmazenamentoLocal.chaveHistoricoELinhasDoTempo)
    }
    
    /**
     
     Armazena localmente o dicionário de configurações do menu de mais opções.
     
     - Parâmetros: Dicionário de configurações do menu de mais opções. [String:AnyObject]
     - Retorna: Nada.
     
    */
    func armazenaConfiguracoesUsuario(configuracoesDoUsuario: [String:AnyObject]) {
        let chaveDeArmazenamento = NSUserDefaults.standardUserDefaults()
        chaveDeArmazenamento.setObject(configuracoesDoUsuario, forKey: chavesDeArmazenamentoLocal.chaveConfiguracoesUsuario)
    }
    
    /**
     
     Armazena localmente o dicionário de último estado da calculadora.
     
     - Parâmetros: Dicionário de último estado. [String:AnyObject]
     - Retorna: Nada.
     
    */
    func armazenaUltimoEstadoCalculadora(ultimoEstadoCalculadora: [String:AnyObject]) {                
        let chaveDeArmazenamento = NSUserDefaults.standardUserDefaults()
        chaveDeArmazenamento.setObject(ultimoEstadoCalculadora, forKey: chavesDeArmazenamentoLocal.chaveUltimoEstadoCalculadora)
    }
    
    /**
     
     Armazena localmente o nome do tema de cor da calculadora.
     
     - Parâmetros: Nome do Tema. (String)
     - Retorna: Nada.
     
    */
    func armazenaCorDaCalculadora(corDaCalculadora: String) {
        
        let chaveDeArmazenamento = NSUserDefaults.standardUserDefaults()
        
        chaveDeArmazenamento.setValue(corDaCalculadora, forKey: chavesDeArmazenamentoLocal.chaveCorDaCalculadora)
        
    }
    
    
    // ____________--------------------------_____________
    // ------------         CARREGAR         -------------
    // ____________--------------------------_____________
    
    
    /**
     
     Carrega o histórico e suas linhas do tempo.
     
     - Parâmetros: Nenhum.
     - Retorna: Dicionário de histórico e linhas do tempo. [String:AnyObject]
     
    */
    func carregaERetornaHistoricoELinhasDotempo() -> [String:AnyObject] {
        
        let chaveDeArmazenamento = NSUserDefaults.standardUserDefaults()
        
        if let historicoELinhasDoTempo = chaveDeArmazenamento.dictionaryForKey(chavesDeArmazenamentoLocal.chaveHistoricoELinhasDoTempo) {
            return historicoELinhasDoTempo
        } else {
            return dicionarioHistoricoELinhasDoTempoInicial
        }
        
    }
    
    
    /**
     
     Carrega as configurações do menu de mais opções.
     
     - Parâemtros: Nenhum.
     - Retorna: Dicionário de configurações do menu de mais opções. [String:AnyObject]
     
    */
    func carregaERetornaConfiguracoesDoUsuario() -> [String:AnyObject] {
        
        let chaveDeArmazenamento = NSUserDefaults.standardUserDefaults()
        
        if let configuracoesDoUsuario = chaveDeArmazenamento.dictionaryForKey(chavesDeArmazenamentoLocal.chaveConfiguracoesUsuario)  {
            return configuracoesDoUsuario
        } else {
            return dicionarioOpcoesPadraoDoUsuario
        }
        
    }
    
    
    /**
     
     Carrega o último estado da calculadora.
     
     - Parâmetros: Nenhum.
     - Retorna: Último estado da calculadora. [String:AnyObject]
     
    */
    func carregaUltimoEstadoCalculadora() -> [String:AnyObject] {
        
        let chaveDeArmazenamento = NSUserDefaults.standardUserDefaults()
        
        if let ultimoEstadoCalculadora = chaveDeArmazenamento.dictionaryForKey(chavesDeArmazenamentoLocal.chaveUltimoEstadoCalculadora) {
            return ultimoEstadoCalculadora
        } else {
            return dicionarioEstadoInicialDaCalculadora
        }
        
    }
    
    
    /**
     
     Carrega o tema de cor.
     
     - Parâmetros: Nenhum.
     - Retorna: Tema de cor. (String)
     
    */
    func carregaERetornaTemaDaCalculadora() -> String {
        
        let chaveDeArmazenamento = NSUserDefaults.standardUserDefaults()
        
        // Caso já exista um tema salvo...
        if let corCalculadora = chaveDeArmazenamento.stringForKey(chavesDeArmazenamentoLocal.chaveCorDaCalculadora) {
            
            return corCalculadora
        
        // ... Caso contrário:
        } else {
            
            return nomeTemaDeCorPadrao
            
        }
    }
        
} // Fim extension ViewController













