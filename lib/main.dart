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

  Widget _construirCabecalho() {
    final favoritos = _pontos.where((p) => p.favorito).length;
    final visitados = _pontos.where((p) => p.visitado).length;
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: const Color(0xFF004F56),
          borderRadius: BorderRadius.circular(24)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('LITORAL PAULISTA',
            style: TextStyle(
                color: Color(0xFFB5E9DE), letterSpacing: 2, fontSize: 12)),
        const SizedBox(height: 12),
        const Text('Seu próximo passeio\ncomeça aqui.',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const Text('Explore a Baixada Santista e marque suas descobertas.',
            style: TextStyle(color: Colors.white, height: 1.5)),
        const SizedBox(height: 20),
        Text(
            '${_pontos.length} lugares • $favoritos favoritos • $visitados visitados',
            style: const TextStyle(color: Color(0xFFB5E9DE))),
        const SizedBox(height: 8),
        const Text('As marcações duram apenas nesta sessão.',
            style: TextStyle(color: Colors.white70, fontSize: 12)),
      ]),
    );
  }

  Widget _construirCartao(PontoTuristico ponto) => CartaoPontoTuristico(
        ponto: ponto,
        aoAlterarFavorito: () =>
            setState(() => ponto.favorito = !ponto.favorito),
        aoAlterarVisitado: () =>
            setState(() => ponto.visitado = !ponto.visitado),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Roteiro Baixada',
                    style: TextStyle(
                        fontFamily: 'Lora',
                        fontWeight: FontWeight.w600,
                        fontSize: 27,
                        letterSpacing: -0.8,
                        color: Color(0xFF004F56))),
                SizedBox(height: 4),
                Text(Principal.nomeAluno,
                    maxLines: 3, style: TextStyle(fontSize: 12)),
              ]),
        ),
        body: SafeArea(
            child: Center(
                child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(builder: (context, constraints) {
            // Uma coluna no celular, duas no tablet e três no desktop.
            final colunas = constraints.maxWidth >= 1050
                ? 3
                : constraints.maxWidth >= 700
                    ? 2
                    : 1;
            final margem = constraints.maxWidth < 700 ? 16.0 : 24.0;
            final linhas = (_pontos.length / colunas).ceil();
            return ListView.builder(
              padding: EdgeInsets.all(margem),
              itemCount: linhas + 1,
              itemBuilder: (context, indice) {
                if (indice == 0) return _construirCabecalho();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var coluna = 0; coluna < colunas; coluna++) ...[
                          if (coluna > 0) const SizedBox(width: 20),
                          Expanded(
                              child: (indice - 1) * colunas + coluna <
                                      _pontos.length
                                  ? _construirCartao(
                                      _pontos[(indice - 1) * colunas + coluna])
                                  : const SizedBox()),
                        ],
                      ]),
                );
              },
            );
          }),
        ))),
      );
}

class CartaoPontoTuristico extends StatelessWidget {
  const CartaoPontoTuristico(
      {super.key,
      required this.ponto,
      required this.aoAlterarFavorito,
      required this.aoAlterarVisitado});
  final PontoTuristico ponto;
  final VoidCallback aoAlterarFavorito;
  final VoidCallback aoAlterarVisitado;

  Widget _construirMarcacao(String rotulo, bool ativo, IconData vazio,
          IconData preenchido, Color cor, VoidCallback aoAlterar) =>
      Semantics(
        button: true,
        toggled: ativo,
        label: '$rotulo: ${ponto.nome}',
        child: TextButton.icon(
          key: ValueKey('$rotulo: ${ponto.nome}'),
          onPressed: aoAlterar,
          style: TextButton.styleFrom(
            foregroundColor: ativo ? cor : const Color(0xFF52676A),
            backgroundColor:
                ativo ? cor.withValues(alpha: 0.08) : Colors.transparent,
            minimumSize: const Size(48, 48),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          icon: Icon(ativo ? preenchido : vazio, size: 26),
          label: Text(rotulo),
        ),
      );

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/images/${ponto.imagem}',
                fit: BoxFit.cover,
                semanticLabel: ponto.nome,
                errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.landscape_outlined, size: 64))),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const Icon(Icons.location_on_outlined,
                          size: 16, color: Color(0xFF006D77)),
                      const SizedBox(width: 4),
                      Flexible(
                          child: Text(ponto.cidade,
                              style: const TextStyle(color: Color(0xFF006D77))))
                    ]),
                    const SizedBox(height: 8),
                    Text(ponto.nome,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(ponto.descricao,
                        style: const TextStyle(
                            height: 1.5, color: Color(0xFF46595B))),
                    const SizedBox(height: 12),
                    const Divider(),
                    Wrap(spacing: 8, runSpacing: 4, children: [
                      _construirMarcacao(
                          'Favorito',
                          ponto.favorito,
                          Icons.favorite_border,
                          Icons.favorite,
                          const Color(0xFFBB3454),
                          aoAlterarFavorito),
                      _construirMarcacao(
                          'Visitado',
                          ponto.visitado,
                          Icons.check_circle_outline,
                          Icons.check_circle,
                          const Color(0xFF006D77),
                          aoAlterarVisitado),
                    ]),
                  ])),
        ]),
      );
}
