# Sistema de concessionaria

## Authenticate

- Create account command - O jogador criara uma conta usando um comando. /create_account (Username, Senha, Idade, Email)

- Login account command - O jogador ira logar usando um comando. /login_account (Username, Senha).
"As senha terão que ser idênticas para o jogador entrar na conta".

- Show information's player command - O jogador ira mostrar as informações do usuário usando um comando. /data_user (Username).

### Authenticate Task list

- [x] - Criar um array para inserir e guardar as informações do usuário cadastrado.
- [x] - Criar uma função de cadastrar os usuários.
- [x] - Criar uma função para verificar se existe o usuário registrado no array.
- [x] - Criar uma função para logar os usuários cadastrados.
- [x] - Criar uma função que retorna os dados do certo usuário.
- [x] - Listar as informações do jogador.

## Buy Vehicle

- Buy vehicle command - O jogador ira comprar o veículo usando um comando. /buy_vehicle (Username, Nome do veículo, Cor)

- Show information's vehicle command - O jogador ira mostrar as informações dos veículos usando um comando. /data_vehicle (Username).


### Buy Vehicle Task list

- [x] - O usuário tera que estar logado em alguma conta para prosseguir com a compra.
- [x] - Não autorizar a compra caso a idade do jogador for menor que 18 anos.
- [x] - Inserir dentro do array do usuário o veículo comprado.
- [x] - Verificar se o usuário tem algum carro comprado
- [x] - Listar as informações do veículo comprado pelo jogador.
