vim.g.RunBackend =
	'cd $(git rev-parse --show-toplevel)$(echo "/backend") && mvn spring-boot:run -Dspring.profiles.active=dev,dev-postgres'
vim.g.RunFrontend = 'cd $(git rev-parse --show-toplevel)$(echo "/frontend") && yarn start'
vim.g.RunTests = 'cd $(git rev-parse --show-toplevel)$(echo "/frontend") && yarn test'
vim.g.BuildApp = "$(git rev-parse --show-toplevel) && mvn clean install -DskipTests"
