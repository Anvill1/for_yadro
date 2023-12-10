# ARGCOMPLETE

- Для добавляния пакетов/зависимостей из pip3 необходимо указать их внутри **setup.py**, перечислив внутри *install_requires*

- Для сборки и установки модуля armcomplete из deb пакета применена **multistage сборка**

- Для изменения имени пакета или его версию при сборке можно передать аргументы **PACKAGE_NAME** и **VERSION**

## Кто кого тянет, чтобы вытянуть репку?

Dockerfile :arrow_right: build.sh :arrow_right: Makefile :arrow_right: setup.py