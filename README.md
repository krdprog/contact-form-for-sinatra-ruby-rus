# Форма заявки для Sinatra (Ruby) сайта. Русская версия.

Форма заявки реализована для внедрения в проект на Sinatra (Ruby). Данные отправленные в форму заявки сохраняются в базе данных SQLite.

## Описание:
Для работы формы требуется установить и подключить гемы:

bash:
```bash
gem install sinatra
gem install sqlite3
```
в app.rb:
```ruby
require 'sinatra'
require 'sqlite3'
```

## Запуск приложения:

1. Перейти в каталог app

bash:
```bash
cd app/
```

2. Запустить приложение:

bash:
```bash
ruby app.rb
```

3. Открыть в браузере http://localhost:4567/

4. Заполнить форму и отправить данные.

5. В каталоге **/app** будет создана база данных **base.db**

6. Получение информации из базы данных:

bash:
```bash
sqlite3 base.db
```
Внутри sqlite3:
```sql
SELECT * FROM Messages;
```