# <div align="center"> Arquitetura do Projeto Flutter </div>

# Arquitetura Modular MVC+R

## Sobre

Esta arquitetura é um híbrido entre o padrão MVC (Model-View-Controller) e o Repository Pattern. Além disso, adota uma organização modular, onde funcionalidades específicas são encapsuladas em seus próprios módulos.

## Descrição

### MVC

- **Model**: Representa os dados e a lógica de negócios. Localizado principalmente em `models` e parte de `data/repositories`.
- **View**: Representa a interface do usuário. Exemplos incluem arquivos como `home_page.dart`.
- **Controller**: Manipula a entrada do usuário e atualiza o Model e a View. Exemplo é o `home_controller.dart`.

### Repository Pattern

A presença de um repositório específico (`data/repositories`) sugere uma separação clara entre a lógica de negócios e a lógica de acesso a dados.

### Modularização

A organização modular permite que funcionalidades ou recursos específicos sejam encapsulados em seus próprios módulos, facilitando a manutenção e escalabilidade.

## Nome da Arquitetura

O nome proposto para esta arquitetura é **"Modular MVC+R"** ou **"MVC Repository Modular"**, que indica um MVC aprimorado com Repository e organizado de forma modular.

## 📂 Estrutura de Diretórios, Camadas Principais

📂 **lib**  
├─ 📂 **src**  
│ ├─ 📂 **core**  
│ ├─ 📂 **data**  
│ ├─ 📂 **models**  
│ ├─ 📂 **modules**  
│ └─ 📄 **app_mvc.dart**  
└─ 📄 **main.dart**  


### `src`

Dentro da pasta `src`, encontramos os componentes principais do nosso projeto.

#### `core`

- **colors**: Define a paleta de cores utilizada em toda a aplicação.
- **images**: Contém todas as imagens e recursos visuais usados.
- **routes**: Define as rotas e navegação do aplicativo.
- **themes**: Estilos e temas globais da aplicação.
- **utils**: Funções auxiliares e utilitários.
- **widgets**: Widgets personalizados que são reutilizados em várias partes do aplicativo.

#### `data`

- **client**: 
  - `dio_client.dart`: Implementação do cliente Dio para requisições HTTP.
  - `rest_client_interface.dart`: Interface para o cliente REST.
- **repositories/movies**: 
  - `movies_repository_impl.dart`: Implementação do repositório de filmes.
  - `movies_repository.dart`: Declaração da interface do repositório de filmes.

#### `models`

- `movies_model.dart`: Modelo de dados para filmes.

#### `modules/home`

- `components`: Componentes visuais específicos deste módulo.
- `home_controller.dart`: Controlador do módulo Home.
- `home_module.dart`: Declaração do módulo Home.
- `home_page.dart`: Página principal deste módulo.
- `home_states.dart`: Estados do controlador Home.

#### 🌍 Arquivo Raiz

- `app_mvc.dart`: Ponto de entrada do modelo MVC.
- `main.dart`: Ponto de entrada principal do aplicativo.


## Estrutura

📂 **lib**  
├─ 📂 **src**  
│ ├─ 📂 **core**  
│ │ ├─ 📂 **colors**  
│ │ ├─ 📂 **images**  
│ │ ├─ 📂 **routes**  
│ │ ├─ 📂 **themes**  
│ │ ├─ 📂 **utils**  
│ │ └─ 📂 **widgets**  
│ ├─ 📂 **data**  
│ │ ├─ 📂 **client**  
│ │ │ ├─ 📄 **dio_client.dart**  
│ │ │ └─ 📄 **rest_client_interface.dart**  
│ │ └─ 📂 **repositories**  
│ │ │  └─ 📂 **movies**  
│ │ │  │  ├─ 📄 **movies_repository_impl.dart**  
│ │ │  │  └─ 📄 **movies_repository.dart**  
│ ├─ 📂 **models**  
│ │ └─ 📄 **movies_model.dart**  
│ ├─ 📂 **modules**  
│ │ └─ 📂 **home**  
│ │ │ ├─ 📂 **components**  
│ │ │ ├─ 📄 **home_controller.dart**  
│ │ │ ├─ 📄 **home_module.dart**  
│ │ │ ├─ 📄 **home_page.dart**  
│ │ │ └─ 📄 **home_states.dart**  
│ └─ 📄 **app_mvc.dart**  
└─ 📄 **main.dart**  

## 🌟 Conclusão

Esta arquitetura foi projetada para ser escalável, modular e de fácil manutenção. Cada módulo funciona de forma independente, facilitando a adição, remoção ou modificação de funcionalidades. A separação clara entre dados, lógica de negócios e interface do usuário também ajuda a manter o código limpo e compreensível.

