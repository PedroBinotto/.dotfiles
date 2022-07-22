let g:RunBackend = 'cd $(git rev-parse --show-toplevel)$(echo "/app-bundle") && mvn spring-boot:run -Dspring.profiles.active=dev,dev-postgres'
let g:RunFrontend = 'cd $(git rev-parse --show-toplevel)$(echo "/frontend") && yarn start:experimental'
let g:RunTests = 'cd $(git rev-parse --show-toplevel)$(echo "/frontend") && yarn test'
let g:BuildApp = '$(git rev-parse --show-toplevel) && mvn clean install -DskipTests'

