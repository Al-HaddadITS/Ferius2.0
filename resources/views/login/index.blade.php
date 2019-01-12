<!DOCTYPE html>
<html lang="en">
<head>
<title>{{ $settings->app_name }}</title>
    <!-- Meta-Tags -->

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
    <meta name="csrf-token" content="{{ csrf_token() }}" />


    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

</head>
<body>


    <div id="app">
        {{-- <login></login> --}}
        <main-vue></main-vue>
    </div>




    <script src="{{ asset('js/app.js') }}"></script>



</body>
</html>
