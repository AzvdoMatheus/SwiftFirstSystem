enum Cargos {
    case monitor
    case diretor
    case coordenador
    case professor
    case assistente
    
    func abreviacaoCargo() -> String {
        switch self {
        case .monitor:
            return "mntr"
        case .diretor:
            return "dir"
        case .assistente:
            return "assist"
        case .coordenador:
            return "coord"
        case .professor:
            return "prof"
        }
    }
}

struct Colaborador {
    let nome: String
    let matricula: Int
    let salario: Double
    let cargo: Cargos
    
    func descricao() -> String {
        return "Meu nome é \(nome), sou \(cargo) e minha matrícula é \(matricula)"
    }
}

class Sistema {
    var colaboradores: [Colaborador]
    
    init(colaborador: [Colaborador]) {
        self.colaboradores = colaborador
    }
    
    func adicionaColaborador(_ colaborador: Colaborador) {
        colaboradores.append(colaborador)
    }
    
    func removeColaborador(comMatricula matricula: Int) {
        
        for(indice, colaborador) in colaboradores.enumerated() {
            if colaborador.matricula == matricula {
                colaboradores.remove(at: indice)
            }
        }
    }
    
    func listaGastoMensais() -> Double {
        var gastoTotal: Double = 0.0
        
        for colaborador in colaboradores {
            gastoTotal += colaborador.salario
        }
        
        return gastoTotal
    }
    
    func listaGastoPorCargo(doCargo cargo: Cargos) -> String {
        var gastoTotal: Double = 0
        
        //iterar colaboradores
        //$0 usa valor dos colaboradores no filter
        let colaboradoresCargo = colaboradores.filter {$0.cargo == cargo}
        gastoTotal = colaboradoresCargo.reduce(0.0) {$0 + $1.salario}
        
        return "O gasto do cargo \(cargo) é \(gastoTotal)"
    }
    
    func listaQuantidadeDeColaboradoresCargo(doCargo cargo: Cargos) -> String {
        var quantidadeDeColaboradoresCargo = 0
        
        let colaboradoresCargo = colaboradores.filter {$0.cargo == cargo}
        quantidadeDeColaboradoresCargo = colaboradoresCargo.count
        
        return "Quantidade de colaboradores do cargo \(cargo): \(quantidadeDeColaboradoresCargo)"
    }

    func listaColaboradoresEmOrdemAlfabetica() -> [String] {
        var nomes: [String] = []
        
        nomes = colaboradores.map({$0.nome})
        nomes.sort()
        
        return nomes

    }
}
