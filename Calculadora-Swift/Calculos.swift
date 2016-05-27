//
//  Calculos.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import UIKit

extension ViewController {
    
    /**
     
     Retorna o resultado final ou um excessão.
    
     - Parâmetros: Expressão Matemática (String).
     - Retorna: Resultado Final (Double).
     
    */
    func resolveExpressaoMatematicaValidaECompleta(expressaoValidaECompleta: String) throws -> Double {
        
        return NSExpression(format: expressaoValidaECompleta).expressionValueWithObject(nil, context: nil) as! Double
        
    }
    
    
    /**
     
     Tenta resolver uma expressão matemática válida, retornando uma mensagem de erro em caso de falha.
     
     - Parâmetros: Expressão Matemática Válida e Completa (String).
     - Retorna: Resultado (String).
     
    */
    func tentaResolverExpressaoMatematicaValida(expressaoValidaECompleta: String) -> String {
        
        var resultado: Double
        
        do {
            
            resultado = try resolveExpressaoMatematicaValidaECompleta(expressaoValidaECompleta)
            
        } catch {
            
            return dicionarioMensagemDeErro[idioma]!
            
        }
        
        return String(resultado)        
    }
    
        
    /**
     
     Prepara a operação matemática e obtém o resultado final.
     
     - Parâmetros: Expressão Matemática (String).
     - Retorna: Resultado Final (String).
     
    */
    func preparaEResolveExpressaoMatematica(operacao: String) -> String {
        
        let operacaoValidaECompleta = garanteExpressaoMatematicaFormatadaECompleta(operacao)
        
        var resultadoFinal = tentaResolverExpressaoMatematicaValida(operacaoValidaECompleta)
                        
        resultadoFinal = formataResultadoFinal(resultadoFinal)
        
        return resultadoFinal
    }
    
    /**
     
     Formata o resultado final.
     
     - Parâmetros: Resultado Final.
     - Retorna: Resultado final formatado.
     
    */
    func formataResultadoFinal(resultadoFinal: String) -> String {
        
        var resultadoFinalFormatado = resultadoFinal
        
        resultadoFinalFormatado = arredondaResultadoFinal(resultadoFinalFormatado)
        resultadoFinalFormatado = trocaPontoPorVirgula(resultadoFinalFormatado)
        resultadoFinalFormatado = formataInf(resultadoFinalFormatado)
        resultadoFinalFormatado = removePontoZeroDeValorSeNecessario(resultadoFinalFormatado)
        
        return resultadoFinalFormatado
    }
                            
} // Fim extension ViewController







