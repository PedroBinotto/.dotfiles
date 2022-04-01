let g:RunBackend = 'cd $(git rev-parse --show-toplevel)$(echo "/backend") && mvn spring-boot:run -Dspring.profiles.active=dev,dev-postgres'
let g:RunFrontend = 'cd $(git rev-parse --show-toplevel)$(echo "/frontend") && yarn start'
let g:BuildApp = '$(git rev-parse --show-toplevel) && mvn clean install -DskipTests'

