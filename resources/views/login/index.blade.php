<!DOCTYPE html>
<html lang="en">
<head>
<title>{{ $settings->app_name }}</title>
	<!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">

	<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
</head>
<body id="loginBody">

<div style="">
<div class="container align-in-the-center">

        <form method="POST" action="{{ route('login') }}">
		@csrf
<div class="row login ">
	<div class="col s12">
		<div class="card z-depth-5 login_box">
			<div class="card-action {{ $settings->app_color }} white-text center-align" style="padding: 0px 0px 1px 0px;">
			<h5>{{ $settings->app_name }}</h5>

			</div>
			<div class="card-content">


                        <div class="row">
                        <div class="col s12">


<div class="input-field">
<input type="email" id="login_email" name="email"  class="validate" />
<label for="email">Email</label>
<span class="helper-text" data-error="Invalid Email Address"></span>
</div>

                       </div>
                        <div class="col s12">


<div class="input-field">
<input type="password" id="login_pass" name="password" class="validate" />
<label for="password">Password</label>

</div>


                       </div>
					   <div class="col md6">
						   
					         <label>
        <input type="checkbox" class="checkbox_check_color" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }} />
        <span>{{ __('Remember Me') }}</span>
      </label>

									</div>
					   
                       </div>




<div class="input-field center-align">
	<button class="blue darken-4 hoverable btn-small" type="submit" id="loginBTN" name="action">Login
		<!-- <i class="material-icons right">send</i> -->
	</button>
	<i id="caret" class="fas fa-caret-down white-text" style="cursor: pointer;" onclick="userPass(this.className)"></i>
</div>


		<div class="center-align" id="passBTN" style="display: none;">
			<a id="admin" class="waves-effect waves-light btn {{ $settings->app_color }} hoverable btn-small" onclick="login_fill(this.id)">Admin</a>
			<a id="hr" class="waves-effect waves-light btn {{ $settings->app_color }} hoverable btn-small" onclick="login_fill(this.id)">HR</a>
			<a id="manager" class="waves-effect waves-light btn {{ $settings->app_color }} hoverable btn-small" onclick="login_fill(this.id)">Manager</a>
			<a id="employee" class="waves-effect waves-light btn {{ $settings->app_color }} hoverable btn-small" onclick="login_fill(this.id)">Employee</a>
		</div>
			</div>

		</div>
	</div>
</div>
        </form>
</div>
</div>





<script>

  $(document).ready(function(){
	$('.modal').modal();
	$('select').formSelect();
	$('input#input_text, textarea#textarea2').characterCounter();
	$('#versionNo').click(function(){
		$('#modal1').modal('open');
	});
	$('#sendFeedback').click(function(){
		$('#sendMessage').modal('open');
	});

  });


		  function userPass(classN){
			  if(classN.includes("down")){
				document.getElementById("caret").classList.remove("fa-caret-down");
				document.getElementById("caret").classList.add("fa-caret-up");
				document.getElementById("passBTN").style.display = "block";
			  }
			  else if(classN.includes("up")){
				document.getElementById("caret").classList.remove("fa-caret-up");
				document.getElementById("caret").classList.add("fa-caret-down");
				document.getElementById("passBTN").style.display = "none";
			  }
		  }

 function login_fill(clicked_id){
	 if(clicked_id == "admin"){
		 document.getElementById('login_email').value = "admin@ferius.com";
		 document.getElementById('login_pass').value = "ferius";
		 document.getElementById('loginBTN').click();
	 }
	 else if(clicked_id == "hr"){
		 document.getElementById('login_email').value = "hr@alhaddadits.com";
		 document.getElementById('login_pass').value = "200000000";
		 document.getElementById('loginBTN').click();
	 }
	 else if(clicked_id == "manager"){
		 document.getElementById('login_email').value = "manager@alhaddadits.com";
		 document.getElementById('login_pass').value = "200000000";
		 document.getElementById('loginBTN').click();
	 }
	 else if(clicked_id == "employee"){
		 document.getElementById('login_email').value = "employee@alhaddadits.com";
		 document.getElementById('login_pass').value = "200000000";
		 document.getElementById('loginBTN').click();
	 }
	 M.updateTextFields();
 }

</script>


</body>
</html>
