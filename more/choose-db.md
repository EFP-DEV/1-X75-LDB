
# Comment choisir une base de données ?

| Système             | MySQL / PostgreSQL       | MongoDB              | Redis               | Cassandra            | Neo4j           |
|---------------------|--------------------------|----------------------|---------------------|----------------------|-----------------|
| **Type**            | SGBDR                    | Document             | Clé-valeur          | Colonne              | Graph           |
| **Modèle de données** | Tables relationnelles     | Documents JSON/BSON  | Paires clé-valeur   | Colonnes réparties   | Nœuds et arêtes |
| **Langage de requête** | SQL                      | MongoDB Query Language | Commandes simples   | CQL (Cassandra Query Language) | Cypher          |
| **Schéma**           | Fixe (avec contraintes)  | Souple (optionnel)   | Aucun               | Semi-structuré       | Souple          |
| **Cas d'usage idéaux** | Applications CRUD traditionnelles, transactions financières | Catalogues, CMS, IoT, contenu dynamique | Cache, files de messages, compteurs temps réel | Big Data, IoT, analyse de séries temporelles | Réseaux sociaux, moteurs de recommandation, détection de fraude |
| **Consistance** | Forte (ACID) | Configurable (du fort à l'éventuel) | Configurable | Éventuelle (modèle AP) | Configurable |
|||||||
| **Système**             | **MySQL / PostgreSQL**       | **MongoDB**              | **Redis**               | **Cassandra**            | **Neo4j**           |
| **Volume de données** | 📦📦 | 📦📦📦 | 📦📦 ~ 📦📦📦📦 | 📦📦📦📦📦 | 📦📦📦 |
| **Vitesse de lecture** | ⚡⚡⚡ | ⚡⚡⚡⚡ | ⚡⚡⚡⚡⚡ | ⚡⚡⚡⚡⚡ | ⚡⚡⚡⚡ |
| **Vitesse d'écriture** | ⚡⚡ | ⚡⚡⚡⚡ | ⚡⚡⚡⚡⚡ | ⚡⚡⚡⚡⚡ | ⚡⚡⚡ |
| **Scalabilité** | ↕️↕️↕️ | ↔️↔️↔️↔️ | ↔️↔️↔️ | ↔️↔️↔️↔️↔️ | ↕️↕️ ↔️ |
| **Sécurité** | 🔐🔐🔐🔐🔐 | 🔐🔐🔐 | 🔐🔐 ~ 🔐🔐🔐🔐 | 🔐🔐🔐 | 🔐🔐🔐 |
| **Complexité des requêtes** | 🧩🧩🧩🧩🧩 | 🧩🧩🧩 | 🧩 | 🧩🧩 | 🧩🧩🧩🧩 |
| **Communauté et support** | 👥👥👥👥👥 | 👥👥👥👥 | 👥👥👥 | 👥👥👥 | 👥👥 |
| **Facilité d'utilisation** | 📚📚📚 | 📚📚 | 📚 | 📚📚📚 | 📚📚📚📚 |


# Dans le contexte du web

| **Système**           | **Type**         | **Part de marché estimée**                  | **Nombre d'instances estimées**         |
|-----------------------|------------------|---------------------------------------------|-----------------------------------------|
| **MySQL / MariaDB**   | SGBDR            | Environ 43% du marché relationnel           | Plus de 5 millions d'instances actives  |
| **PostgreSQL**        | SGBDR            | En forte croissance (top 4 mondial)         | Plus de 1 million d'instances actives   |
| **MongoDB**           | Document         | Environ 45.68% du marché NoSQL              | Plus de 1 million d'instances actives   |
| **Redis**             | Clé-valeur       | Très répandu dans le caching (top NoSQL)    | Environ 500 000 instances actives       |
| **Cassandra**         | Colonne          | Environ 4.45% du marché NoSQL               | Environ 100 000 instances actives       |
| **Neo4j**             | Graphes          | Leader des bases de graphes                 | Environ 50 000 instances actives        |

###  [|{](market-stats.md)
