<!DOCTYPE html>
<html lang="en">
<head>
        {{-- <!-- Web Application Manifest --> --}}
        <link rel="manifest" href="/manifest.json">
        {{-- <!-- Chrome for Android theme color --> --}}
        <meta name="theme-color" content="#000000">

        {{-- <!-- Add to homescreen for Chrome on Android --> --}}
<meta name="mobile-web-app-capable" content="yes">
<meta name="application-name" content="PWA">
<link rel="icon" sizes="512x512" href="/images/icons/icon-512x512.png">

{{-- <!-- Add to homescreen for Safari on iOS --> --}}
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="PWA">
<link rel="apple-touch-icon" href="/images/icons/icon-512x512.png">

{{-- <!-- Tile for Win8 --> --}}
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/images/icons/icon-512x512.png">


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>{{ $settings->app_name }}</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">


    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons' rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/animate.css@3.5.1" rel="stylesheet" type="text/css">



        <link href="{{ asset('css/app.css') }}" rel="stylesheet">
        <link href="{{ asset('css/cards.css') }}" rel="stylesheet">

</head>
<body>
    <div id="app">

        @yield('content')
    </div>

    <script src="https://cdn.jsdelivr.net/npm/vue-mce@1.5.0/dist/vue-mce.web.js"></script>
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=8vg7aylhgr5nwcnq7fzajhqcfehqvrzyaog4226rl7mymtd1"></script>

<script src="{{ asset('js/app.js') }}"></script>

<script>
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.register('/serviceworker.js', {
                scope: '.'
            }).then(function (registration) {
                // Registration was successful
                console.log('Laravel PWA: ServiceWorker registration successful with scope: ', registration.scope);
            }, function (err) {
                // registration failed :(
                console.log('Laravel PWA: ServiceWorker registration failed: ', err);
            });
        }
</script>
</body>
</html>
