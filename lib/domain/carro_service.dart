//cria a lista de carros
import 'package:carros_app/domain/Carro.dart';

class CarroService {
  static List<Carro> getCarros() {
    final carros = List.generate(50, (idx) {
      return Carro("Ferrari $idx",
          "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png");
    });

    return carros;
  }
}
