import 'dart:io';

void main() {
  print("insira seu peso");
  double? pesoTemporario = double.tryParse(stdin.readLineSync() ?? "");
  print("Insira sua altura");
  double? alturaTemporaria = double.tryParse(stdin.readLineSync() ?? "");

  if (pesoTemporario != null && alturaTemporaria != null) {
    double peso = pesoTemporario;
    double altura = alturaTemporaria;

    calculoImc({required double peso, required double altura}) {
      double contaImc = peso / (altura * altura);
      return contaImc;
    }

    double resultadoImc = calculoImc(peso: peso, altura: altura);

    print("O valor do seu IMC é de ${resultadoImc.toStringAsFixed(2)}");

    switch (resultadoImc) {
      case < 18.5:
        print("Desnutrição");
        break;
      case >= 18.5 && <= 24.9:
        print("Peso normal");
        break;
      case >= 25.0 && <= 29.9:
        print("Sobrepeso");
        break;
      case >= 30.0 && <= 34.9:
        print("Obesidade grau I");
        break;
      case >= 35.0 && <= 39.9:
        print("Obesidade grau II");
        break;
      case >= 40.0:
        print("Obesidade grave");
        break;
    }
  }
}
