# KeyCloak con Angular, SpringSecurity y Spring Boot
KeyCloak implementado con Angular, SpringSecurity y Spring Boot. 

Basado en la siguiente serie de tres artículos: https://medium.com/@pavankjadda/keycloak-with-angular-and-spring-boot-65ef06b83347

Instalación:
- Docker composer para el servidor de Keycloak.

Ejecución:
- Ejecutar el servidor de Keycloak en el cliente de Docker.
- En VSC abrir tres sesiones:
  - Una para el backend desde el <home>:
    mvn clean
    mvn spring-boot:run
  - Otra para el proxy que evita problemas relativos a CORS:
    lcp --proxyUrl http://localhost:8082
  - La última para el frontend desde <home>\src\main\webapp\spring-data-ui
    npm cache clean --force
    npm start
 - Para configurar Keycloak: 
    - http://localhost:8080/oauth con el usuario admin y contraseña Test@2020
    - Realm: spring-boot-quickstart
    - Clientes: angular-app y rest-backend
    - Roles: ROLE_ADMIN y ROLE_GESTOR
    - Usuarios: pgirala, pgalvez, sgpf0078 y sgpf0060 todos con la contraseña Test@2020
 - Para entrar en la aplicación:
    - http://localhost:4200
 - En la carpeta resources hay dos peticiones para Postman: una con la petición del token para angular-app (atención que el acceso debe ser libre porque, al ejecutarse en el navegador del usuario en producción, no se puede guardar la clave secreta) y otra con el uso del token para rest-backend (aquí sí se usa la clave secreta).


