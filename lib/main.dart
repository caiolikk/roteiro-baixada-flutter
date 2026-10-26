// Aluno: Caio Henrique Cid Rodrigues Cunha
import 'package:flutter/material.dart';

void main() => runApp(const AplicativoTurismo());

class AplicativoTurismo extends StatelessWidget {
  const AplicativoTurismo({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Roteiro Baixada',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006D77))),
    home: const Principal(),
  );
}

class Principal extends StatefulWidget {
  const Principal({super.key});
  static const nomeAluno = 'Caio Henrique Cid Rodrigues Cunha';
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(Principal.nomeAluno)),
    body: const Center(child: Text('Roteiro Baixada')),
  );
}
