# Descrição do Problema
Temos um problema grande com reuniões, elas são muitas e temos poucas salas disponíveis.
Precisamos de uma agenda para nos mantermos sincronizados e esse será seu desafio!
Temos 4 salas e podemos usá-las somente em horário comercial, de segunda a sexta das 09:00 até as 18:00.
Sua tarefa será de criar uma API REST que crie, edite, mostre e delete o agendamento dos horários para que os usuários não se percam ao agendar as salas.

# Notas
- O teste deve ser escrito utilizando Ruby e Ruby on Rails
- Utilize as gems que achar necessário
- Não faça squash dos seus commits, gostamos de acompanhar a evolução gradual da aplicação via commits.
- Estamos avaliando coisas como design, higiene do código, confiabilidade e boas práticas
- Esperamos testes automatizados. 
- A aplicação deverá subir com docker-compose
- Crie um README.md descrevendo a sua solução e as issues caso houver
- O desafio pode ser entregue abrindo um pull request ou fazendo um fork do repositório 

# Inicialização

Step 1
```sh
git clone https://github.com/araketu/desafio-ninja.git
```

Step 2
```sh
docker-compose build
```

Step 3
```sh
docker-compose puma rails db:create db:migrate db:seed
```
Step 4
```sh
  docker-compose up
```

# Notas

- [x] O teste deve ser escrito utilizando Ruby e Ruby on Rails
- [x] Utilize as gems que achar necessário
- [x] Não faça squash dos seus commits, gostamos de acompanhar a evolução gradual da aplicação via commits.
- [x] Esperamos testes automatizados.
- [x] A aplicação deverá subir com docker-compose
- [x] Crie um README.md descrevendo a sua solução e as issues caso houver
- [x] O desafio pode ser entregue abrindo um pull request ou fazendo um fork do repositório

# Informações adicionais

- Ruby versão 3.0.0, RoR versão 6.1.4, PostgreSQL versão 12.9

- Estatísticas sobre a cobertura dos testes (SimpleCov Gem)

<div align="center">
  <image align="center" src=".github/images/code-coverage.png" width="800px">
</div>

<div align="center">
  <sub>Construído por
    <a href="https://github.com/AlexandreL0pes">Alexandre Lopes</a>
  </sub>
</div>
