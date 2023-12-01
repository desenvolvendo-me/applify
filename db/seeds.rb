if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com',
                    password: 'password', password_confirmation: 'password')
  # Interview tests
  interview_amazon = InterviewTest.create(company: 'Amazon')
  interview_google = InterviewTest.create(company: 'Google')
  interview_microsoft = InterviewTest.create(company: 'Microsoft')
  interview_apple = InterviewTest.create(company: 'Apple')
  interview_netflix = InterviewTest.create(company: 'Netflix')
  interview_spotify = InterviewTest.create(company: 'Spotify')
  interview_uber = InterviewTest.create(company: 'Uber')
  interview_airbnb = InterviewTest.create(company: 'Airbnb')
  interview_mozilla = InterviewTest.create(company: 'Mozilla')


  InterviewQuestion.create!(description: 'Há quantos anos a empresa está no mercado?', interview_test: interview_amazon)
  InterviewQuestion.create!(description: 'A empresa segue algum modelo específico de gerenciamento de projetos ou metodologia de trabalho? Como isso impacta o dia a dia dos funcionários?', interview_test: interview_amazon)
  InterviewQuestion.create!(description: 'Você está familiarizado com a Google Cloud Platform? Como você acha que a GCP se destaca em relação a outras soluções de nuvem?', interview_test: interview_google)
  InterviewQuestion.create!(description: 'Qual é a cultura organizacional da Google e como ela se reflete no ambiente de trabalho?', interview_test: interview_google)
  InterviewQuestion.create!(description: 'Qual é a missão da Microsoft e como ela se alinha aos seus valores pessoais e profissionais?', interview_test: interview_microsoft)
  InterviewQuestion.create!(description: 'Como a Microsoft aborda a diversidade e inclusão no ambiente de trabalho?', interview_test: interview_microsoft)
  InterviewQuestion.create!(description: 'Como você vê a inovação na Apple e como gostaria de contribuir para esse ambiente inovador?', interview_test: interview_apple)
  InterviewQuestion.create!(description: 'Qual é a sua opinião sobre a abordagem da Apple em termos de sustentabilidade?', interview_test: interview_apple)
  InterviewQuestion.create!(description: 'Como você vê a evolução da indústria do entretenimento streaming e qual papel a Netflix desempenha nesse cenário?', interview_test: interview_netflix)
  InterviewQuestion.create!(description: 'Qual é a estratégia da Netflix para se destacar em um mercado competitivo?', interview_test: interview_netflix)
  InterviewQuestion.create!(description: 'Qual é a sua opinião sobre o impacto da música digital e como o Spotify se destaca na indústria de streaming de música?', interview_test: interview_spotify)
  InterviewQuestion.create!(description: 'Como o Spotify lida com questões de direitos autorais na distribuição de música?', interview_test: interview_spotify)
  InterviewQuestion.create!(description: 'Como você enxerga a transformação digital no setor de transporte e qual papel a Uber desempenha nesse processo?', interview_test: interview_uber)
  InterviewQuestion.create!(description: 'Como a Uber aborda a segurança dos passageiros e motoristas?', interview_test: interview_uber)
  InterviewQuestion.create!(description: 'De que maneira a Airbnb revolucionou a indústria de hospedagem e como você se adaptaria a ambientes diversos como anfitrião ou hóspede?', interview_test: interview_airbnb)
  InterviewQuestion.create!(description: 'Como a Airbnb promove experiências autênticas para os usuários?', interview_test: interview_airbnb)
  InterviewQuestion.create!(description: 'Qual é a sua visão sobre a privacidade na internet e qual o papel da Mozilla na proteção dos usuários online?', interview_test: interview_mozilla)
  InterviewQuestion.create!(description: 'Como a Mozilla contribui para o desenvolvimento de padrões abertos na web?', interview_test: interview_mozilla)

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
