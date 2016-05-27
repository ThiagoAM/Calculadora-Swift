//
//  VerificaECorrige.swift
//  Calculadora-Swift
//
//  Criado por Thiago Anderson Martins em 11/01/2016.
//
//  thianmaru@icloud.com


import Foundation
import UIKit

extension ViewController {
    
    /**
     
     Aceita ou ignora uma entrada do usuário.
     
     - Parâmetros: Entrada mais recente do usuário.
     - Retorna: Nada.
     
     */
    func filtraExpressaoMatematicaInvalida(novaEntrada: String) {
        
        var impedeAtualizacaoDaLinhaDoTempo = false
        
        // Entrada é número:
        if caractereENumero(novaEntrada.characters.last) == true {
            
            if outletLabelExpressaoMatematica.text!.characters.last != ")" && outletLabelExpressaoMatematica.text!.characters.last != "!" {
                
                outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                
            }
            
        // Entrada não é número:
        } else {
            
            if novaEntrada == "(" {
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == false && outletLabelExpressaoMatematica.text!.characters.last != "," && outletLabelExpressaoMatematica.text!.characters.last != ")" && outletLabelExpressaoMatematica.text!.characters.last != "!" {
                    
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                    
                }
                
            } else if novaEntrada == ")" {
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true || outletLabelExpressaoMatematica.text!.characters.last == ")" || outletLabelExpressaoMatematica.text!.characters.last == "!" {
                    
                    if /*contadorDeParenteses > 0*/ contaParentesesDeExpressao(outletLabelExpressaoMatematica.text!) > 0 {
                        
                        colocaPontoEZeroCalculoSeNecessario()
                        
                        outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                        
                    }
                }
                
            } else if novaEntrada == "( )" {
                                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true || outletLabelExpressaoMatematica.text!.characters.last == ")" || outletLabelExpressaoMatematica.text!.characters.last == "!" {
                    colocaPontoEZeroCalculoSeNecessario()
                    outletLabelExpressaoMatematica.text = "(" + outletLabelExpressaoMatematica.text! + ")"
                }
                
            } else if novaEntrada == "!" {
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true || outletLabelExpressaoMatematica.text!.characters.last == ")" {
                    colocaPontoEZeroCalculoSeNecessario()
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                }
                
            } else if novaEntrada == "π" {
                
                if outletLabelExpressaoMatematica.text!.isEmpty == true {
                    outletLabelExpressaoMatematica.text = π
                } else if outletLabelExpressaoMatematica.text!.characters.last != ")" && caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == false && outletLabelExpressaoMatematica.text!.characters.last != "!" {
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + π
                }
                
            } else if novaEntrada == "e" {
                
                if outletLabelExpressaoMatematica.text!.isEmpty == true {
                    outletLabelExpressaoMatematica.text = e
                } else if outletLabelExpressaoMatematica.text!.characters.last != ")" && caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == false && outletLabelExpressaoMatematica.text!.characters.last != "!" {
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + e
                }
                
            } else if novaEntrada == "rand" {
                
                let numeroAleatorio = String(Double(arc4random()) / 0xFFFFFFFF).stringByReplacingOccurrencesOfString(".", withString: ",")
                
                if outletLabelExpressaoMatematica.text!.isEmpty == true {
                    outletLabelExpressaoMatematica.text = numeroAleatorio
                } else if outletLabelExpressaoMatematica.text!.characters.last != ")" && caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == false && outletLabelExpressaoMatematica.text!.characters.last != "!" {
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + numeroAleatorio
                }
                
            } else if novaEntrada == "^" {
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true || outletLabelExpressaoMatematica.text!.characters.last == "!" || outletLabelExpressaoMatematica.text!.characters.last == ")" {
                    colocaPontoEZeroCalculoSeNecessario()
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                }
                
            } else if novaEntrada == "±" {
                
                impedeAtualizacaoDaLinhaDoTempo = true
                
                if outletLabelExpressaoMatematica.text!.characters.first != "-" {
                    outletLabelExpressaoMatematica.text = "-" + outletLabelExpressaoMatematica.text!
                } else {
                    outletLabelExpressaoMatematica.text = String(outletLabelExpressaoMatematica.text!.characters.dropFirst())
                }
                
            } else if novaEntrada == "%" {
                
                var operacaoMatematicaPorCento = String()
                
                if verificaSeModoPorCentoClassicoEstaAtivado() == true {
                    operacaoMatematicaPorCento = "÷100"
                } else {
                    operacaoMatematicaPorCento = "%"
                }
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true || outletLabelExpressaoMatematica.text!.characters.last == ")" || outletLabelExpressaoMatematica.text!.characters.last == "!" {
                    colocaPontoEZeroCalculoSeNecessario()
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + operacaoMatematicaPorCento
                }
                
            } else if novaEntrada == "," {
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true {
                    
                    if verificaSeVirgulaEstaEmUso(outletLabelExpressaoMatematica.text!) == false  {
                        outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                    }
                    
                } else {
                    
                    if outletLabelExpressaoMatematica.text!.characters.last != "," && outletLabelExpressaoMatematica.text!.characters.last != "!" && outletLabelExpressaoMatematica.text!.characters.last != ")" {
                        outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + "0" + novaEntrada
                    }
                }
                
            } else if novaEntrada == "-" {
                
                if outletLabelExpressaoMatematica.text!.characters.last != "," {
                    if outletLabelExpressaoMatematica.text!.characters.last == "+" {
                        
                        impedeAtualizacaoDaLinhaDoTempo = true
                        
                        apagaTodasAsUltimasOperacoesCalculo()
                        outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                        
                    } else if outletLabelExpressaoMatematica.text!.characters.last == "-" {
                        
                        impedeAtualizacaoDaLinhaDoTempo = true
                        
                        outletLabelExpressaoMatematica.text = String(outletLabelExpressaoMatematica.text!.characters.dropLast())
                        
                        if caractereEOperacao(outletLabelExpressaoMatematica.text!.characters.last) == false && outletLabelExpressaoMatematica.text!.isEmpty == false {
                            outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + "+"
                        }
                        
                    } else if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true {
                        colocaPontoEZeroCalculoSeNecessario()
                        outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                    } else {
                        outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                    }
                }
                
            } else if novaEntrada == "ˣ√" {
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true {
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + "nth_root" + "("
                    //contadorDeParenteses += 1
                }
                
            } else if novaEntrada == "xlog" {
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true {
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + "xlog" + "("
                    //contadorDeParenteses += 1
                }
                
            } else if novaEntrada == "log" {
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true || outletLabelExpressaoMatematica.text!.characters.last == ")" || outletLabelExpressaoMatematica.text!.characters.last == "!" {
                    colocaPontoEZeroCalculoSeNecessario()
                    outletLabelExpressaoMatematica.text = "log₁₀" + "(" + outletLabelExpressaoMatematica.text! + ")"
                } else if outletLabelExpressaoMatematica.text!.characters.last != "," {
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! +  "log₁₀" + "("
                    //contadorDeParenteses += 1
                }
                
            } else if novaEntrada == "√" || novaEntrada == "cos" || novaEntrada == "sin" || novaEntrada == "tan" || novaEntrada == "ln" || novaEntrada == "cosh" || novaEntrada == "sinh" || novaEntrada == "tanh" || novaEntrada == "acos" || novaEntrada == "asin" || novaEntrada == "atan" || novaEntrada == "acosh" || novaEntrada == "asinh" || novaEntrada == "atanh" {
                
                if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true || outletLabelExpressaoMatematica.text!.characters.last == ")" || outletLabelExpressaoMatematica.text!.characters.last == "!" {
                    colocaPontoEZeroCalculoSeNecessario()
                    outletLabelExpressaoMatematica.text = novaEntrada + "(" + outletLabelExpressaoMatematica.text! + ")"
                } else if outletLabelExpressaoMatematica.text!.characters.last != "," {
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! +  novaEntrada + "("
                    //contadorDeParenteses += 1
                }
                
            } else if novaEntrada == "φ" {
              
                if outletLabelExpressaoMatematica.text!.isEmpty == true {
                    outletLabelExpressaoMatematica.text = φ
                } else if outletLabelExpressaoMatematica.text!.characters.last != ")" && caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == false && outletLabelExpressaoMatematica.text!.characters.last != "!" {
                    outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + φ
                }
                
            } else {
                
                if outletLabelExpressaoMatematica.text!.isEmpty == false {
                    if caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true || outletLabelExpressaoMatematica.text!.characters.last == ")" || outletLabelExpressaoMatematica.text!.characters.last == "!" {
                        colocaPontoEZeroCalculoSeNecessario()
                        outletLabelExpressaoMatematica.text = outletLabelExpressaoMatematica.text! + novaEntrada
                    }
                }
            }
            
        } // Fim de 'Entrada não é número:'
        
        if impedeAtualizacaoDaLinhaDoTempo == false {
            atualizaLinhaDoTempoDoCalculo()
        }
        
        verificaEAlteraStatusBotaoC()
    } // Fim func filtraExpressaoMatematicaInvalida
    
    
    
    
    /**
     
     Formata expressões fatorias para que seja possível resolver elas (trocando 'x!' por 'function(x, 'fatorial')).
     
     - Parâmetros: Operação sem formatação.
     - Retorna: Operação formatada.
     
    */
    func formataExpressaoFatorialCorretamente(operacaoOriginal: String) -> String {
        
        var operacao = operacaoOriginal
        
        while operacao.containsString("!") == true {
            
            if let indexDoFatorial = operacao.characters.indexOf("!") {
                
                var indexDoInicioOuUltimaOperacaoAntesDoFatorial = indexDoFatorial.predecessor()
                var valorFatorial: String = ""
                var encontrouExpressaoFatorial = false
                var expressaoTemParenteses = false
                var contadorDeParentesesFatorial: Int = 0
                
                while encontrouExpressaoFatorial == false {
                    
                    // Adiciona o próximo valor ao ValorFatorial:
                    valorFatorial = valorFatorial + String(operacao[indexDoInicioOuUltimaOperacaoAntesDoFatorial])
                    
                    // Caso o ponteiro anterior seja StartIndex, break no while!
                    if indexDoInicioOuUltimaOperacaoAntesDoFatorial == operacao.startIndex {
                        break
                    }
                    
                    // Conta os parênteses:
                    if operacao[indexDoInicioOuUltimaOperacaoAntesDoFatorial] == ")" {
                        expressaoTemParenteses = true
                        contadorDeParentesesFatorial -= 1
                        
                    } else if operacao[indexDoInicioOuUltimaOperacaoAntesDoFatorial] == "(" {
                        contadorDeParentesesFatorial += 1
                    }
                    
                    // Caso expressão NÃO TENHA parênteses:
                    if expressaoTemParenteses == false {
                        
                        // Se caractere anterior ao atual for uma operação matemática (+, -, etc..) OU um Abre Parênteses -> Encontrou Expressão!
                        if  caractereEOperacao(operacao[indexDoInicioOuUltimaOperacaoAntesDoFatorial.predecessor()]) == true || operacao[indexDoInicioOuUltimaOperacaoAntesDoFatorial.predecessor()] == "(" {
                            encontrouExpressaoFatorial = true
                        }
                        
                    // Caso expressão TENHA parênteses:
                    } else {
                        
                        // Se o contador de parênteses for zero (Todos os parenteses já foram achados):
                        if contadorDeParentesesFatorial == 0 {
                            
                            // Se o caractere anterior ao atual for uma operação matemática -> Encontrou Expressão!
                            if  caractereEOperacao(operacao[indexDoInicioOuUltimaOperacaoAntesDoFatorial.predecessor()]) == true {
                                encontrouExpressaoFatorial = true
                            }
                            
                            // Como todos os parenteses já foram encontrados, caso o caractere anterior seja um parenteses aberto -> Encontrou Expressão!
                            if operacao[indexDoInicioOuUltimaOperacaoAntesDoFatorial.predecessor()] == "(" {
                                encontrouExpressaoFatorial = true
                            }
                        }
                    }
                    
                    // Move o ponteiro para o proximo index!
                    indexDoInicioOuUltimaOperacaoAntesDoFatorial = indexDoInicioOuUltimaOperacaoAntesDoFatorial.predecessor()
                    
                } // Fim 2º While
                
                valorFatorial = String(valorFatorial.characters.reverse())
                let operacaoFatorialASerSubistituida = valorFatorial + String(operacao[indexDoFatorial])
                operacao = operacao.stringByReplacingOccurrencesOfString(operacaoFatorialASerSubistituida, withString: "function(" + valorFatorial + ", 'calculaFatorial')")
            }
        } // Fim 1º While
        return operacao
    }
    
    
    /**
     
     Formata expressões para que elas possam ser resolvidas pelas funções especiais (Extensões do tipo NSNumber).
     
     - Parâmetros: Operação Completa e Tipo da Função.
     - Retorno: Operação corretamente formatada.
     
    */
    func formataExpressaoComFuncaoEspecial(operacaoCompletaOriginal: String, funcao: String) -> String {
        
        var operacaoCompleta = operacaoCompletaOriginal
    
        let nomeDaFuncao = encontraNomeDeFuncaoSemParametroPelaAbreviatura(funcao)
        
        operacaoCompleta = operacaoCompleta.stringByReplacingOccurrencesOfString(funcao + "(", withString: "ƒ(")
    
        // Enquanto OperacaoCompleta conter ƒ:
        while operacaoCompleta.containsString("ƒ") == true {
            
            // Variáveis:
            let indexDoInicioDaExpressaoASerResolvida = operacaoCompleta.characters.indexOf("ƒ")!
            var indexDoInicioAoFimExpressao = indexDoInicioDaExpressaoASerResolvida
            var contadorDeParentesesExpressaoASerResolvida: Int = 0
            var estaNoPrimeiroLoopDoSegundoWhile = true
            var encontrouExpressaoCompleta = false
            var operacaoASerSubstituida: String = ""
            
            // Enquanto não econtrar a expressão completa...
            while encontrouExpressaoCompleta == false {
                operacaoASerSubstituida = operacaoASerSubstituida + String(operacaoCompleta[indexDoInicioAoFimExpressao])
                if operacaoCompleta[indexDoInicioAoFimExpressao] == "(" {
                    contadorDeParentesesExpressaoASerResolvida += 1
                } else if operacaoCompleta[indexDoInicioAoFimExpressao] == ")" {
                    contadorDeParentesesExpressaoASerResolvida -= 1
                }
                if estaNoPrimeiroLoopDoSegundoWhile == false {
                    if contadorDeParentesesExpressaoASerResolvida == 0 {
                        encontrouExpressaoCompleta = true
                    }
                }
                estaNoPrimeiroLoopDoSegundoWhile = false
                indexDoInicioAoFimExpressao = indexDoInicioAoFimExpressao.successor()
            } // Fim do 2º while (while encontrouExpressaoCompleta == false)
            operacaoCompleta = operacaoCompleta.stringByReplacingOccurrencesOfString(operacaoASerSubstituida, withString: "function(" + String(operacaoASerSubstituida.characters.dropFirst()) + ", " + nomeDaFuncao + ")")
        } // Fim do 1º while (while operacaoCompleta.containsString(funcao) == true)
        return operacaoCompleta
    } // Fim func formataExpressaoComFuncaoEspecial()
    
    
    /**
     
     Encontra o parâmetro (argumento) de uma função especial.
     
     - Parâmetros: Index do início da função especial e operação.
     - Retorno: Parâmetro da função especial.
     
    */
    func encontraParametroDaExpressao(indexDoƒAoInicioOriginal: String.CharacterView.Index, operacao: String) -> String {
        var indexDoƒAoInicio = indexDoƒAoInicioOriginal
        
        var parametroDaExpressao: String = ""
        indexDoƒAoInicio = indexDoƒAoInicio.predecessor()
        while caractereENumero(operacao[indexDoƒAoInicio]) == true || caractereEPonto(operacao[indexDoƒAoInicio]) == true || operacao[indexDoƒAoInicio] == "-" {
            parametroDaExpressao = parametroDaExpressao + String(operacao[indexDoƒAoInicio])
            if indexDoƒAoInicio != operacao.startIndex {
                
                if operacao[indexDoƒAoInicio] == "-" {
                    if caractereENumero(operacao[indexDoƒAoInicio.predecessor()]) == false {
                        break
                    } else {
                        parametroDaExpressao = String(parametroDaExpressao.characters.dropLast())
                        break
                    }
                }
                indexDoƒAoInicio = indexDoƒAoInicio.predecessor()
            } else {
                break
            }
        }
        return String(parametroDaExpressao.characters.reverse())
    } // fim encontraParametroDaExpressao()
    
    
    /**
     
     Formata uma expressão especial que contenha um parâmetro.
     
     - Parâmetros: Operação e nome da função a ser formatada com parâmetro.
     - Retorna: Operação formatada corretamente.
     
    */
    func formataExpressaoEspecialComParametro(operacaoOriginal: String, nomeDaFuncao: String) -> String {
        
        var operacao = operacaoOriginal
        
        // Verifica o nome da função e substitui ela por ƒ:
        if nomeDaFuncao == "calculaRaizEnesima" {
            operacao = operacao.stringByReplacingOccurrencesOfString("nth_root(", withString: "ƒ(")
        } else if nomeDaFuncao == "calculaXLog" {
            operacao = operacao.stringByReplacingOccurrencesOfString("xlog(", withString: "ƒ(")
        }
        
        while operacao.containsString("ƒ") == true {
            
            // Variáveis e Constantes:
            var encontrouExpressaoCompleta: Bool = false
            let indexDoƒDaExpressao = operacao.characters.indexOf("ƒ")!
            var indexDoƒAoFimDaExpressao = indexDoƒDaExpressao
            var contadorDeParentesesExpressaoASerResolvida: Int = 0
            var operacaoASerSubstituida: String = ""
            var estaNoPrimeiroLoopDoSegundoWhile = true
            var parametroDaExpressao: String = ""
            
            // Enquanto não encontrar a expressão completa:
            while encontrouExpressaoCompleta == false {
                
                if estaNoPrimeiroLoopDoSegundoWhile == true {
                    parametroDaExpressao = encontraParametroDaExpressao(indexDoƒDaExpressao, operacao: operacao)
                }
                
                operacaoASerSubstituida = operacaoASerSubstituida + String(operacao[indexDoƒAoFimDaExpressao])
                
                if operacao[indexDoƒAoFimDaExpressao] == "(" {
                    contadorDeParentesesExpressaoASerResolvida += 1
                } else if operacao[indexDoƒAoFimDaExpressao] == ")" {
                    contadorDeParentesesExpressaoASerResolvida -= 1
                }
                
                if estaNoPrimeiroLoopDoSegundoWhile == false {
                    if contadorDeParentesesExpressaoASerResolvida == 0 {
                        encontrouExpressaoCompleta = true
                    }
                }
                
                indexDoƒAoFimDaExpressao = indexDoƒAoFimDaExpressao.successor()                
                estaNoPrimeiroLoopDoSegundoWhile = false
            } // fim do segundo while
            
            operacao = operacao.stringByReplacingOccurrencesOfString(parametroDaExpressao + operacaoASerSubstituida, withString: "function(" + String(operacaoASerSubstituida.characters.dropFirst()) + ", " + "'" + nomeDaFuncao + ":', " + parametroDaExpressao + ")")
            
        } // fim do primeiro while
        return operacao
    } // fim formataExpressaoEspecialComParametro()

    
    
