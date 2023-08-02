# Projeto de Engenharia de Análise de Dados - Northwind Traders

Este projeto se concentra na resolução de problemas enfrentados pela Northwind Traders, uma empresa fictícia que precisa de uma solução robusta para análise e visão integrada de seus dados. O objetivo é substituir o sistema de relatórios sob demanda baseado em planilhas por um Data Warehouse estruturado.

## Contexto do Projeto

A Northwind Traders é uma loja que gerencia pedidos, produtos, clientes, fornecedores e outros aspectos de uma pequena empresa. Apesar de ser uma empresa de pequeno porte, apresenta um faturamento mensal significativo e tem clientes e fornecedores em diversos países. Seus principais produtos incluem alimentos, bebidas e utilidades domésticas.

Com o rápido crescimento da empresa, ficou evidente que os relatórios sob demanda baseados em planilhas não são mais adequados. Os dados de diferentes áreas começaram a ser conflitantes, e as reuniões tornaram-se mais acirradas. A Northwind deseja entender melhor seus dados para aumentar o ticket médio e reduzir o churn.

## Desafio

O desafio é proporcionar uma visão integrada de todos os dados da empresa em um único local. Há preocupações sobre a dificuldade técnica, os custos e os prazos para este projeto. Experiências passadas com projetos de BI que não tiveram sucesso também contribuem para a resistência de algumas partes interessadas.

## Estrutura de Dados
![image](https://github.com/victorthecreative/Analytics-engineering---AdventureWork/assets/50841013/19cef60a-98cb-4371-835e-4d880415ebe0)

O banco de dados do ERP da empresa é um sistema PostgreSQL em um servidor na nuvem. Além disso, a empresa usa um CRM da Salesforce e um sistema de contabilidade da ContaAzul.

As tabelas a serem utilizadas para o desenvolvimento do Data Warehouse incluem:

- categories
- customer_customer_demo
- customer_demographics
- customers
- employee_territories
- employees
- order_details
- orders
- products
- region
- shippers
- suppliers
- territories
- us_states
- 
## Solução Proposta

A solução proposta é desenvolver um data warehouse da Northwind utilizando o GCP (Google Cloud Plataform) usando o Stitch para a extração e carga dos dados, e o dbt (data build tool) para fazer a transformação e load. ##Partindo para a modelagem as principais tabelas a serem criadas são:

![image](https://github.com/victorthecreative/Analytics-engineering---AdventureWork/assets/50841013/7904587e-beb6-4b2a-aefb-6732118a41f0)

Tabelas finais:
- Fatos de Pedidos
- Dimensão Clientes
- Dimensão Produtos
- Dimensão Transportadores
- Dimensão Fornecedores

Essas tabelas serão carregadas na nuvem, especificamente na GCP (Google Cloud Platform), usando o Stitch para a extração e carga dos dados.

Para obter mais informações sobre este projeto de engenharia de dados, sinta-se à vontade para entrar em contato ou consultar o código-fonte para obter detalhes completos da implementação.

## Recursos:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
