# Vagrant pineboo

Este repo contiene la configuración de Vagrant para crear un sistema de desarrollo para [pineboo](https://github.com/deavid/pineboo)

## Quick Start

Aseggurate de tener instalado tanto 
[VirtualBox](http://www.virtualbox.org)
y posteriormente
[descargar e instalar Vagrant para tu sistema operativo](http://www.vagrantup.com/downloads).

Una vez instalado Vagrant, situa la carpeta pineboo de este repo dentro de la carpeta "Vagrant" que te ha generado la instalación.

Para levantar la máquina sólo hay que ejecutar
```
vagrant up
```

## Configuración

Puedes modificar el fichero **Vagrantfile** para determinar los paquetes que quieres instalar.

Por ejemplo, puedes comentar las lineas si quieres instalar un motor y otro de base de datos (o ninguno)

```
  config.vm.provision "shell", path: "db-mysql.sh"
  config.vm.provision "shell", path: "db-postgresql.sh"
```

También puedes modificar la IP en la línea

```
  config.vm.network "private_network", ip: "10.0.0.20"
```

Lo que si hay que configurar es la carpeta de **GIT** donde tengas o quieras situar los proyectos necesarios:

```
  config.vm.synced_folder "../../Documents/git", "/git" , owner: "root", group: "root"
```
Cambiando **../../Documents/git** por la ruta adecuada de tu sistema.

## Acceso a las herramientas

Para acceder a pineboo es necesario contar con las **X**, por lo que se puede acceder a ellas mediante el virtualbox (user y pass **vagrant**) o mediante el comando 

```
vagrant ssh
cd /git/pineboo
./pineboo
```
O bien mediante
```
ssh -X vagrant@10.0.0.20 (pass: vagrant)
cd /git/pineboo
./pineboo
```