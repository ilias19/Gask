<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Gask</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
		<script src="${resource(dir: 'js', file: 'utilities.js')}"></script>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'styles.css')}" type="text/css">
	</head>
	<body>
<!--login modal-->
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h1 class="text-center">Login</h1>
      </div>
      <div class="modal-body">
          <g:form class="form col-md-12 center-block" controller="user">
           
             <div class="form-group">
              <g:field type="email" name="email" value="Email" onfocus="clearContents(this);" class="form-control input-lg"/>
            </div>
            <div class="form-group">
              <g:passwordField name="password" value="Password" onfocus="clearContents(this);" class="form-control input-lg"/>
            </div>
                  
            <div class="form-group">
              <g:actionSubmit value="Login" action="find" class="btn btn-primary btn-lg btn-block"/>
              <span class="pull-right"><g:link url="${resource(dir:'views', file:'register.gsp')}">Register</g:link></span><span><a href="#">Need help?</a></span>
            </div>
          </g:form>
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          <span class="pull-right"><g:link url="[action:'getQuestions',controller:'question']">Cancel</g:link></span>
		  </div>	
      </div>
  </div>
  </div>
</div>
	<!-- script references -->
		<script src="${resource(dir: 'js', file: 'jquery2.0.2.js')}"></script>
		<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
	</body>
</html>