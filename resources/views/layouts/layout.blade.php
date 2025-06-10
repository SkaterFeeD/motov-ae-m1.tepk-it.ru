<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="icon" href="{{ asset('/assets/images/our-decor.ico') }}">
    <link rel="stylesheet" href="{{ asset('/assets/css/style.css')}}">
</head>

<body>

<header class="additionBackground">
    <nav class="navbar navbar-expand-lg navbar-light mb-4">
        <div class="container-fluid justify-content-start">
            <a class="navbar-brand d-flex align-items-center" href="{{ route('welcome') }}">
                <img src="{{ asset('/assets/images/our-decor.png') }}" alt="Логотип" width="75" class="me-3">
                <span class="fw-bold">Главная</span>
            </a>
            <a class="navbar-brand d-flex align-items-center" href="{{ route('products.index') }}">
                <span class="fw-bold">Продукты</span>
            </a>
        </div>
    </nav>
</header>

<main>
    @yield('content')
</main>

<footer>

</footer>

</body>

</html>
