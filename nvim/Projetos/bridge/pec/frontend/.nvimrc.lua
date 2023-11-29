vim.g.RunBackend =
	'cd $(git rev-parse --show-toplevel)$(echo "/app-bundle") && mvn spring-boot:run -Dspring.profiles.active=dev,dev-postgres -Dbridge.flags.experimental=true'
vim.g.RunFrontend = 'cd $(git rev-parse --show-toplevel)$(echo "/frontend") && HTTPS=true BROWSER=none yarn start'
vim.g.RunTests = 'cd $(git rev-parse --show-toplevel)$(echo "/frontend") && yarn test'
vim.g.BuildApp = "$(git rev-parse --show-toplevel) && mvn clean install -DskipTests"
