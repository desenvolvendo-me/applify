if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com',
                    password: 'password', password_confirmation: 'password')

  user = User.create!(
    email: 'user@mail.com',
    password: '000000',
    password_confirmation: '000000'
  )

  Profile.create!(
    name: FFaker::NameBR.name,
    user_type: :student,
    user: user,
    bio: FFaker::LoremBR.paragraphs(2).first,
    profile_picture: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/profile.jpg'), 'image/jpeg')
  )

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
  checklist_padrao = JobSimulation.create(name: 'Perguntas Padrão', status: 0)
  checklist_jr0 = JobSimulation.create(name: 'Perguntas Jr 0', status: 0)
  checklist_jr1 = JobSimulation.create(name: 'Perguntas Jr 1', status: 0)
  checklist_versao1 = JobSimulation.create(name: 'Perguntas Versão 1', status: 0)

  # Simulation Question
  SimulationQuestion.create!(description: 'Você possui experiência anterior na área relacionada a esta vaga?', answer_type: 0, job_simulation: checklist_padrao)
  SimulationQuestion.create!(description: 'Possui habilidades técnicas específicas relevantes para a posição?', answer_type: 1, job_simulation: checklist_padrao)
  SimulationQuestion.create!(description: 'Você possui a educação ou certificações necessárias para esta posição?', answer_type: 2, job_simulation: checklist_jr0)
  SimulationQuestion.create!(description: 'Possui fluência em algum idioma adicional relevante para a posição?', answer_type: 3, job_simulation: checklist_jr0)
  SimulationQuestion.create!(description: 'Já teve experiências de trabalho colaborativo bem-sucedidas no passado?', answer_type: 0, job_simulation: checklist_jr1)
  SimulationQuestion.create!(description: 'Estaria disposto(a) a se mudar para outra cidade ou país para esta posição?', answer_type: 1, job_simulation: checklist_jr1)
  SimulationQuestion.create!(description: 'Esta posição exige viagens. Você está disposto(a) a viajar conforme necessário?', answer_type: 2, job_simulation: checklist_versao1)
  SimulationQuestion.create!(description: 'Já teve experiência em startup antes?', answer_type: 3, job_simulation: checklist_versao1)

  # Agreement
  Setting.create!(accord:
                      'Ao colocar informações de uma empresa no sistema, você concorda em cumprir os seguintes termos:
                        - As informações fornecidas, incluindo nome, descrição, LinkedIn, site e tecnologias são precisas e representam devidamente a empresa em questão.
                        - Como usuário responsável por criar uma nova empresa, compromete-se a manter as informações atualizadas e refletindo com precisão a situação atual da empresa.
                        - Compromete-se a fornecer informações verdadeiras e não enganosas sobre a empresa.
                        - As informações fornecidas não infringem os direitos autorais ou propriedade intelectual de terceiros.
                        - Ao criar ou atualizar uma empresa, reconhece e aceita a responsabilidade legal pelas informações fornecidas.'
  )

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

  # Candidatures
  student = User.create(email: 'student@example.com', password: '123456')
  professional = User.create(email: 'professional@example.com', password: '123456')

  student.save
  professional.save

  student.create_profile(name: 'student1', user_type: 'student')
  professional.create_profile(name: 'professional1', user_type: 'professional')

  student.profile.candidatures.create(company_name: 'Amazon', situation: 'answered', job_position: 'junior_developer', frame_work: 'React',
                                      programming_language: 'Python', application_date: '10/12/2023',
                                      personal_projects: 'links',
                                      job_description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.',
                                      presentation_letter: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, making it look like readable English.',
                                      knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                      profile_id: student)

  student.profile.candidatures.create(company_name: 'Google', situation: 'sending', job_position: 'junior_developer', frame_work: 'Angular',
                                      programming_language: 'Python', application_date: '8/10/2023',
                                      personal_projects: 'links',
                                      job_description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.',
                                      presentation_letter: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, making it look like readable English.',
                                      knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                      profile_id: student)

  student.profile.candidatures.create(company_name: 'Microsoft', situation: 'dispatch', job_position: 'junior_developer', frame_work: 'Ruby on Rails',
                                     programming_language: 'Ruby', application_date: '20/06/2023',
                                     personal_projects: 'links',
                                     job_description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.',
                                     presentation_letter: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, making it look like readable English.',
                                     knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                     profile_id: student)

  student.profile.candidatures.create(company_name: 'Apple', situation: 'dispatch', job_position: 'junior_developer', frame_work: 'Laravel',
                                     programming_language: 'PHP', application_date: '12/11/2023',
                                     personal_projects: 'links',
                                     job_description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.',
                                     presentation_letter: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, making it look like readable English.',
                                     knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                     profile_id: student)

  student.profile.candidatures.create(company_name: 'IBM', situation: 'answered', job_position: 'junior_developer', frame_work: 'React',
                                     programming_language: 'PHP', application_date: '10/12/2023',
                                     personal_projects: 'links',
                                     job_description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.',
                                     presentation_letter: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, making it look like readable English.',
                                     knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                     profile_id: student)

  professional.profile.candidatures.create(company_name: 'Dell', situation: 'answered', job_position: 'junior_developer', frame_work: 'React',
                                          programming_language: 'Python', application_date: '07/03/2023',
                                          personal_projects: 'links',
                                          job_description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.',
                                          presentation_letter: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, making it look like readable English.',
                                          knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                          profile_id: professional)

  professional.profile.candidatures.create(company_name: 'Oracle', situation: 'sending', job_position: 'junior_developer', frame_work: 'React',
                                          programming_language: 'Python', application_date: '15/09/2023',
                                          personal_projects: 'links',
                                          job_description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.',
                                          presentation_letter: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, making it look like readable English.',
                                          knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                          profile_id: professional)

  professional.profile.candidatures.create(company_name: 'DXC Technology', situation: 'sending', job_position: 'junior_developer', frame_work: 'Angular',
                                          programming_language: 'Python', application_date: '10/07/2023',
                                          personal_projects: 'links',
                                          job_description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.',
                                          presentation_letter: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, making it look like readable English.',
                                          knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                          profile_id: professional)

  professional.profile.candidatures.create(company_name: 'TOTVS', situation: 'dispatch', job_position: 'junior_developer', frame_work: 'Angular',
                                          programming_language: 'JavaScript', application_date: '9/08/2023',
                                          personal_projects: 'links',
                                          job_description: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.',
                                          presentation_letter: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, making it look like readable English.',
                                          knowledge_about_company: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                          profile_id: professional)

end
