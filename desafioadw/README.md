
### Certificação em Analytics Engineer by Indicium

### A certificação:
O objetivo desta certificação é avaliar suas competências em um projeto prático de Engenharia de Analytics conforme a metodologia do Modern Analytics Stack, desenvolvida pela Indicium mas que guarda muitas semelhanças com o Modern Data Stack utilizado por milhares de times de dados modernos.

A obtenção desta certificação indica que você:  
- Entende o processo de construção de uma plataforma de analytics moderna;
- Entende os objetivos da modelagem dimensional em data warehouses modernos
- Sabe aplicar a linguagem SQL e a ferramenta dbt para modelar dados em data warehouses modernos;
- Conhece as boas práticas de visualização de dados e sua aplicação em uma ferramenta de Self-Service BI.

### Contexto:
A seguinte empresa contratou você: Adventure Works (AW), uma indústria de bicicletas em franco crescimento que se orgulha de possuir mais de 500 produtos distintos, 20.000 clientes e 31.000 pedidos. Para manter seu ritmo de crescimento e se diferenciar da concorrência, a Adventure Works quer utilizar seus dados de forma estratégica, norteando suas decisões para se tornar uma empresa data driven.A diretoria da Adventure Works já listou uma série de perguntas que ela quer responder através de cruzamentos dos dados, e que devem guiar o desenvolvimento das tabelas de fatos e dimensões do data warehouse. Para iniciar o projeto e obter resultados rápidos, a opção foi iniciar pela área de vendas (sales), mas algumas tabelas de outras áreas podem ser necessárias para conseguir as informações desejadas.

### Descrição dos dados
A Adventure Works possui um banco de dados transacional (PostgreSQL) que armazena os dados de suas diferentes áreas. Esses dados estão distribuídos em 68 tabelas divididas em 5 schemas: HR (recursos humanos), sales (vendas), production (produção) e purchasing (compras).

### Entrega
1 - Diagrama conceitual do data warehouse em formato PDF: crie o modelo conceitual com as tabelas de fatos e dimensões necessárias para responder às perguntas de negócio do item 4. Mostrar de forma resumida quais as tabelas fonte que foram utilizadas para criar cada dimensão e a tabela fato. (Sugestão de ferramenta: draw.io)

2 - Configuração de um data warehouse na nuvem e configuração do dbt. Sugestão: Google Bigquery e dbt Cloud.

3 - Transformação de dados: transforme os dados brutos utilizando o dbt (sugestão: dbt Cloud). Essa transformação deve incluir os seguintes pontos:

a - documentação das tabelas e colunas nos marts

b - testes de sources

c - testes nas primary keys das tabelas de dimensão e fatos

d - teste de dados (lembro do pedido do Carlos)

e - O código precisa estar em um repositório (sugestão: github). Você deve disponibilizar o link do repositório no Github.

4 - Painéis de BI: crie em uma ferramenta à sua escolha, mas que permita você responder as seguintes perguntas de negócio:

a - Qual o número de pedidos, quantidade comprada, valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?

b - Quais os produtos com maior ticket médio por mês, ano, cidade, estado e país? (ticket médio = Faturamento bruto - descontos do produto / número de pedidos no período de análise)

c - Quais os 10 melhores clientes por valor total negociado filtrado por produto, tipo de cartão, motivo de venda, data de venda, status, cidade, estado e país?

d - Quais as 5 melhores cidades em valor total negociado por produto, tipo de cartão, motivo de venda, data de venda, cliente, status, cidade, estado e país?

e - Qual o número de pedidos, quantidade comprada, valor total negociado por mês e ano (dica: gráfico de série de tempo)?

f - Qual produto tem a maior quantidade de unidades compradas para o motivo de venda “Promotion”?

Essas são as perguntas mínimas que têm de serem respondidas por análises feitas no dashboard criado, porém um dashboard completo e bem estruturado também contará na avaliação final da entrega do quesito BI. 

Sugestão de ferramentas:

Google Data Studio - você deve disponibilizar o link do painel para acessarmos;

PowerBI - disponibilize o arquivo do dashboard;

Em resumo, se for utilizar uma outra ferramenta lembre-se que o painel precisa ser interativo e que tenhamos acesso ao dashboard. Captura de telas dos dashboards não serão consideradas na avaliação.

5 - Vídeo: você deverá gravar um vídeo apresentando todas as etapas do projeto (DW, EL, transformação em dbt e BI). Crie com alguma ferramenta de gravação, como o Nimbus ou OBS Studio. O vídeo não deve ter duração maior que 10 minutos. Você pode usar o youtube ou outro portal se desejar.

A seguir um storytelling básico para guiar o seu vídeo, você pode por mais informações, como decisões de modelagem, métricas criadas e diferentes análises que podem ser tiradas do seu dashboard além daquelas que foram citadas no item 4, porém é imperativo que seu vídeo tem as seguintes demonstrações:

### Ferramentas utilizadas
- DBT -  Ferramenta de transformação de Dados.
- GoogleBigQuery - Data Warehouse em Nuvem.
- PowerBI - Ferramenta de BI.
- Draw.IO - Ferramenta de Desenho e Criação de Diagramas.

