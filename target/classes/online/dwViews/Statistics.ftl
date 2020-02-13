<html>

	<head>
		<!-- Web page title -->
    	<title>Top Trumps</title>
    	
    	<!-- Import JQuery, as it provides functions you will probably find useful (see https://jquery.com/) -->
    	<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
    	<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/flick/jquery-ui.css">

		<!-- Optional Styling of the Website, for the demo I used Bootstrap (see https://getbootstrap.com/docs/4.0/getting-started/introduction/) -->
		<link rel="stylesheet" href="http://dcs.gla.ac.uk/~richardm/TREC_IS/bootstrap.min.css">
    	<script src="http://dcs.gla.ac.uk/~richardm/vex.combined.min.js"></script>
    	<script>vex.defaultOptions.className = 'vex-theme-os';</script>
    	<link rel="stylesheet" href="http://dcs.gla.ac.uk/~richardm/assets/stylesheets/vex.css"/>
    	<link rel="stylesheet" href="http://dcs.gla.ac.uk/~richardm/assets/stylesheets/vex-theme-os.css"/>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
 
       <style>
         .header { 
         text-align:center; 
         margin-left:auto;
         margin-right:auto;
         margin-bottom: 20px;
         }
         
          .button { 
         text-align:center;
         background: Transparent; 
         font-family:simplifica;
         height:50px;
         width:150px;
         border:none;
         dispay:inline-block;
         margin:auto;
         margin-top:55px;
         cursor:pointer;
         }
         
         .stats { 
        background:Transparent;
        font-size:20;
        font-family:simplifica;
        display:inline-block;
        margin-right: 34px;
        margin-top:80px;
        }
         
       </style>

	</head>

    <body onload="initalize()"; style="background-image: url('/assets/background3.png'); background-size: 100% 100%";> <!-- Call the initalize method when the page loads -->
    	
    	<div class="container">
    	  
      
    <div class="stats">
       <p class="stats">Games: <a id="numofgames"></a></p> 
     </div> 
     
    <div class="stats">
       <p class="stats"> Human wins: <a id="numofhumanwins"></a></p> 
     </div> 
     
      <div class="stats">
       <p class="stats"> AI wins: <a id="numofaiwins"></a></p> 
     </div> 
     
      <div class="stats">
       <p class="stats"> Average draws: <a id="averagedraws"></a></p> 
     </div> 
     
      <div class="stats">
       <p class="stats">Longest round: <a id="longestgame"></a></p> 
     </div> 

     
     
    <div class="button">
       <a href= "http://localhost:7777/toptrumps">
         <button class="button"><img src="/assets/arrow.png" height="100" width="135"/><br> Back </button>
       </a> 
    </div>
    
    </div>
		
		<script type="text/javascript">
		
			// Method that is called on page load
			function initalize() {
				getNumOfGames();
				getNumOfHumanWins();
				getNumOfAIWins();
				getAverageDraws();
				getLongestGame();
				 
				// --------------------------------------------------------------------------
				// You can call other methods you want to run when the page first loads here
				// --------------------------------------------------------------------------
				
			
			}
			
			// -----------------------------------------
			// Add your other Javascript methods Here
			// -----------------------------------------
			function getNumOfGames(){
				 var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/getNumOfGames");
		            if (!xhr) {
		                alert("CORS is not supported");
		            }
		            xhr.onload = function(e) {
		                var responseText = JSON.parse(xhr.response);
		                $('#numofgames').text(parseInt(responseText));
		            };
		            xhr.send();
			}
			function getNumOfHumanWins(){
				 var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/getNumOfHumanWins");
		            if (!xhr) {
		                alert("CORS is not supported");
		            }
		            xhr.onload = function(e) {
		                var responseText = JSON.parse(xhr.response);
		                $('#numofhumanwins').text(parseInt(responseText));
		            };
		            xhr.send();
			}
			function getNumOfAIWins(){
				 var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/getNumOfAIWins");
		            if (!xhr) {
		                alert("CORS is not supported");
		            }
		            xhr.onload = function(e) {
		                var responseText = JSON.parse(xhr.response);
		                $('#numofaiwins').text(parseInt(responseText));
		            };
		            xhr.send();
			}
			function getAverageDraws(){
				 var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/getAverageDraws");
		            if (!xhr) {
		                alert("CORS is not supported");
		            }
		            xhr.onload = function(e) {
		                var responseText = JSON.parse(xhr.response);
		                $('#averagedraws').text(parseInt(responseText));
		            };
		            xhr.send();
			}
			function getLongestGame(){
				 var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/getLongestGame");
		            if (!xhr) {
		                alert("CORS is not supported");
		            }
		            xhr.onload = function(e) {
		                var responseText = JSON.parse(xhr.response);
		                $('#longestgame').text(parseInt(responseText));
		            };
		            xhr.send();
			}
		
			// This is a reusable method for creating a CORS request. Do not edit this.
			function createCORSRequest(method, url) {
  				var xhr = new XMLHttpRequest();
  				if ("withCredentials" in xhr) {

    				// Check if the XMLHttpRequest object has a "withCredentials" property.
    				// "withCredentials" only exists on XMLHTTPRequest2 objects.
    				xhr.open(method, url, true);

  				} else if (typeof XDomainRequest != "undefined") {

    				// Otherwise, check if XDomainRequest.
    				// XDomainRequest only exists in IE, and is IE's way of making CORS requests.
    				xhr = new XDomainRequest();
    				xhr.open(method, url);

 				 } else {

    				// Otherwise, CORS is not supported by the browser.
    				xhr = null;

  				 }
  				 return xhr;
			}
		
		</script>
		
		<!-- Here are examples of how to call REST API Methods -->
		<script type="text/javascript">
		
			// This calls the helloJSONList REST method from TopTrumpsRESTAPI
			function helloJSONList() {
			
				// First create a CORS request, this is the message we are going to send (a get request in this case)
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/helloJSONList"); // Request type and URL
				
				// Message is not sent yet, but we can check that the browser supports CORS
				if (!xhr) {
  					alert("CORS not supported");
				}

				// CORS requests are Asynchronous, i.e. we do not wait for a response, instead we define an action
				// to do when the response arrives 
				xhr.onload = function(e) {
 					var responseText = xhr.response; // the text of the response
					alert(responseText); // lets produce an alert
				};
				
				// We have done everything we need to prepare the CORS request, so send it
				xhr.send();		
			}
			
			// This calls the helloJSONList REST method from TopTrumpsRESTAPI
			function helloWord(word) {
			
				// First create a CORS request, this is the message we are going to send (a get request in this case)
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/helloWord?Word="+word); // Request type and URL+parameters
				
				// Message is not sent yet, but we can check that the browser supports CORS
				if (!xhr) {
  					alert("CORS not supported");
				}

				// CORS requests are Asynchronous, i.e. we do not wait for a response, instead we define an action
				// to do when the response arrives 
				xhr.onload = function(e) {
 					var responseText = xhr.response; // the text of the response
					alert(responseText); // lets produce an alert
				};
				
				// We have done everything we need to prepare the CORS request, so send it
				xhr.send();		
			}

		</script>
		
		</body>
</html>
