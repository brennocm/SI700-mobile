# KeyGuardian - O Cofre Digital para Suas Senhas

KeyGuardian é um protótipo de aplicativo móvel, desenvolvido com Flutter, que serve como um cofre de senhas seguro e intuitivo. Este projeto foi criado com foco na prototipação da interface do usuário (UI) e na navegação entre telas, seguindo um design pré-definido.

## 🚀 Funcionalidades Implementadas

O aplicativo simula o fluxo completo de um gerenciador de senhas, incluindo:

* **Fluxo de Autenticação:**
    * Tela de Boas-vindas com opções de login e cadastro.
    * Tela de Criação de Conta.
    * Tela de Login.
    * Tela de Recuperação de Senha.
    * Confirmação de segurança com Chave-Mestra.
* **Cofre de Senhas:**
    * Tela Principal (`Home`) que lista todas as credenciais salvas.
    * Tela de Detalhes da Credencial para visualizar e editar informações.
* **Ferramentas e Perfil:**
    * Um Gerador de Senhas customizável.
    * Tela de Perfil do Usuário para gerenciar dados da conta.
    * Menu de navegação lateral (`Drawer`) para acesso rápido às funcionalidades.

## 🏛️ Estrutura do Projeto

O projeto segue uma arquitetura simples e organizada, baseada no padrão **Model-View**:

* **`lib/main.dart`**: Ponto de entrada da aplicação. Responsável pela inicialização e configuração do tema geral.
* **`lib/view/`**: Contém todos os arquivos `.dart` que definem a interface de cada tela (os Widgets).
* **`assets/images/`**: Pasta onde todos os recursos de imagem, como logos e ícones, são armazenados.

## 🛠️ Como Executar o Projeto

Para rodar este projeto em sua máquina local, siga os passos abaixo:

1.  **Clone o repositório** (ou certifique-se de ter todos os arquivos).
2.  **Instale as dependências** (neste caso, as do próprio Flutter):
    ```bash
    flutter pub get
    ```
3.  **Execute o aplicativo** em um emulador ou dispositivo físico:
    ```bash
    flutter run
    ```

---
