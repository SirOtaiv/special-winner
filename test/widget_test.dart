import 'package:flutter_test/flutter_test.dart';
import 'package:special_winner/main.dart';

void main() {
  test('Teste de cálculo do IMC', () {
    // Defina os valores de entrada para o cálculo do IMC
    double peso = 70; // Em quilogramas
    double altura = 1.75; // Em metros
    
    // Chame a função calcularIMC com os valores de entrada
    double resultado = calcularIMC(peso, altura);
    
    // Defina o resultado esperado do cálculo do IMC
    double resultadoEsperado = 22.86; // Este é um exemplo, o resultado esperado pode variar
    
    // Verifique se o resultado retornado pela função é igual ao resultado esperado com uma margem de precisão
    expect(resultado, closeTo(resultadoEsperado, 0.01));
  });
}