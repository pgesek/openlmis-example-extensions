# OpenLMIS Example Extensions
This example is a Docker image containing extensions of openlmis-example service. It is meant to demonstrate how extensions are added to openlmis-ref-distro.


## Quick start
1. Fork/clone this repository from GitHub.
 ```shell
 git clone https://github.com/OpenLMIS/openlmis-example-extensions.git
 ```
2. Add an environment file called `.env` to the root folder of the project, with the required 
project settings and credentials. For a starter environment file, you can use [this 
one](https://github.com/OpenLMIS/openlmis-config/blob/master/.env).
3. Start up the application.
 ```shell
 docker-compose -f ref-distro-example-docker-compose.yml up
 ```
4. Go to `http://<yourDockerIPAdress>/api/extensionPoint` to see
that the extended implementation of OrderQuantity interface is used. See [Adding extension points](#extensionpoints).


## Integration with openlmis-ref-distro
1. Fork/clone `openlmis-ref-distro` repository from GitHub.
 ```shell
 git clone https://github.com/OpenLMIS/openlmis-ref-distro.git
 ```
2. Replace the contents of the Reference Distribution's docker-compose.yml with ref-distro-example-docker-compose.yml from this repository. 
See [Configuring the Reference Distribution](#configuringrefdistro).
3. Start up openlmis-ref-distro.
 ```shell
 docker-compose up
 ```
 
## <a name="extensionpoints">Adding extension points</a>
1. Add extension to the "dependencies" configuration in build.gradle:
```
    extension "org.openlmis:openlmis-example-extension:0.0.1-SNAPSHOT"
```
2. Modify extensions.properties with name of the extended component.
```
    OrderQuantity=AMCOrderQuantity
```


## <a name="configuringrefdistro">Configuring openlmis-ref-distro</a>
The Reference Distribution is configured to use extension modules by defining a named volume that is common to the service and partner image. 
```
volumes:
  example-extensions:
    external: false
```
The shared volume contains extension jars and extension point configuration. The role of this image is to copy them at startup so they may be read by the service.

An example configuration can be found in `ref-distro-example-docker-compose.yml`.
