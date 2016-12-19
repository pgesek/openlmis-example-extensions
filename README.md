# OpenLMIS Example Extensions
This example is a Docker image containing extensions of openlmis-example service. It is meant to demonstrate how extensions are added to openlmis-blue.


## Quick start
1. Fork/clone `openlmis-blue` repository from GitHub.
 ```shell
 git clone https://github.com/OpenLMIS/openlmis-blue.git
 ```
2. Replace the contents of blue's docker-compose.yml with blue-example-docker-compose.yml from this repository. 
See [Configuring blue](#configuringblue).
3. Start up openlmis-blue
 ```shell
 docker-compose up
 ```
4. Go to `http://<yourDockerIPAdress>/api/extensionPoint` to see
that the extended implementation of OrderQuantity interface is used. See [Adding extension points](#extensionpoints)

## <a name="extensionpoints">Adding extension points</a>
1. Add extension to the "dependencies" configuration in build.gradle:
```
    extension "org.openlmis:openlmis-example-extension:0.0.1-SNAPSHOT"
```
2. Modify extensions.properties with name of the extended component.
```
    OrderQuantity=AMCOrderQuantity
```


## <a name="configuringblue">Configuring openlmis-blue</a>
Blue is configured to use extension modules by defining a named volume that is common to the service and partner image. 
```
volumes:
  example-extensions:
    external: false
```
The shared volume contains extension jars and extension point configuration. The role of this image is to copy them at startup so they may be read by the service.

An example configuration can be found in `blue-example-docker-compose.yml`.
