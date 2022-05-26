# nft_market

Aprendizados 1.0:
- design responsivo com palette generator e gradient colors.
- uso do stack + positioned para criar widgets flutuantes.
- consumo de api rest.
- mudança de páginas através de rotas do Navigator.
- textos animados.


Aprendizados 1.1:
- refatoração de todo o código para tirar regras de negócio das views.
- uso do provider para injetar objetos nos widgets filhos.
- uso do changenotifier para gerenciar o estado apenas de widgets que precisam ser mudados, e não a tela toda.

Aprendizados 1.2:
- uso do provider para injetar a dependencia do httpController para os widgets que utilizam a informação da API.
- uso do ChangeNotifier para notificar os listeners sobre a chegada das informações que precisam do httpController.
- mudanças na aparencia com appbar e bottomNavigationBar.
- criação de widgets personalizados para diminuir o acoplamento, diminuir quantidade de linhas e aumentar a reusabilidade (strokedTextWidget).

Aprendizados 1.3:
- uso de injeção de dependencia e inversão de dependencia no projeto, para diminuir o acoplamento.

Aprendizados 1.4
- conceito de objetos imutáveis e padrão copywith
- uso do getter para formatar a URL vinda da API sem quebrar o conceito de responsabilidade unica

Aprendizados 1.5
- Refatoração do código para mudar o scroll da lista
- Teste de navegação de rotas pelo bottom navigation menu (ainda com setstate como gerencia de estado)
- Aplicado conceito de loading com container cinza para melhor experiencia do usuário
- A listview agora não destrói os seus filhos conforme somem na tela quando é feito o scroll.
- A listview agora não perde seu estado quando é feita a navegação para outra tela.
- Uso do dispose

Aprendizados 1.6
- BLoC implementado para gerenciar a regra de negócio PaletteGenerator!!

A ser feito:
- Testes de unidade nas regras de negócio
- implementação do BLoC
- publicação na loja

- fotos do app nos assets.
- link da api: [API request](https://eth-mainnet.alchemyapi.io/v2/demo/getNFTs/?owner=0xfAE46f94Ee7B2Acb497CEcAFf6Cff17F621c693D)
