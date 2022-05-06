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


- fotos do app nos assets.
- link da api: [API request](https://eth-mainnet.alchemyapi.io/v2/demo/getNFTs/?owner=0xfAE46f94Ee7B2Acb497CEcAFf6Cff17F621c693D)
