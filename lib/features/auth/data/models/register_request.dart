class RegisterRequest {
  final String email;
  final String password;
  final String name;
  final String phone;

  const RegisterRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> tojson() => {
    'email': email,
    'password': password,
    'rePassword': password,
    'name': name,
    'phone': phone,
  };
}
