# Simple System Dealership

Um sistema simples de concessionária que o jogador consegue fazer a autenticação, comprar qualquer veículo e aplicar impostos.

## Authenticate

- Create account command - O jogador criara uma conta usando um comando: /create_account (Username, Senha, Idade, Email)

- Login account command - O jogador ira logar usando um comando: /login_account (Username, Senha).
  "As senha terão que ser idênticas para o jogador entrar na conta".

- Show information's player command - O jogador ira mostrar as informações do usuário usando um comando: /data_user (Username).

- Logout vehicle command: O jogar ira se deslogar da conta usando um comando: /logout_account.
  "A conta do jogador sera apagada automaticamente."

### Authenticate Task list

- [x] - Criar um array para inserir e guardar as informações do usuário cadastrado.
- [x] - Criar uma função de cadastrar os usuários.
- [x] - Criar uma função para verificar se existe o usuário registrado no array.
- [x] - Criar uma função para logar os usuários cadastrados.
- [x] - Criar uma função que retorna os dados do certo usuário.
- [x] - Listar as informações do jogador.
- [x] - Criar uma função de deslogar da conta.
- [x] - Criar uma função para deletar a conta.

## Buy Vehicle

- Buy vehicle command - O jogador ira comprar o veículo usando um comando: /buy_vehicle (Nome do veículo, Cor)
  "O veículo vai direto para a conta do jogador que finalizou a compra"

- Show information's vehicle command - O jogador ira mostrar as informações dos veículos usando um comando: /data_vehicles (Username).

### Buy Vehicle Task list

- [x] - O usuário tera que estar logado em alguma conta para prosseguir com a compra.
- [x] - Não autorizar a compra caso a idade do jogador for menor que 18 anos.
- [x] - Inserir dentro do array do usuário o veículo comprado.
- [x] - Verificar se o usuário tem algum carro comprado.
- [x] - Listar as informações do veículo comprado pelo jogador.

## Impost Vehicle

- Impost vehicle command: O jogador ira multar um veículo da conta de um certo jogador usando um comando: /impost (Username, Nome do veículo).
  "O veículo será deletado da conta do jogador automaticamente".

### Impost Vehicle Task list

- [x] - Criar uma função de aplicar impostos.
- [x] - Criar uma função de deletar o veículo.

## Permissions

- Delete account player command - uma permissão admin de deletar contas dos jogadores usando um comando: /deleteAccount (Username)
- Give vehicle player command - Uma permissão admin de dar/givar veículos para jogadores usando um comando: /giveVehicle (Username, Nome do veículo, Cor)
- Take vehicle player command - Uma permissão admin de retirar veículos para jogadores usando um comando: /takeVehicle (Username, Nome do veículo)
  OBS: Não implementei essa parte (Ideia para se colocar no futuro!)

> Stacks: **Lua**, **Commands**
