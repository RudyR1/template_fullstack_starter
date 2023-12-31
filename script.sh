#!/bin/bash

# Demande à l'utilisateur le nom du projet
read -p "Veuillez entrer le nom du projet : " project_name

# Crée le projet React avec Npm
echo "Création du projet avec Npm : $project_name"
npm create vite@latest "$project_name"

# Se déplace dans le répertoire du projet
cd "$project_name"

# Installer les dépendances
npm install

# Supprime les fichiers spécifiés
rm -rf src/assets/react.svg
rm -rf src/assets/favicon.svg
rm -rf src/App.test.js
rm -rf src/setupTests.js
rm -rf src/reportWebVitals.js
rm -rf public
rm -rf src
rm -rf index.html

# Créer les dossiers du backend spécifiés
mkdir backend && npm install
mkdir backend/public
mkdir backend/public/assets
mkdir backend/src
mkdir backend/src/controllers
mkdir backend/src/models
mkdir backend/src/services

# Créer les fichiers du backend spécifiés
touch backend/src/controllers/authControllers.js
touch backend/src/controllers/userControllers.js

touch backend/src/models/AbstractManager.js
touch backend/src/models/index.js
touch backend/src/models/UserManager.js
touch backend/src/app.js
touch backend/src/router.js

touch backend/.env.sample
touch backend/.env
touch backend/database.sql
touch backend/index.js
touch backend/migrate.js

# Créer les dossiers du frontend spécifiés
mkdir frontend && npm install
mkdir frontend/src
mkdir frontend/src/assets
mkdir frontend/src/components
mkdir frontend/src/context
mkdir frontend/src/layouts
mkdir frontend/src/pages
mkdir frontend/src/services

# Créer les fichiers du frontend spécifiés
touch frontend/.env
touch frontend/.env.sample
touch frontend/index.html
touch frontend/src/App.jsx
touch frontend/src/App.scss
touch frontend/src/main.jsx
touch frontend/src/styles.scss

# Remplace le contenu de src/App.jsx
echo 'import React from "react";
import "./App.css";

function App() {
  return (
    <div>
      <h1>Welcome to your React 🚀 app!👋 </h1>
    </div>
  );
}

export default App;' > frontend/src/App.jsx

# Remplis le contenu du fichier index.html de frontend
echo '<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8" />
    <link
      rel="icon"
      type="image/svg+xml"
      href="./src/assets/faviconEmmaus.png"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Emmaüs Connect - c{hack}ahuète project</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>' > frontend/index.html

# Supprimer l'index.html dans la source du projet
rm -rf index.html

# Modifie le contenu de src/App.scss
echo 'h1 {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 8rem;
  font-size: 3rem;
  text-decoration: underline;
  color: #222222;
}' > frontend/src/App.scss

# Remplis le contenu du fichier migrate.js
curl -o backend/migrate.js "https://raw.githubusercontent.com/RudyR1/template_fullstack_starter/main/migrate.js"

# Remplis le contenu des fichiers .env.sample dans le back et le frontend
curl -o frontend/.env.sample "https://raw.githubusercontent.com/RudyR1/template_fullstack_starter/main/.env.sample-front"
curl -o backend/.env.sample "https://raw.githubusercontent.com/RudyR1/template_fullstack_starter/main/.env.sample"

# Remplis le fichier index.js du backend
curl -o backend/index.js "https://raw.githubusercontent.com/RudyR1/template_fullstack_starter/main/index.js"

# Remplis le fichier AbstractManager du models/backend
curl -o backend/src/models/AbstractManager.js "https://raw.githubusercontent.com/RudyR1/template_fullstack_starter/main/abstractmanager"

# Remplis le fichier Index.js du models/backend
curl -o backend/src/models/index.js "https://raw.githubusercontent.com/RudyR1/template_fullstack_starter/main/index-for-models"

# Met à jour le contenu de src/styles.scss
echo '/* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

html,
body,
div,
span,
applet,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
big,
cite,
code,
del,
dfn,
em,
img,
ins,
kbd,
q,
s,
samp,
small,
strike,
strong,
sub,
sup,
tt,
var,
b,
u,
i,
center,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
canvas,
details,
embed,
figure,
figcaption,
footer,
header,
hgroup,
menu,
nav,
output,
ruby,
section,
summary,
time,
mark,
audio,
video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
menu,
nav,
section {
  display: block;
}
body {
  line-height: 1;
}
ol,
ul {
  list-style: none;
}
blockquote,
q {
  quotes: none;
}
blockquote:before,
blockquote:after,
q:before,
q:after {
  content: "";
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}' > frontend/src/styles.scss

# Supprime l'import et l'utilisation de reportWebVitals dans main.jsx
echo 'import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);' > frontend/src/main.jsx

# Écrase le contenu du fichier README.md
echo "# $project_name

Ce projet est un starter kit pour développer des applications React.

## Comment lancer le projet

1. Clonez ce dépôt et accédez au répertoire du projet :

   \`\`\`bash
   git clone <URL_DU_REPOT>
   cd $project_name
   \`\`\`

2. Installez les dépendances avec Yarn :

   \`\`\`bash
   yarn install
   \`\`\`

3. Lancez le projet en mode développement :

   \`\`\`bash
   yarn start
   \`\`\`" >  README.md

# Message de fin 
echo "Le projet a été créé avec succès. Bon développement! 🌈🎉😊"

# Ouvre le projet dans Visual Studio Code
code .

# # Se déplace dans le répertoire du projet pour lancer le projet avec yarn 
# start
# cd "$project_name"

# # Lance le projet avec yarn start
# yarn start