    /**
     
     Adiciona os parênteses que faltam em uma expressão matemática.
     
     - Parâmetros: Expressão Matemática. (String)
     - Retorna: Expressão Matemática com parênteses que faltam. (String)
     
    */
    func adicionaParentesesQueFaltam(expressaoMatematica: String) -> String {
        
        var expressaoMatematicaComParenteses = expressaoMatematica
        var contadorDeParentesesTemp = contaParentesesDeExpressao(expressaoMatematicaComParenteses)
        
        while (contadorDeParentesesTemp > 0) {
            expressaoMatematicaComParenteses = expressaoMatematicaComParenteses + ")"
            contadorDeParentesesTemp -= 1
        }
        
        return expressaoMatematicaComParenteses
    }
    
    /**
     
     Substitui uma expressão matemática incompleta por uma completa.
     
     - Parâmetros: Expressão matemática incompleta (ou completa). (String)
     - Retorna: Expressão matemática completa.
     
    */
    func substituiExpressaoIncompletaPorCompleta(expressaoIncompleta: String) -> String {
        
        var expressaoCompleta = expressaoIncompleta
        
        // Caso o usuário digite apenas o sinal negativo, a operação continua zero.
        if expressaoCompleta == "-" {
            expressaoCompleta = "0"
        }
        
        // Resolve problemas que envolvam parênteses:
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("()", withString: "(0)")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("*(0)", withString: "*(1)")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("*-(0)", withString: "*(1)")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("/(0)", withString: "/(1)")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("/-(0)", withString: "/(1)")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("+)", withString: ")")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("**)", withString: ")")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("*)", withString: ")")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("*-)", withString: ")")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("-)", withString: ")")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString(".)", withString: ")")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("/)", withString: ")")
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("/-)", withString: ")")
        
        // Deleta as operações que sobrarem no final da operação matemática.
        var terminouDeDeletarUltimasOperacoes = false
        while (terminouDeDeletarUltimasOperacoes == false) {
            if /*ultimoCaractereENumero(operacao) == false*/ caractereENumero(expressaoCompleta.characters.last) == false {
                if expressaoCompleta.characters.last != ")" {
                    expressaoCompleta = String(expressaoCompleta.characters.dropLast())
                    if /*ultimoCaractereCalculoENumero()*/caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == true {
                        terminouDeDeletarUltimasOperacoes = true
                    }
                } else {
                    terminouDeDeletarUltimasOperacoes = true
                }
            } else { // Ultimo Caractere é número!
                terminouDeDeletarUltimasOperacoes = true
            }
        }
        
        // Arruma a seguinte situação: (-
        expressaoCompleta = expressaoCompleta.stringByReplacingOccurrencesOfString("()", withString: "(0)")
        
        return expressaoCompleta
    }
    
    
    
