vim.g.RunBackend = 'cd $(git rev-parse --show-toplevel)$(echo "/backend") && mvn spring-boot:run'
vim.g.RunFrontend = 'cd $(git rev-parse --show-toplevel)$(echo "/frontend") && npm start'
vim.g.RunTests = 'cd $(git rev-parse --show-toplevel)$(echo "/frontend") && npm test'
vim.g.BuildApp = "$(git rev-parse --show-toplevel) && mvn clean install -DskipTests"
