Тестовое задание:

Минимальный стек разработки – Rails 5, PostgreSQL.
Язык приложения – английский.

Необходимо реализовать примитивную CMS – Content Management System. Пользователи могут добавлять-просматривать-редактировать-удалять (CRUD) страницы приложения.

Минимальный набор атрибутов страницы:
title – строка для отображения в /html/head/title.
description – строка для отображения в /html/head/meta{name='description'}
slug – строка, служащая URL идентификатором страницы. То есть, вместо URL вида “http://127.0.0.1:3000/1” будет использоваться URL вида “http://127.0.0.1:3000/#{slug}”
menu_label – строка для отображения ссылки на данную статью в главном меню приложения
h1 – строка для отображения в /html/body/h1
content – HTML код, собственно содержание страницы. Редактирование данного поля произвонится в формате HTML.
published_at – дата и время для публикации данной страницы.
priority – число, характеризующее “важность” данной страницы.

Нет необходимости реализовывать роли пользователей, процедуру аутентификации и т.п - весь функционал приложения свободно доступен.

Структура WEB представления:
menu:
список ссылок на опубликованные (published_at >= NOW()) страницы приложения, отсортированные по приоритетности (priority атрибут).
кпопка показывающая/прячущая (toogle) ссылки в меню на неопубликованные страницы.
кнопка добавления новой страницы.
content view:
отображение текущей страницы.
кнопка редактирования  текущей страницы.
кнопка удаления текущей страницы.
content edit:
Форма редактирования текущей или новой страницы.
Кнопки “Save” и “Cancel”.