    /**
     
     Garante que uma expressão matemática se torna válida e completa.
     
     - Parâmetros: Operação Matemática.
     - Retorno: Operação Matemática Válida e Completa.
     
    */
    func garanteExpressaoMatematicaFormatadaECompleta(operacaoOriginal: String) -> String {
        
        var operacao = operacaoOriginal
        
        // Troca os operadores matemáticos inválidos pelos válidos:
        operacao = corrigeOperadoresMatematicos(operacao)
        
        // Formata as expressões com fatorial:
        operacao = formataExpressaoFatorialCorretamente(operacao)
        
        // Corrige a falta de parenteses adicionando novos parenteses fechados ao final da operação:
        operacao = adicionaParentesesQueFaltam(operacao)
        
        // Transforma uma expressão incompleta em uma completa:
        operacao = substituiExpressaoIncompletaPorCompleta(operacao)
        
        // Formata nth_root, log e xlog:
        operacao = formataExpressaoEspecialComParametro(operacao, nomeDaFuncao: "calculaRaizEnesima")
        operacao = formataExpressaoEspecialComParametro(operacao, nomeDaFuncao: "calculaXLog")
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "log₁₀")
        
        // Formata Cos, Sin, Tan, etc...
        // Obs: A ordem de formatação do aXh até x é necessária! (mais complexo até o mais simples)
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "acosh")
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "asinh")
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "atanh")
        
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "acos")
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "asin")
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "atan")
        
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "cosh")
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "sinh")
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "tanh")
        
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "cos")
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "sin")
        operacao = formataExpressaoComFuncaoEspecial(operacao, funcao: "tan")
        
        return operacao
    }
    
    
    /**
     
     Corrige os operadores para que uma operação seja válida.
     
     - Parâmetros: Operação Matemática.
     - Retorna: Operação Matemática com operadores válidos.
     
    */
    func corrigeOperadoresMatematicos(operacaoOriginal: String) -> String {
        
        var operacao = operacaoOriginal
        
        // Troca ',' por '.'
        operacao = operacao.stringByReplacingOccurrencesOfString(",", withString: ".")
        
        // Troca 'x' por '*'
        operacao = operacao.stringByReplacingOccurrencesOfString("×", withString: "*")
        
        // Troca '÷' por '/'
        operacao = operacao.stringByReplacingOccurrencesOfString("÷", withString: "/")
        
        // Troca '^' por '**'
        operacao = operacao.stringByReplacingOccurrencesOfString("^", withString: "**")
        
        // Troca '√' por 'sqrt'
        operacao = operacao.stringByReplacingOccurrencesOfString("√", withString: "sqrt")
        
        // Troca '%' por '/100.0*'
        operacao = operacao.stringByReplacingOccurrencesOfString("%", withString: "/100.0*")
        
        return operacao
    }
    
    
    /**
     
     Verifica se um caractere é um ponto.
     
     - Parâmetros: Caractere.
     - Retorna: Verdadeiro ou Falso.
     
    */
    func caractereEPonto(caractere: Character) -> Bool {
        if caractere == "." {
            return true
        }
        return false
    }
    
    
    /**
     
     Verifica se o caractere é um número.
     
     - Parâmetros: Caractere (opcional).
     - Retorna: Verdadeiro ou Falso.
     
    */
    func caractereENumero(caractere: Character?) -> Bool {
        if caractere == "0" || caractere == "1" || caractere == "2" || caractere == "3" || caractere == "4" || caractere == "5" || caractere == "6" || caractere == "7" || caractere == "8" || caractere == "9" {
            return true
        }
        return false
    }
    
    
    /**
     
     Apaga todas as operações até que o último valor de cálculo seja um número ou parenteses.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func apagaTodasAsUltimasOperacoesCalculo() {
        
        while caractereENumero(outletLabelExpressaoMatematica.text!.characters.last) == false {
            
            if outletLabelExpressaoMatematica.text!.isEmpty == true || outletLabelExpressaoMatematica.text!.characters.last == "(" || outletLabelExpressaoMatematica.text!.characters.last == ")" {
                return
            }
            
            outletLabelExpressaoMatematica.text = String(outletLabelExpressaoMatematica.text!.characters.dropLast())
        }
    }
    
    
    /**
     
     Coloca ',0' ao final de um número do cálculo caso necessário.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func colocaPontoEZeroCalculoSeNecessario() {
        if verificaSeVirgulaEstaEmUso(outletLabelExpressaoMatematica.text!) == false {
            filtraExpressaoMatematicaInvalida(",")
            filtraExpressaoMatematicaInvalida("0")
        }
    }
    
    
    /**
     
     Remove ',0' de um valor caso necessário.
     
     - Parâmetros: Valor.
     - Retorna: Valor sem ',0'.
     
    */
    func removePontoZeroDeValorSeNecessario(valorOriginal: String) -> String {
        var valor = valorOriginal
        if valor.containsString(",0") == true {
            if valor.characters.last == "0" {
                valor = String(valor.characters.dropLast())
                if valor.characters.last == "," {
                    valor = String(valor.characters.dropLast())
                } else {
                    valor = valor + "0"
                }
            }
        }
        return valor
    }
    
    
    /**
     
     Verifica se um caractere corresponde a uma letra do alfabeto.
     
     - Parâmetros: Caractere (opcional).
     - Retorna: Verdadeiro ou Falso.
     
    */
    func caractereELetra(caractere: Character?) -> Bool {
        
        if caractere == "a" || caractere == "b" || caractere == "c" || caractere == "d" || caractere == "e" || caractere == "f" || caractere == "g" || caractere == "h" || caractere == "i" || caractere == "j" || caractere == "k" || caractere == "l" || caractere == "m" || caractere == "n" || caractere == "o" || caractere == "p" || caractere == "q" || caractere == "r" || caractere == "s" || caractere == "t" || caractere == "u" || caractere == "v" || caractere == "w" || caractere == "y" || caractere == "x" || caractere == "z" {
            
            return true
        }
        return false
    }
    
    
    /**
     
     Verifica se um caractere é uma operação matemática.
     
     - Parâmetros: Caractere (opcional).
     - Retorna: Verdadeiro ou Falso.
     
    */
    func caractereEOperacao(caractere: Character?) -> Bool {
        if caractere == "-" || caractere == "+" || caractere == "*" || caractere == "%" || caractere == "^" || caractere == "/" /* Operações Sem Formatação: */ || caractere == "×" || caractere == "÷" || caractere == "^" {
            return true
        }
        return false
    }
    
    
    
    /**
     
     Conta a quantidade de parenteses de uma operação matemática.
     
     - Parâmetros: Operação Matemática.
     - Retorna: Quantidade de Parênteses. (Int)
     
    */
    func contaParentesesDeExpressao(expressaoOriginal: String) -> Int {
        
        var expressao = expressaoOriginal
        var contadorParenteses = 0
        
        while expressao.isEmpty == false {
            
            if expressao.characters.first == "(" {
                
                contadorParenteses += 1
                
            } else if expressao.characters.first == ")" {
                
                contadorParenteses -= 1
                
            }
            
            expressao = String(expressao.characters.dropFirst())
        }
        
        return contadorParenteses
    }
    
    
   
    
    /**
     
     Formata um valor 'inf' para '∞'.
     
     - Parâmetros: Valor.
     - Retorna: Valor Formatado.
     
    */
    func formataInf(valor: String) -> String {
        if valor == "inf" {
            return "∞"
        } else if valor == "-inf" {
            return "-∞"
        }
        return valor
    }
    
    
    /**
     
     Verifica se uma operação matemática contém algum número.
     
     - Parâmetros: Operação Matemática.
     - Retorna: Verdadeiro ou Falso.
     
    */
    func operacaoTemNumero(operacaoOriginal: String) -> Bool {
        var operacao = operacaoOriginal
        while operacao.isEmpty == false {
            if caractereENumero(operacao.characters.last) == true {
                return true
            } else {
                operacao = String(operacao.characters.dropLast())
            }
        }
        return false
    }
    
    
    /**
     
     Verifica o status e altera, se necessário, o caractere do botão entre C e AC.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
    
    */
    func verificaEAlteraStatusBotaoC() {
        
        if verificaSeUltimoResultadoEstaAtivado() == true {
            if verificaSeUltimoResultadoEstaVazio() == true {
                cOutlet.setTitle("C", forState: UIControlState.Normal)
            } else if outletLabelExpressaoMatematica.text!.isEmpty == false && resultadoAntigo.text!.isEmpty == false {
                cOutlet.setTitle("C", forState: UIControlState.Normal)
            } else if outletLabelExpressaoMatematica.text!.isEmpty == true && resultadoAntigo.text!.isEmpty == false {
                cOutlet.setTitle("AC", forState: UIControlState.Normal)
            }
        } else {
            cOutlet.setTitle("C", forState: UIControlState.Normal)
        }
    }
    
    
    /**
     
     Troca todas as virgulas por pontos em uma operação matemática.
     
     - Parâmetros: Operação Matemática.
     - Retorna: Operação matemática com pontos ao invés de virgulas.
     
    */
    func trocaPontoPorVirgula(operacaoOriginal: String) -> String {
        var operacao = operacaoOriginal
        operacao = operacao.stringByReplacingOccurrencesOfString(".", withString: ",")
        return operacao
    }
    
    
    /**
     
     Verifica se o som da tecla está ativado.
     
     - Parâmetros: Nenhum.
     - Retorna: Verdadeiro ou Falso.
     
    */
    func verificaSeSomTeclaEstaAtivado() -> Bool {
        
        return (configuracoesUsuario["Som das Teclas Ativado"] as? Bool)!
    }
    
    /**
     
     Verifica se o modo simples está ativado.
     
     - Parâmetros: Nenhum.
     - Retorna: Verdadeiro ou Falso.
     
     */
    func verificaSeModoSimplesEstaAtivado() -> Bool {
        
        return (configuracoesUsuario["Retrato Simples Ativado"] as? Bool)!
    }
    
    /**
     
     Verifica se a tela de último resultado está ativada.
     
     - Parâmetros: Nenhum.
     - Retorna: Verdadeiro ou Falso.
     
     */
    func verificaSeUltimoResultadoEstaAtivado() -> Bool {
        
        return !(configuracoesUsuario["Esconder Última Resposta Ativado"] as? Bool)!
    }
    
    /**
     
     Verifica se o botão de Rad ou Deg está ativado.
     
     - Parâmetros: Nenhum.
     - Retorna: Verdadeiro ou Falso.
     
     */
    func verificaSeBotaoRadOuDegEstaAtivado() -> Bool {
        
        return !(configuracoesUsuario["Esconder Botão Gra/Rad Ativado"] as? Bool)!
    }
    
    /**
     
     Verifica se o modo radiano está ativado.
     
     - Parâmetros: Nenhum.
     - Retorna: Verdadeiro ou Falso.
     
    */
    func verificaSeModoRadianoEstaAtivado() -> Bool {
        
        return (configuracoesUsuario["Modo Radiano Ativado"] as? Bool)!
    }
    
    /**
     
     Verifica se o modo "Por Cento Clássico" está ativado.
     
     - Parâmetros: Nenhum.
     - Retorna: Verdadeiro ou Falso.
     
    */
    func verificaSeModoPorCentoClassicoEstaAtivado() -> Bool {
        
        return (configuracoesUsuario["Botão % Clássico Ativado"] as? Bool)!
    }
    
    /**
     
        Verifica se o modo "Mostrar Memória" está ativado.
     
        - Parâmetros: Nenhum.
        - Retorna: Verdadeiro ou Falso.
     
    */
    func verificaSeModoMemoriaEstaAtivado() -> Bool {
        
        return (configuracoesUsuario["Mostrar Memória Ativado"] as? Bool)!
    }
    
    
    /**
     
     Verifica se o último resultado está vazio.
     
     - Parâmetros: Nenhum.
     - Retorna: Verdadeiro ou Falso.
     
    */
    func verificaSeUltimoResultadoEstaVazio() -> Bool {
        return resultadoAntigo.text!.isEmpty
    }
    
    
    /**
     
     Verifica se o menu de configurações está aberto.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
    */
    func verificaSeMenuConfiguracoesEstaAberto() -> Bool {
        return !outletViewBotaoVoltar.hidden
    }
    
    
    /**
     
     Verifica a configuração de botão Deg/Rad e altera seu status de acordo.
     
     - Parâmetros: Nenhum.
     - Retorna: Nada.
     
     */
    func verificaEAlteraStatusBotaoDegOuRad() {
        
        if verificaSeModoRadianoEstaAtivado() == false {
            
            outletBotaoDegOuRad.setTitle(dicionarioBotaoGrau[idioma], forState: UIControlState.Normal)
        } else {
            
            outletBotaoDegOuRad.setTitle(dicionarioBotaoRadiano[idioma], forState: UIControlState.Normal)
        }
    }
    
    
    /** 
     
    Verifica se o resultado final é um número.
     
    - Parâmetros: resultado. (String)
    - Retorna: Verdadeiro ou Falso.
     
    */
    func verificaSeResultadoFinalENumero(resultado: String) -> Bool {
        if resultado.containsString("∞") || resultado == "nan" || resultado == "Erro" || resultado == "inf" {
            return false
        } else {
            return true
        }
    }
    
    
    /**
     
    Arredonda o resultado final.
     
    - Parâmetros: Resultado Final. (String)
    - Retorna: Resultado Final Arredondado. (String)
     
    */
    func arredondaResultadoFinal(resultadoFinal: String) -> String {
        
        // Remove o sinal de negativo de uma string "-0.0" (quando um valor negativo muito pequeno é arredondado pelo método round, ele retorna -0.0)
        // Parâmetros: Valor. (String)
        // Retorna: "0.0" ou valor. (String)
        func removeSinalNegativoDeZeros(valor: String) -> String {
            if valor == "-0.0" {
                return "0.0"
            } else {
                return valor
            }
        }
        
        if verificaSeResultadoFinalENumero(resultadoFinal) == true {
            
            let quantidadeDeCasasDecimais = configuracoesUsuario["Casas Decimais"] as! Double
            var resultadoArrendodado = String(Double(round(pow(10,quantidadeDeCasasDecimais) * Double(resultadoFinal)!)/pow(10,quantidadeDeCasasDecimais)))
            resultadoArrendodado = removeSinalNegativoDeZeros(resultadoArrendodado)
            
            return resultadoArrendodado
            
        } else {
            
            return resultadoFinal
        }
    }
    
    
    /**
     
    Verifica se uma virgula está em uso.
     
    - Parâmetros: Expressão Matemática. (String)
    - Retorna: Verdadeiro ou Falso.
     
    */
    func verificaSeVirgulaEstaEmUso(expressaoMatematica: String) -> Bool {
        
        var expressao = expressaoMatematica
        var encontrouVirgula = false
        
        while expressao.isEmpty == false {
            
            if expressao.characters.last == "," {
                
                encontrouVirgula = true
            }
            
            if caractereEOperacao(expressao.characters.last) || !caractereENumero(expressao.characters.last) {
                
                return encontrouVirgula
            }
            
            expressao = String(expressao.characters.dropLast())
        }
        
        return encontrouVirgula
    }
    
    /**
     
     Verifica se um número é muito pequeno ou grande:
     
     - Parâmetros: Número. (String)
     - Retorna: Verdadeiro ou Falso.
     
    */
    func verificaSeNumeroEoMuitoGrandeOuPequeno(numero: String) -> Bool {
        if numero.containsString("e") == true {
            return true
        } else {
            return false
        }
    }
    
        
    /**
     
     Encontra o nome completo de uma função através de sua abreviatura.
     
     - Parâemtros: Abreviatura. (String)
     - Retorna: Nome da função. (String)
     
    */
    func encontraNomeDeFuncaoSemParametroPelaAbreviatura(abreviatura: String) -> String {
        
        let dicionarioDeFuncoesGrau: [String:String] = [
            
            "cos" : "'calculaCossenoGrau'",
            "sin" : "'calculaSenoGrau'",
            "tan" : "'calculaTangenteGrau'",
            
            "cosh" : "'calculaCossenoH'",
            "sinh" : "'calculaSenoH'",
            "tanh" : "'calculaTangenteH'",
            
            "acos" : "'calculaACossenoGrau'",
            "asin" : "'calculaASenoGrau'",
            "atan" : "'calculaATangenteGrau'",
            
            "acosh" : "'calculaACossenoH'",
            "asinh" : "'calculaASenoH'",
            "atanh" : "'calculaATangenteH'",
            
            "log₁₀" : "'calculaLog10'"
            
        ]
        
        let dicionarioDeFuncoesRadiano: [String:String] = [
            
            "cos" : "'calculaCossenoRadiano'",
            "sin" : "'calculaSenoRadiano'",
            "tan" : "'calculaTangenteRadiano'",
            
            "cosh" : "'calculaCossenoH'",
            "sinh" : "'calculaSenoH'",
            "tanh" : "'calculaTangenteH'",
            
            "acos" : "'calculaACossenoRadiano'",
            "asin" : "'calculaASenoRadiano'",
            "atan" : "'calculaATangenteRadiano'",
            
            "acosh" : "'calculaACossenoH'",
            "asinh" : "'calculaASenoH'",
            "atanh" : "'calculaATangenteH'",
            
            "log₁₀" : "'calculaLog10'"
            
        ]
        
        if verificaSeModoRadianoEstaAtivado() == false {
            return dicionarioDeFuncoesGrau[abreviatura]!
        } else {
            return dicionarioDeFuncoesRadiano[abreviatura]!
        }
        
    }
    
        
} // Fim VerificaECorrige.swift

















