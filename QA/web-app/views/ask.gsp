<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Gask</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<script src="${resource(dir: 'js', file: 'jquery-1.10.2.min.js')}"></script>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.minn.css')}" type="text/css">
	<script src="${resource(dir: 'js', file: 'bootstrap.minn.js')}"></script>
	<script src="${resource(dir: 'js', file: 'utilities.js')}"></script>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap_min.css')}" type="text/css">
 		<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
  		<script src="${resource(dir: 'js', file: 'bootstrap_min.js')}"></script>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'navbar.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'tags.css')}" type="text/css">
    <script src="${resource(dir: 'js', file: 'tags.js')}"></script>
    <script src="${resource(dir: 'js', file: 'autofill.js')}"></script>
     <script>
			$(function() {
				$("#tags").tags();
				
			});

			function stopEnterSubmitting(e) {
			    if (e.keyCode == 13) {
			        var src = e.srcElement || e.target;
			        if (src.tagName.toLowerCase() != "textarea") {
			            if (e.preventDefault) {
			                e.preventDefault();
			            } else {
			                e.returnValue = false;
			            }
			        }
			    }
			}
		</script>
</head>
<body>
<nav class="navbar navbar-inverse" >
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Gask</a>
    </div>
    <ul class="nav navbar-nav">
      <li><g:link url="[action:'getQuestions',controller:'question']">Home</g:link></li>
      <li><g:link url="[action:'getQuestions',controller:'question']">Questions</g:link></li>
      <li><g:link url="${resource(dir:'views', file:'ask.gsp')}">Ask a question</g:link></li> 
     <li><g:link url="[action:'getTags',controller:'tag']">Tags</g:link></li>
      <li><g:link url="[action:'getUsers',controller:'user']">Users</g:link></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <g:if test= "${session.getAttribute("logged")== true}">
      <li><g:link url="${resource(dir:'views', file:'profile.gsp')}">Profile</g:link></li>
      <li><g:link url="[action:'logout',controller:'user']"><span class="glyphicon glyphicon-user"></span> Logout</g:link></li>
      <li><g:link url="#"><span class="glyphicon glyphicon-log-in"></span> ${session.getAttribute("user").userName}</g:link></li>
     </g:if>
     <g:else>
       <li><g:link url="${resource(dir:'views', file:'register.gsp')}"><span class="glyphicon glyphicon-user"></span> Sign Up</g:link></li>
      <li><g:link url="${resource(dir:'views', file:'login.gsp')}"><span class="glyphicon glyphicon-log-in"></span> Login</g:link></li>
     </g:else> 
    </ul>
  </div>
</nav>
<div class="container">

<!-- Contact Form - START -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                <g:form class="form-horizontal" controller="question" onkeypress="stopEnterSubmitting(window.event)">
                    <fieldset>
                        <legend class="text-center header">Ask a question</legend>

                       <div class="form-group">
                           <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                           <div class="col-md-8">
              				<g:textField name="title" value="title"  onfocus="clearContents(this);" class="form-control input-lg"/>
              			   </div>	
            		   </div>                    
                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
                            <div class="col-md-8">
                                <g:textArea name="content" value="content" rows="10" onfocus="clearContents(this);" class="form-control input-lg"/>
                            </div>
                        </div>
                         <div class="form-group">
                           <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                           <div class="col-md-8">
              				<g:textField name="tags" value="" rows="10" class="form-control input-lg"/>
              			   </div>	
            		   </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <g:actionSubmit value="Ask" action="save" class="btn btn-primary btn-lg"/>
                            </div>
                        </div>
                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>
</div>

<style>
    .header {
        color: #36A0FF;
        font-size: 27px;
        padding: 10px;
    }

    .bigicon {
        font-size: 35px;
        color: #36A0FF;
    }
</style>



</div>

</body>
</html>