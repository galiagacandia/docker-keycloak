# Temas de Keycloak - RUAT

Proyecto que contiene temas base para las aplicaciones RUAT, basados en el tema `keycloak` que viene en los temas de KEYCLOAK.

## Version Keycloak

La version de keycloak 15.0.2

# Trabajar localmente

Se bajara una version de keycloak (15.0.2) y se instalara segun su sitio oficial en, Keycloak on OpenJDK:
https://www.keycloak.org/getting-started/getting-started-zip, una vez levantado se puede trabajar en su carpeta `themes`.

## Bajar el proyecto en tu folder de keycloak

Si se desea trabajar el tema en una carpeta local de keycloak ejecutar lo siguiente en la ruta `%KEYCLOAK_HOME%\themes`

    git init
    git remote add http://172.21.129.42:17080/desarrollo/keycloakadiciones/temas-keycloak.git
    git fetch
    git checkout <NOMBRE_RAMA>
    git pull

Modificar el archivo `%KEYCLOAK_HOME%\standalone\configuration\standalone.xml` con el siguiente contenido, para no cachear el tema:

    <server xmlns="urn:jboss:domain:16.0">
        ...
        <profile>
            ...
            <subsystem xmlns="urn:jboss:domain:keycloak-server:1.1">
                ...
                <theme>
                    <staticMaxAge>-1</staticMaxAge>
                    <cacheThemes>false</cacheThemes>
                    <cacheTemplates>false</cacheTemplates>
                    <dir>${jboss.home.dir}/themes</dir>
                </theme>

Levantar keycloak, ir al %KEYCLOAK_HOME% y ejecutar

    ./bin/standalone.sh -Djboss.socket.binding.port-offset=1000