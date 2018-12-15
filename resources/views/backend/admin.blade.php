@extends('backend/index')

@section('content')
    <admin_home :user="{{ Auth::user() }}"></admin_home>
@endsection
