// Aluno: Caio Henrique Cid Rodrigues Cunha
import 'package:flutter/material.dart';

import 'ponto_turistico.dart';

void main() => runApp(const AplicativoTurismo());

class AplicativoTurismo extends StatelessWidget {
  const AplicativoTurismo({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Roteiro Baixada',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006D77)),
      scaffoldBackgroundColor: const Color(0xFFF3F6F5),
    ),
    home: const Principal(),
  );
}

class Principal extends StatefulWidget {
  const Principal({super.key});
  static const String nomeAluno = 'Caio Henrique Cid Rodrigues Cunha';

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<PontoTuristico> _pontos = criarCatalogo();

  void _alterarFavorito(PontoTuristico ponto, bool? valor) {
    setState(() => ponto.favorito = valor ?? false);
  }

  void _alterarVisitado(PontoTuristico ponto, bool? valor) {
    setState(() => ponto.visitado = valor ?? false);
  }

  Widget _construirCabecalho() {
    final favoritos = _pontos.where((ponto) => ponto.favorito).length;
    final visitados = _pontos.where((ponto) => ponto.visitado).length;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF004F56),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'LITORAL PAULISTA',
            style: TextStyle(
              color: Color(0xFFB5E9DE),
              letterSpacing: 2,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Seu próximo passeio\ncomeça aqui.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Explore a Baixada Santista e marque suas descobertas.',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            '7 lugares • $favoritos favoritos • $visitados visitados',
            style: const TextStyle(color: Color(0xFFB5E9DE)),
          ),
          const SizedBox(height: 8),
          const Text(
            'As marcações duram apenas nesta sessão.',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      toolbarHeight: 88,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Roteiro Baixada',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            Principal.nomeAluno,
            maxLines: 3,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    ),
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _pontos.length + 1,
            itemBuilder: (context, indice) {
              if (indice == 0) return _construirCabecalho();
              final ponto = _pontos[indice - 1];
              return CartaoPontoTuristico(
                ponto: ponto,
                aoAlterarFavorito: (valor) => _alterarFavorito(ponto, valor),
                aoAlterarVisitado: (valor) => _alterarVisitado(ponto, valor),
              );
            },
          ),
        ),
      ),
    ),
  );
}

class CartaoPontoTuristico extends StatelessWidget {
  const CartaoPontoTuristico({
    super.key,
    required this.ponto,
    required this.aoAlterarFavorito,
    required this.aoAlterarVisitado,
  });
  final PontoTuristico ponto;
  final ValueChanged<bool?> aoAlterarFavorito;
  final ValueChanged<bool?> aoAlterarVisitado;

  Widget _construirMarcacao(
    String rotulo,
    bool valor,
    ValueChanged<bool?> aoAlterar,
  ) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Checkbox(
        value: valor,
        onChanged: aoAlterar,
        semanticLabel: '$rotulo: ${ponto.nome}',
      ),
      Flexible(child: Text(rotulo)),
    ],
  );

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 20),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/${ponto.imagem}',
          height: 210,
          width: double.infinity,
          fit: BoxFit.cover,
          semanticLabel: ponto.nome,
          errorBuilder: (context, error, stackTrace) => const SizedBox(
            height: 210,
            child: Center(child: Icon(Icons.landscape_outlined, size: 64)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Color(0xFF006D77),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    ponto.cidade,
                    style: const TextStyle(color: Color(0xFF006D77)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                ponto.nome,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                ponto.descricao,
                style: const TextStyle(height: 1.5, color: Color(0xFF46595B)),
              ),
              const SizedBox(height: 12),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: _construirMarcacao(
                      'Favorito',
                      ponto.favorito,
                      aoAlterarFavorito,
                    ),
                  ),
                  Expanded(
                    child: _construirMarcacao(
                      'Visitado',
                      ponto.visitado,
                      aoAlterarVisitado,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
