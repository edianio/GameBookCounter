class Validator {
  String? nullOrEmpty(String? value) {
    if(value == null) {
      return 'Não pode ser nulo!';
    } else if(value.isEmpty) {
      return 'Não pode ser vazio!';
    }
    return null;
  }

  String? personAlias(String? value) {
    if(nullOrEmpty(value) != null) {
      return 'Nome não pode ser vazio!';
    }
    if(value!.length < 2){
      return 'Apelido inválido!';
    }
    return null;
  }
}