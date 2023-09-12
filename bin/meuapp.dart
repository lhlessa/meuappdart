import 'dart:convert';
import 'dart:io';
import 'package:meuapp/exceptions/altura_invalida_exception.dart';
import 'package:meuapp/exceptions/nome_invalido_exception.dart';
import 'package:meuapp/exceptions/peso_invalido_exception.dart';
import 'package:meuapp/pessoa.dart';

void main(List<String> arguments) {
  double? pesoToDouble;
  double? alturaToDouble;
  String nome = "";
  print("Digite o nome da pessoa:");
  nome = stdin.readLineSync(encoding: utf8) ?? "";

  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    nome = "Nome padrão";
    print(NomeInvalidoException());
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  print("Digite o peso da pessoa:");

  var peso = stdin.readLineSync(encoding: utf8) ?? "";

  print("Digite a altura da pessoa:");

  var altura = stdin.readLineSync(encoding: utf8) ?? "";

  try {
    pesoToDouble = double.parse(peso);
    try {
      if (pesoToDouble == 0) {
        throw PesoInvalidoException();
      }
    } on PesoInvalidoException {
      print(PesoInvalidoException());
      exit(0);
    } catch (e) {
      print(e);
      exit(0);
    }
    alturaToDouble = double.parse(altura);
    try {
      if (alturaToDouble == 0) {
        throw AlturaInvalidaException();
      }
    } on AlturaInvalidaException {
      print(AlturaInvalidaException());
      exit(0);
    } catch (e) {
      print(e);
      exit(0);
    }
    var pessoa = Pessoa(nome, pesoToDouble, alturaToDouble);
    print(pessoa.resultadoIMC(pesoToDouble, alturaToDouble));
  } catch (e) {
    print("Número inválido: $peso ou $altura");
  }
}
