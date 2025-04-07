# КРОК 1: Базовий образ Python
FROM python:3.11.9-slim

# КРОК 2: Встановлення системних залежностей
RUN apt-get update && apt-get install -y curl

# КРОК 3: Встановлення Poetry
RUN curl -sSL  https://install.python-poetry.org | python3 -

# КРОК 4: Додати poetry до PATH
ENV PATH="/root/.local/bin:$PATH"

# КРОК 5: Робоча директорія в контейнері
WORKDIR /app

# КРОК 6: Скопіювати всі файли проєкту у контейнер
COPY . .

# КРОК 7: Встановити залежності через Poetry
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# КРОК 8: Встановити стандартну команду запуску
CMD ["python", "/app/tests/hw-02.py"]
