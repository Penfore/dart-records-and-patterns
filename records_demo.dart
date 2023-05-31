getLat() => 25.125401; // Para exemplificar
getLng() => 15.096231;

main() async {
  const (String, double) record = ('Dart', 3);
  toString(record);

  // final coords = getLocationMap();
  // final lat = coords['lat']; // A forma de acesso é ruim // Passível de erros ao digitar a string e erros de null safety

  // Retornos nomeados
  // Criando variáveis com mesmo nome dos parâmetros de retorno
  final (:lat, :lng, elevation: elevation) = getLocation();
  print('$lat | $lng');

  // Utilizando outros tipos com os Records
  List<({double lat, double lng, double elevation})> coords = [];
  coords.add(getLocation());

  // Exemplo de desestruturação de um Map
  final Map<String, String> json = {
    'username': 'fulvioleo',
    'role': 'admin',
  };
  final {'username': String username} = json;
  print(username);
  // Exemplo de validação utilizando a desestruturação
  if (json
      // Nova funcionalidade para utilizar case dentro de um if
      case {
        'username': String usernameValidate,
        'role': String roleValidate,
      } when 'role' == 'admin') {
    // Guard when // Validaçã adicional
    print('$usernameValidate is $roleValidate');
  }

  // Exemplo de desestruturação de classes
  final User(:usernameClass, :uid) = User(usernameClass: 'fulvioleo', uid: '123');
  print('$usernameClass - $uid');

  List<User> users = [
    User(usernameClass: 'fulvioleo', uid: '1234'),
    User(usernameClass: 'teste', uid: '12345'),
  ];

  for (final User(:usernameClass, :uid) in users) {
    print('$usernameClass - $uid');
  }
}

// Forma antiga para retornos múltiplos
List<double> getLocationList() {
  return [getLat(), getLng()]; // Muitos problemas, pois precisa constantemente fazer verificações na lista
}

// Forma antiga para retornos múltiplos // Mais utilizada
Map<String, double> getLocationMap() {
  return {'lat': getLat(), 'lng': getLng()}; // A forma de acesso do retorno não é boa
}

// Outra forma muito utilizada para retornos múltiplos
// Ponto negativo de precisar sempre escrever uma nova classe // Boilerplate
class Location {
  final double lat;
  final double lng;

  const Location({
    required this.lat,
    required this.lng,
  });
}

Location getLocationObject() {
  return Location(lat: getLat(), lng: getLng()); // Era a forma mais legível para uso de retornos múltiplos
}

// Outra forma que tem o ponto positivo da legibilidade
// Baseada nos conceitos da programação funcional // Tuplas
class Either<Left, Right> {
  final Left left;
  final Right right;

  const Either({required this.left, required this.right});
}

Either<double, double> getLocationAsDouble() {
  return Either(left: getLat(), right: getLng());
}

// Utilizando a nova funcionalidade de Records
// Facilidade a escrita e também o entendimento do código
// Além de evitar boilerplate
// Aceita retornos nomeados
({double lat, double lng, double elevation}) getLocation() {
  final lat = getLat();
  final lng = getLng();

  return (lat: lat, lng: lng, elevation: 0);
}

toString((String, double) record) {
  print('Language: ${record.$1} ${record.$2}. Posicional'); // Acessando record do tipo posicional

  final (language, version) = record; // Pattern matching // Desestruturação
  print('Language: $language $version');

  // final (language, _) = record; // É possível utilizar dessa forma
  // print('Language: $language');
}

class User {
  final String usernameClass;
  final String uid;

  User({
    required this.usernameClass,
    required this.uid,
  });
}
