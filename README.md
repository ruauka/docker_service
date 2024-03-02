## Overview

Сервис на `flask` упакованный в `docker`

## Content

- [Project](#project)
- [Venv](#venv)
- [Start](#start)
- [Docker](#docker)

### Project

- `app.py` - py код сервиса
- `requirements.txt` - файл с зависимостями проекта
- `Dockerfile` - файл инструкциями сборки образа сервиса
- `Makefile` - исполняемый справочник команд проекта
- `.gitignore` - то, что не нужно коммитить в git

### Venv

Требуется создать виртуальное окружение (папка `venv`).
В Pycharm создается автоматически, при инициализации нового проекта.

Создание venv вручную на `Windows`:

```bash
python -m venv venv
```

Активация venv вручную на `Windows`:

```bash
venv\Scripts\activate.bat
```

### Start

Локальный запуск.

Копирование с `git`:

```bash
git clone https://github.com/ruauka/docker_service.git
```

1. Требуется установить все зависимости проекта:

```bash
pip install -r requirements.txt
```

2. Локальный запуск сервиса:

```bash
python app.py
```

Сервис доступен на `localhost:8080`. (localhost - это `127.0.0.1`. Можно использовать любое значение)

3. Healthcheck - `get` запрос на http://localhost:8080/health

4. Логика - `post` запрос на http://localhost:8080/execute

Входной вектор:

```json
{
  "name": "Aleksei",
  "surname": "Krasnov",
  "middle_name": "Mixailovich"
}
```

Выходной вектор:

```json
{
  "fio": "Krasnov Aleksei Mixailovich"
}
```

### Docker

Упаковака сервиса в докер.

Команды лежат в `Makefile`.

`Make` - Unix плагин, но на Windows тоже можно поставить.
Если нет, то копипаста команд.

1. Создание образа из `Dockerfile`:

```bash
make build
```

2. Запуск контейнера из созданного образа:

```
make run
```

Остановка, удаление и остальные команды смотри в `Makefile`.

Запросы к сервису такие же, как и при локальном запуске.