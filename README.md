# Практическая работа №1. Макеты из Figma на Flutter

Реализовано 4 макета: 2 простых (страница 1) и 2 сложных (страница 2).

| Экран | Макет Figma | Файл |
|---|---|---|
| Welcome | простой, `Welcome` | `lib/screens/welcome_screen.dart` |
| Задачи | простой, `01` | `lib/screens/tasks_screen.dart` |
| Popular Menu | сложный, `21_Light_Popular Menu` | `lib/screens/food_menu_screen.dart` |
| Organizer | сложный, `43_Light_organizer of event about` | `lib/screens/organizer_screen.dart` |

## Запуск

```
flutter create .
flutter pub get
flutter run
```

`flutter create .` один раз добавляет папки платформ (android, ios, web, macos). Код из `lib/` не меняется.
Шрифты (Work Sans, Source Sans 3, Plus Jakarta Sans) подгружаются пакетом `google_fonts`, нужен интернет.
