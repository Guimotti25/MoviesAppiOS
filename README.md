# MoviesAppiOS 🎬
📱 App iOS para listar filmes populares usando a API do The Movie DB.

📌 Visão Geral

O MoviesAppiOS é um aplicativo desenvolvido em Swift que exibe uma lista de filmes populares, permitindo visualizar detalhes como:

Título
Data de lançamento
Nota (rating)
Sinopse
Imagem do pôster
--
🛠️ Pré-requisitos

Xcode 15+
iOS 16+
API Key do The Movie DB
--
⚙️ Configuração

Clone o repositório:
bash
Copy
git clone https://github.com/seu-usuario/MoviesAppiOS.git
Abra o projeto no Xcode.
Adicione sua API Key no arquivo:
swift
Copy
// Utils.swift
static let apiKey = "SUA_API_KEY_AQUI"
🎨 Features

✅ Listagem de filmes populares
✅ Detalhes do filme (título, sinopse, avaliação)
✅ Carregamento de imagens via URL (usando URLSession ou Kingfisher)
✅ Layout responsivo (suporte a Light/Dark Mode)

🏫 Estrutura do Projeto

✔ Consumo de API REST com URLSession
✔ Parse de JSON usando Codable
✔ Navegação entre telas com UINavigationController
✔ Boas práticas de organização de código

🔜 Melhorias Futuras

Adicionar busca por filmes
Implementar favoritos (CoreData/UserDefaults)
Suporte a trailers (YouTube API)
Paginação na lista

🎉 Contribuições são bem-vindas!
Se quiser melhorar o projeto, abra uma issue ou envie um PR.
