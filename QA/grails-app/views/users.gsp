<!DOCTYPE html>
<html lang="en">
<head>
  <title>Gask</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap_min.css')}" type="text/css">
 		<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
  		<script src="${resource(dir: 'js', file: 'bootstrap_min.js')}"></script>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'navbar.css')}" type="text/css">
		
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

<div class="row">
  <g:each var="user" in="${users}">
    <div class="col-sm-4">
      <div class="panel panel-default">
      	  <g:link controller="question" action="getQuestionsByUser"  params="['id': user.id]">${user.userName}</g:link>
      	<div class="row">
         <div class="col-sm-9">${user.questions.size()} asks</div><br/>
         <div class="col-sm-9">${user.answers.size()} answers</div><br/>
           <g:each var="tag" in="${user.tags}">
             <div class="col-sm-3"><g:link controller="question" action="getQuestionsByTag"  params="['tagName': tag.name]">${tag.name}</g:link></div>
           </g:each>
             </div>
         </div>
       </div>
   </g:each>   
     </div>
</body>
</html>