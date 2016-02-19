<!DOCTYPE html>
<html>
	<head>
		<title>Gask</title>
	
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap_min.css')}" type="text/css">
 		<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
  		<script src="${resource(dir: 'js', file: 'bootstrap_min.js')}"></script>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'navbar.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'quest.css')}" type="text/css">
       
   
</head>
		
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
<g:form class="form-horizontal" params="['id': question.id]" controller="answer">
   <g:remoteLink controller="vote" action="addVoteToQuestion" update="${question.id }" params="['idQ': question.id]"><div class="arrow-up"></div></g:remoteLink>
    <div  class="container">
       	 
		<strong><textarea  class="form-control" disabled="true" rows="1">${question.title }</textarea></strong>
		<textarea  class="form-control" disabled="true" rows="3">${question.content }</textarea>
		  <div class='navbar-collapse collapse'>
                <ul class='nav navbar-nav navbar-right'>
                 <g:each var="tag" in="${tags}">
                      <li class='' style="background-color:#80BFFF"><a href='#'>${tag.name}</a></li>
                </g:each>
                </ul>
           </div>
       </div>
    <div id="${question.id }" style="font-size: 20px" ><strong>${question.votes.size()}</strong></div>    
    <g:remoteLink controller="vote" action="deleteVoteFromQuestion" update="${question.id }" params="['idQ': question.id]"><div class="arrow-down"></div></g:remoteLink>                                          
	 <g:each  var="answer" in="${answers}"> 
	 <p class="container">${answer.author.userName} answered at ${answer.createdAt }</p>
	 <g:remoteLink controller="vote" action="addVote" update="${answer.id + question.id  }" params="['idA': answer.id,'idQ': question.id]"><div class="arrow-up"></div></g:remoteLink>
	   <div  class="container">	
		<textarea  class="form-control answer" disabled="true" rows="3">${answer.content}</textarea>
		</div>
		
		<div id="${answer.id + question.id }" style="font-size: 20px"><strong>${answer.totalVotes}</strong></div>
		<g:remoteLink controller="vote" action="deleteVote" update="${answer.id + question.id }"  params="['idA': answer.id,'idQ': question.id]"><div class="arrow-down"></div></g:remoteLink><br/><br/>
		
	 </g:each>
	 <div class="container">		
		<textarea  class="form-control"  rows="5" name="content"></textarea>
		<g:actionSubmit value="Answer" action="save" class="btn btn-primary btn-lg"/>
	</div>
	
</g:form>	
     
  
	</body>
</html>
