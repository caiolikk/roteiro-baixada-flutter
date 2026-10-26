import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roteiro_baixada/main.dart';
import 'package:roteiro_baixada/ponto_turistico.dart';

void main() {
  test('Catálogo possui sete locais e estado inicial independente', () {
    final pontos = criarCatalogo();
    expect(pontos.length, 7);
    expect(pontos.map((p) => p.nome).toSet().length, 7);
    pontos.first.favorito = true;
    expect(pontos[1].favorito, false);
    expect(criarCatalogo().first.favorito, false);
  });

  testWidgets('Marca, desmarca e mantém estado ao rolar; reinício limpa', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const AplicativoTurismo());
    await tester.pumpAndSettle();
    expect(find.text(Principal.nomeAluno), findsOneWidget);
    final favorito = find.byWidgetPredicate(
      (w) => w is Checkbox && w.semanticLabel == 'Favorito: Museu do Café',
    );
    final visitado = find.byWidgetPredicate(
      (w) => w is Checkbox && w.semanticLabel == 'Visitado: Museu do Café',
    );
    await tester.ensureVisible(favorito);
    await tester.tap(favorito);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(favorito).value, true);
    expect(tester.widget<Checkbox>(visitado).value, false);
    await tester.tap(visitado);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(visitado).value, true);
    await tester.scrollUntilVisible(find.text('Praia da Enseada'), 400);
    await tester.pumpAndSettle();
    expect(find.text('Praia da Enseada'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Museu do Café'), -400);
    await tester.ensureVisible(favorito);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(favorito).value, true);
    await tester.tap(favorito);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(favorito).value, false);
    expect(tester.widget<Checkbox>(visitado).value, true);
    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(const AplicativoTurismo());
    await tester.pumpAndSettle();
    await tester.ensureVisible(visitado);
    expect(tester.widget<Checkbox>(visitado).value, false);
    expect(tester.takeException(), isNull);
  });
}
