class PontoTuristico {
  PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.imagem,
    required this.descricao,
  });
  final String nome;
  final String cidade;
  final String imagem;
  final String descricao;
  bool favorito = false;
  bool visitado = false;
}

// Retorna novos objetos: as marcações existem apenas em memória.
List<PontoTuristico> criarCatalogo() => [
  PontoTuristico(
    nome: 'Museu do Café',
    cidade: 'Santos',
    imagem: 'museu_cafe.jpg',
    descricao: 'A antiga Bolsa Oficial de Café abriga exposições sobre a história do café no Brasil, em um edifício de arquitetura marcante.',
  ),
  PontoTuristico(
    nome: 'Monte Serrat',
    cidade: 'Santos',
    imagem: 'monte_serrat.jpg',
    descricao: 'O bondinho leva ao alto do morro, com vista panorâmica da cidade e o Santuário de Nossa Senhora do Monte Serrat.',
  ),
  PontoTuristico(
    nome: 'Aquário Municipal',
    cidade: 'Santos',
    imagem: 'aquario.png',
    descricao: 'Na Ponta da Praia, reúne animais aquáticos e ações de educação ambiental. Consulte a situação de visitação antes de ir.',
  ),
  PontoTuristico(
    nome: 'Orquidário Municipal',
    cidade: 'Santos',
    imagem: 'orquidario.jpg',
    descricao: 'Parque arborizado com orquídeas, jardins e animais, dedicado ao contato com a natureza e à educação ambiental.',
  ),
  PontoTuristico(
    nome: 'Cama de Anchieta',
    cidade: 'Itanhaém',
    imagem: 'cama_anchieta.jpg',
    descricao: 'Formação rochosa à beira-mar associada às histórias de José de Anchieta. A passarela permite apreciar o costão e o oceano.',
  ),
  PontoTuristico(
    nome: 'Praia do Indaiá',
    cidade: 'Bertioga',
    imagem: 'indaia.jpeg',
    descricao: 'Praia de Bertioga com paisagem costeira e faixa de areia para passeios e momentos de lazer junto ao mar.',
  ),
  PontoTuristico(
    nome: 'Praia da Enseada',
    cidade: 'Bertioga',
    imagem: 'enseada.jpeg',
    descricao: 'Uma das praias mais conhecidas de Bertioga, com extensa faixa de areia e orla para caminhar e apreciar a paisagem.',
  ),
];
