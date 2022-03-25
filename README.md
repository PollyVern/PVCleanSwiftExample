# PVCleanSwiftExample
Приложение построено на архитектуре CleanSwift.

<p align="center">
<img src="https://github.com/PollyVern/PVCleanSwiftExample/blob/e098d99c369636beddcd5edfba10615ddb093872/Icon.png" width="100">
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
<img src="https://github.com/PollyVern/PVCleanSwiftExample/blob/e098d99c369636beddcd5edfba10615ddb093872/%D0%94%D0%BB%D1%8F%20Readme%20PVCleanSwiftExample.png" width="800">
</p>

## Для работы с приложением нужно добавить API ключ из файла!

### API ключ
Cоздайте API ключ и занесите его в переменную окружения Xcode. А именно:

1. Зарегистрируйтесь на вышеуказанном сайте и перейдите на страницу https://www.themoviedb.org/settings/api.
2. Скопируйте "Ключ API (v3 auth)"

3. Перейдите в `Xcode` -> `Edit Scheme...` -> ...

<img src="https://github.com/PollyVern/PVMovieAPI/blob/85598523c9abd0428a3ac532d7763b2e84010068/Screenshot%20-%20Edit.png" width="200">

... -> `Run` -> `Arguments` -> `Environment Variables`
<img src="https://github.com/PollyVern/PVMovieAPI/blob/0608e64b368235487b33062ff18dedd933d4aa39/Screenshot%20-%20Propertys.png" width="700">

И создайте новую переменную окружения с именем **"APIkey"**(!!!). В значение вставьте ключ API.
