dev:
  preparação
    - npm install
    - npx prisma generate

  exec 
    - npm run dev

prod:
  prep
    - npm install
    - npx prisma generate
    - npm build
    - npm prune --production

  exec
    - npm start