# Roteiro Baixada

Aluno: **Caio Henrique Cid Rodrigues Cunha**

Aplicativo Flutter para catálogo de sete pontos turísticos reais de Santos, Itanhaém e Bertioga. Fotos locais permitem uso offline. Favorito e visitado são independentes e mantidos apenas em memória; fechar e abrir o aplicativo limpa as marcações.

## Executar

Com o Flutter instalado, abra um terminal nesta pasta:

```sh
flutter pub get
flutter run -d chrome
```

Para Android, conecte um dispositivo/emulador e execute `flutter run`. Para verificar:

```sh
flutter analyze
flutter test
flutter build web
```

## Organização

- `lib/main.dart`: MaterialApp, Principal (StatefulWidget), Scaffold, AppBar, ListView, cabeçalho, cartões e setState.
- `lib/ponto_turistico.dart`: modelo e dados fixos do catálogo.
- `assets/images/`: imagens usadas por Image.asset.
- `test/widget_test.dart`: independência das marcações, rolagem e limpeza ao recriar a tela.

Os cartões utilizam Row, Column, Container, Padding, SizedBox e dois botões de alternância: coração para favorito e círculo com verificação para visitado. A classe Principal contém o nome do aluno, também mostrado na AppBar e no comentário inicial do código-fonte.

## Fontes e créditos

Informações e fotografias consultadas em 26/10/2026 nos portais municipais. As fotografias pertencem aos respectivos autores/portais; não são apresentadas como autoria do aluno. Uso neste exercício acadêmico, sem atribuição de licença livre.

- Museu do Café: https://turismosantos.com.br/pt-br/content/museu-do-cafe
- Monte Serrat (foto identificada no portal como Isabela Carrari): https://www.turismosantos.com.br/pt-br/content/monte-serrat
- Aquário: https://www.turismosantos.com.br/pt-br/content/aquario
- Orquidário (foto identificada no portal como Marcelo Martins): https://www.turismosantos.com.br/pt-br/content/orquidario
- Cama de Anchieta: https://www2.itanhaem.sp.gov.br/turismo/cama-de-anchieta/
- Praias do Indaiá e da Enseada: https://www.bertioga.sp.gov.br/turismo/pontos-turisticos/praias

Consulte os portais antes de visitar: horários e condições de abertura podem mudar.

## Repositório e execução

Repositório: https://github.com/caiolikk/roteiro-baixada-flutter

A versão inicial foi publicada com três commits. Para enviar alterações locais já commitadas, use `git push`.

A compilação web foi executada e a prévia local pode ser iniciada com `flutter run -d web-server`. Os testes automatizados ainda não tiveram resultado conclusivo neste ambiente.

## Atualização visual

Fotos quadradas (1:1), fonte Lora incluída com licença OFL e layout com uma coluna abaixo de 700 px, duas a partir de 700 px e três a partir de 1050 px. Favorito usa coração vazado/preenchido; Visitado usa círculo de verificação vazado/preenchido. As marcações continuam independentes e apenas em memória.

Os ícones substituem os Checkboxes por solicitação posterior; essa versão diverge desse requisito do enunciado original.
