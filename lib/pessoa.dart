import 'dart:math';

class Pessoa {
  String? _nome;
  double? _peso;
  double? _altura;

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  get peso => _peso;

  get altura => _altura;

  get nome => _nome;
  
  set nome(value) => _nome = value;

  set altura(value) => _altura = value;

  set peso(value) => _peso = value;

  double _calculaIMC(double peso, double altura){
    double resultado = peso/pow(altura,2);
    return resultado;
  }

  String resultadoIMC(double peso, double altura){

    double resultado = _calculaIMC(peso, altura);

    if(resultado < 16){
      return "Magreza Grave";

    }else if(resultado > 16 && resultado < 17){
      return "Magreza Moderada";
    }
    else if(resultado > 17 && resultado < 18.5){
      return "Magreza Leve";
    }
    else if(resultado > 18.5 && resultado < 25){
      return "Saudável";
    }
    else if(resultado > 25 && resultado < 30){
      return "Sobrepeso";
    }
    else if(resultado > 30 && resultado < 35){
      return "Obesidade Grau I";
    }
    else if(resultado > 35 && resultado < 40){
      return "Obesidade Grau II (severa)";
    }
    else{
      return "Obesidade Grau III (mórbida)";
    }
  }

}

