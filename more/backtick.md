# \`backticks\`

Délimiteurs utilisés pour entourer les noms de tables et de colonnes en `MySQL`, utiles lorsque ces noms sont des **mots réservés `SQL`**.

La norme `SQL ANSI` standard spécifie l'utilisation des guillemets doubles, mais chaque système a développé ses propres conventions alternatives. L'important est d'être cohérent dans l'utilisation de ces délimiteurs au sein d'un même système.


D'autres systèmes de gestion de bases de données utilisent différentes conventions pour résoudre le problème des identifiants qui pourraient entrer en conflit avec les mots réservés SQL. Voici comment ils gèrent cette situation:

1. **`PostgreSQL`** utilise des guillemets doubles (`"`) pour délimiter les identifiants:
   ```sql
   SELECT "id", "name" FROM "user" WHERE "role" = 'admin';
   ```

2. **`SQL Server`** utilise des crochets (`[]`) ou des guillemets doubles (`"`):
   ```sql
   SELECT [id], [name] FROM [user] WHERE [role] = 'admin';
   -- OU
   SELECT "id", "name" FROM "user" WHERE "role" = 'admin';
   ```

3. **`Oracle Database`** utilise des guillemets doubles (`"`):
   ```sql
   SELECT "ID", "NAME" FROM "USER" WHERE "ROLE" = 'admin';
   ```

4. **`SQLite`** accepte les guillemets doubles (`"`), les crochets (`[]`) ou les backticks (`` ` ``):
   ```sql
   SELECT "id", "name" FROM "user" WHERE "role" = 'admin';
   -- OU
   SELECT [id], [name] FROM [user] WHERE [role] = 'admin';
   -- OU
   SELECT `id`, `name` FROM `user` WHERE `role` = 'admin';
   ```

