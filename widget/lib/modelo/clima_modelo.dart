class ClimaModelo {
  final String ciudad;
  final double temperatura;
  final String descripcion;

  ClimaModelo(this.ciudad, this.temperatura, this.descripcion);

  factory ClimaModelo.fromJson(Map<String, dynamic> json) {
    return ClimaModelo(
      json['name'], 
      (json['main']['temp'] as num).toDouble(), 
      json['weather'][0]['description'], 
    );
  }
}
