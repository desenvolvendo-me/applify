if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com',
                    password: 'password', password_confirmation: 'password')
  # Job simulation
  simulation_amazon = JobSimulation.create(company: 'Amazon')
  simulation_google = JobSimulation.create(company: 'Google')
  simulation_microsoft = JobSimulation.create(company: 'Microsoft')
  simulation_apple = JobSimulation.create(company: 'Apple')

  # Simulation Question
  SimulationQuestion.create!(description: 'Há quantos anos a empresa está no mercado?', job_simulation: simulation_amazon)
  SimulationQuestion.create!(description: 'A empresa segue algum modelo específico de gerenciamento de projetos ou metodologia de trabalho? Como isso impacta o dia a dia dos funcionários?', job_simulation: simulation_amazon)
  SimulationQuestion.create!(description: 'Você está familiarizado com a Google Cloud Platform? Como você acha que a GCP se destaca em relação a outras soluções de nuvem?', job_simulation: simulation_google)
  SimulationQuestion.create!(description: 'Qual é a cultura organizacional da Google e como ela se reflete no ambiente de trabalho?', job_simulation: simulation_google)
  SimulationQuestion.create!(description: 'Qual é a missão da Microsoft e como ela se alinha aos seus valores pessoais e profissionais?', job_simulation: simulation_microsoft)
  SimulationQuestion.create!(description: 'Como a Microsoft aborda a diversidade e inclusão no ambiente de trabalho?', job_simulation: simulation_microsoft)
  SimulationQuestion.create!(description: 'Como você vê a inovação na Apple e como gostaria de contribuir para esse ambiente inovador?', job_simulation: simulation_apple)
  SimulationQuestion.create!(description: 'Qual é a sua opinião sobre a abordagem da Apple em termos de sustentabilidade?', job_simulation: simulation_apple)

  # Goals and tasks
  goal1 = Goal.create(name: 'Aprender Linguagem Ruby',
                      description: 'Quero criar 10 algoritmos em até 3 meses', status: 'done')
  Task.create(name: '1ª agorítmo', description: 'Criar o algorítmo bubble sort',
              status: "done", goal: goal1)

  goal2 = Goal.create(name: 'Aprender Framework Rails',
                      description: 'Quero criar 5 projetos simples em até 3 meses', status: 'todo')
  Task.create(name: '1ª projeto', description: 'Criar a editora de livros',
              status: "todo", goal: goal2)

  goal3 = Goal.create(name: 'Aprender Linguagem Python',
                      description: 'Quero criar 5 scripts úteis em até 2 meses', status: 'doing')
  Task.create(name: '1º script', description: 'Criar um algorítmo de automação de tarefas',
              status: "doing", goal: goal3)

  goal4 = Goal.create(name: 'Aprender Banco de Dados SQL',
                      description: 'Quero criar um banco de dados de livros em até 1 mês', status: 'todo')
  Task.create(name: '1ª tabela', description: 'Criar a tabela de livros',
              status: "todo", goal: goal4)

  goal5 = Goal.create(name: 'Aprender Front-End Development',
                      description: 'Quero construir um portfólio online em 2 semanas', status: 'done')
  Task.create(name: 'Página inicial', description: 'Criar a página inicial do meu portfólio',
              status: "done", goal: goal5)

  goal6 = Goal.create(name: 'Aprender Linguagem JavaScript',
                      description: 'Quero dominar os conceitos básicos em 1 mês', status: 'todo')
  Task.create(name: '1º exercício', description: 'Realizar um exercício de lógica em JavaScript',
              status: "todo", goal: goal6)

  goal7 = Goal.create(name: 'Aprender Desenvolvimento Mobile',
                      description: 'Quero criar um aplicativo simples em 2 meses', status: 'doing')
  Task.create(name: 'Protótipo de tela', description: 'Desenhar o protótipo da tela inicial do aplicativo',
              status: "doing", goal: goal7)

  goal8 = Goal.create(name: 'Aprender Testes de Software',
                      description: 'Quero escrever testes para um projeto em 1 mês', status: 'todo')
  Task.create(name: 'Configurar ambiente', description: 'Configurar o ambiente de testes no projeto',
              status: "todo", goal: goal8)

  goal9 = Goal.create(name: 'Aprender Cloud Computing',
                      description: 'Quero implantar um aplicativo em nuvem em 2 semanas', status: 'doing')
  Task.create(name: 'Configurar servidor', description: 'Configurar um servidor na nuvem',
              status: "doing", goal: goal9)

  goal10 = Goal.create(name: 'Aprender Design de Interface',
                       description: 'Quero criar um design para um site em 1 mês', status: 'todo')
  Task.create(name: 'Layout da página inicial', description: 'Criar o layout da página inicial do site',
              status: "todo", goal: goal10)

  goal11 = Goal.create(name: 'Aprender Machine Learning',
                       description: 'Quero criar um modelo de machine learning em 2 meses', status: 'done')
  Task.create(name: 'Coleta de dados', description: 'Coletar dados para treinar o modelo',
              status: "done", goal: goal11)

  goal12 = Goal.create(name: 'Aprender Redes de Computadores',
                       description: 'Quero configurar uma rede local em 3 semanas', status: 'todo')
  Task.create(name: 'Configurar roteadores', description: 'Configurar os roteadores da rede',
              status: "todo", goal: goal12)

  goal13 = Goal.create(name: 'Aprender Segurança da Informação',
                       description: 'Quero realizar um teste de penetração em 1 mês', status: 'doing')
  Task.create(name: 'Varredura de vulnerabilidades', description: 'Realizar uma varredura de vulnerabilidades no sistema',
              status: "doing", goal: goal13)

  goal14 = Goal.create(name: 'Aprender Desenvolvimento Web Full-Stack',
                       description: 'Quero criar um aplicativo completo em 2 meses', status: 'doing')
  Task.create(name: 'Desenvolvimento do backend', description: 'Iniciar o desenvolvimento do backend do aplicativo',
              status: "doing", goal: goal14)

  goal15 = Goal.create(name: 'Aprender Inteligência Artificial',
                       description: 'Quero criar um chatbot em 1 mês', status: 'done')
  Task.create(name: 'Treinamento do modelo', description: 'Treinar um modelo de chatbot',
              status: "done", goal: goal15)

end
