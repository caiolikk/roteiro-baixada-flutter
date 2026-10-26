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

Os cartões utilizam Row, Column, Container, Padding, SizedBox e dois Checkboxes. A classe Principal contém o nome do aluno, também mostrado na AppBar e no comentário inicial do código-fonte.

## Fontes e créditos

Informações e fotografias consultadas em 26/10/2026 nos portais municipais. As fotografias pertencem aos respectivos autores/portais; não são apresentadas como autoria do aluno. Uso neste exercício acadêmico, sem atribuição de licença livre.

- Museu do Café: https://turismosantos.com.br/pt-br/content/museu-do-cafe
- Monte Serrat (foto identificada no portal como Isabela Carrari): https://www.turismosantos.com.br/pt-br/content/monte-serrat
- Aquário: https://www.turismosantos.com.br/pt-br/content/aquario
- Orquidário (foto identificada no portal como Marcelo Martins): https://www.turismosantos.com.br/pt-br/content/orquidario
- Cama de Anchieta: https://www2.itanhaem.sp.gov.br/turismo/cama-de-anchieta/
- Praias do Indaiá e da Enseada: https://www.bertioga.sp.gov.br/turismo/pontos-turisticos/praias

Consulte os portais antes de visitar: horários e condições de abertura podem mudar.

## Publicação no GitHub

O repositório Git local contém os commits de desenvolvimento. Crie no seu GitHub um repositório vazio chamado `roteiro-baixada-flutter`, sem README inicial, e execute nesta pasta:

```sh
git remote add origin https://github.com/caiolikk/roteiro-baixada-flutter.git
git push -u origin main
```

Depois envie a URL no ambiente da disciplina antes do prazo. A criação do repositório remoto e o envio na plataforma da disciplina precisam ser confirmados; o histórico local, sozinho, não cumpre essa parte da entrega.

## Validação nesta máquina

Os arquivos Dart foram formatados e as dependências foram resolvidas usando o cache local. Foram escritos testes para as marcações e a rolagem, mas a execução do Flutter encerrou sem emitir resultado conclusivo. Portanto, os testes e a compilação **não estão confirmados**. Execute os comandos acima antes da entrega.

O controle do navegador foi interrompido pela ferramenta porque ela não conseguiu verificar a URL com segurança. Nenhum repositório remoto foi criado e nenhuma URL foi enviada ao professor.
