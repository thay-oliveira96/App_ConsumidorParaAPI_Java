/*
Nome:Thaynan Rodrigues de Oliveira      RGM: 11191102746
Nome: Vinicius Gonzales Egidio          RGM: 11191101856
Materia: Sistema da Informação          Turma: 5SIB
Materia: Sistemas Distribuidos e Padrões de Projetos Orientado a Objeto
 */
package factory;
        
import Model.Funcionario;


public class Factory {
    public static Funcionario funcionarioSemTelefone(String nome, String rg, String endereco, String departamento){
        return new Funcionario(nome, rg, endereco, departamento);
    }
    public static Funcionario funcionarioSemTelefoneEEndereco(String nome, String rg, String departamento){
        return new Funcionario(nome, rg, departamento);
    }
}
