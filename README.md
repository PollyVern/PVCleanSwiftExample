# PVCleanSwiftExample
Приложение построено на архитектуре CleanSwift.

<p align="center">
<img src="https://github.com/PollyVern/ContentForRepositories/blob/746b8d0f552ba024f648228adae4aaca702c7614/CleanSwiftArc.png">
</p>


Использованы стеки:
- CleanSwift
- UICollectionView
- Core Graphics
- URLSession
- UIMessage
- Git
- Auto Layout

## Превью приложения
<p align="center">
<img src="https://github.com/PollyVern/ContentForRepositories/blob/e7840d2b9c33eec0befb6542e559c0ee6fcd3aea/PreviewCleanSwiftExample.png" width="500">
</p>

## Для работы с приложением нужно добавить API ключ из файла!

### API ключ
Cоздайте API ключ и занесите его в переменную окружения Xcode. А именно:

1. Зарегистрируйтесь на вышеуказанном сайте и перейдите на страницу https://www.themoviedb.org/settings/api.
2. Скопируйте "Ключ API (v3 auth)"

3. Перейдите в `Xcode` -> `Edit Scheme...` -> ...

<img src="https://github.com/PollyVern/ContentForRepositories/blob/d3f3e2ef4094aa422b7e218413182c4ab798e91f/Environment%20variable%20-%20Edit.png" width="200">

... -> `Run` -> `Arguments` -> `Environment Variables`

<img src="https://github.com/PollyVern/ContentForRepositories/blob/d3f3e2ef4094aa422b7e218413182c4ab798e91f/Environment%20variable%20-%20Propertys.png" width="300">

И создайте новую переменную окружения с именем **"APIkey"**(!!!). В значение вставьте ключ API.
