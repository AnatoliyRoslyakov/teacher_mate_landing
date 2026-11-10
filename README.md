# TeacherMate

TeacherMate — приложение для репетиторов. В одном расписании преподаватель видит занятия и оплаты, может открыть карточку ученика и добавить домашнее задание. Этот репозиторий содержит лендинг на Flutter Web.

[Скачать в App Store](https://apps.apple.com/ru/app/id6605933778) · [Скачать в RuStore](https://www.rustore.ru/catalog/app/com.anatolyrosliakov.teacher_mate)

## О продукте

Я создал TeacherMate от идеи до релиза, написал мобильный клиент на Flutter и сервер на Go. Приложением пользуются более 2 000 человек. После выхода добавил групповые занятия, интеграцию с системным календарём и копирование расписания на следующую неделю.

## Запуск лендинга

Установите Flutter с версией Dart, совместимой с ограничением в [pubspec.yaml](pubspec.yaml). Из корня проекта выполните команды ниже.

```sh
flutter pub get
flutter run -d chrome
```

Для веб-сборки выполните `flutter build web`. Результат появится в `build/web`.

[Шаблон iPhone 15 для макетов](https://mockuphone.com/model/iphone-15/).
