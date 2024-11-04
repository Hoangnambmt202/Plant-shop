## B1: cài các gói cần thiết

trước tiên mở Terminal tại dự án đang chạy sau đó chạy lệnh sau:

`cd backend`

cài đặt db:seed :

```
php artisan migrate

php artisan db:seed
```

Cài đặt passport

```
composer require laravel/passport
php artisan passport:install
php artisan migrate

php artisan storage:link
```

nếu storage chạy lỗi thì vào `public` xoá folder `storage` xong chạy lại lệnh trên là được.

- Lưu ý:

Nhớ bật serve của flutter và laravel lên :

```
//Nếu chưa vào thư mục thì chạy lệnh `cd` trước:

*laravel
cd backend
php artisan serve

*flutter
cd frontend
flutter run
```
