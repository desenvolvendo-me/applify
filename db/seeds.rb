if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com',
                    password: 'password', password_confirmation: 'password')

  user = User.create!(email: 'user@mail.com',
                    password: '000000', password_confirmation: '000000')
  Profile.create!(name: 'Perfil 1', user_type: :student, user: user)

  # Stack
  stack1 = Stack.create(name: 'Ruby on Rails')
  stack2 = Stack.create(name: 'Ruby')
  stack3 = Stack.create(name: 'JavaScript')
  stack4 = Stack.create(name: 'Python')

  # Company
  company1 = Company.create!(name: 'Amazon',
                             description: 'Amazon comercializa produtos de todos os tipos, incluindo brinquedos, eletrônicos, vestuários e acessórios.',
                             linkedin: 'www.linkedin.com/company/amazon',
                             site: 'www.amazon.com.br')
  company1.stack_ids = [stack1.id, stack3.id]

  company2 = Company.create!(name: 'Google',
                             description: 'Empresa multinacional que oferece serviços online e softwares para download.',
                             linkedin: 'www.linkedin.com/company/google',
                             site: 'www.google.com.br')
  company2.stack_ids = [stack2.id, stack4.id]

  # Job simulation
  simulation_amazon = JobSimulation.create(company: 'Amazon')
  simulation_google = JobSimulation.create(company: 'Google')
  simulation_microsoft = JobSimulation.create(company: 'Microsoft')
  simulation_apple = JobSimulation.create(company: 'Apple')

  # Simulation Question
  SimulationQuestion.create!(description: 'Você possui experiência anterior na área relacionada a esta vaga?', answer_type: 0, job_simulation: simulation_amazon)
  SimulationQuestion.create!(description: 'Possui habilidades técnicas específicas relevantes para a posição?', answer_type: 1, job_simulation: simulation_amazon)
  SimulationQuestion.create!(description: 'Você possui a educação ou certificações necessárias para esta posição?', answer_type: 2, job_simulation: simulation_google)
  SimulationQuestion.create!(description: 'Possui fluência em algum idioma adicional relevante para a posição?', answer_type: 3, job_simulation: simulation_google)
  SimulationQuestion.create!(description: 'Já teve experiências de trabalho colaborativo bem-sucedidas no passado?', answer_type: 0, job_simulation: simulation_microsoft)
  SimulationQuestion.create!(description: 'Estaria disposto(a) a se mudar para outra cidade ou país para esta posição?', answer_type: 1, job_simulation: simulation_microsoft)
  SimulationQuestion.create!(description: 'Esta posição exige viagens. Você está disposto(a) a viajar conforme necessário?', answer_type: 2, job_simulation: simulation_apple)
  SimulationQuestion.create!(description: 'Já teve experiência em startup antes?', answer_type: 3, job_simulation: simulation_apple)

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
