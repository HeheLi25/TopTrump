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
		
        <meta name="viewport" 
        content="width+device-width,initial-scale=1"> 
        
        <style> 
        .button {
        	cursor: pointer;
        }
        
        .buttons{
          background: #BCE1C2;
          cursor: pointer;
          width: 220px;
          height: 30px;
          display: block;
          }
        
        .header {
         text-align: right; 
         width: 400px;
         height: 70px;
         float: right;
         }
         
         .header2{ 
         border-style:solid;
         border-size:10px;
         width:50%;
         text-align:center;
         margin-top:5px;
         border-color: #0059b3;
         }
       
         
         .titleCard{ 
         background:#F09341; 
         margin-top:5px; 
         border-radius:5px;
         text-align:center;
         }
         
        .card { 
        background-color:lightgrey;
        box-shadow: 2px 2px 15px black;
        border-radius: 15px; 
        rgba(0,0,0,0.2);
        width: 17%;
        height:50%;
        display:inline-block;
        margin: 10px;
        margin-top:25px;
        text-align:center;
        }
        
        .dropbox{
        margin-top: 20px;
        background:red;
        height: 50px;
        width: 100px;
        }
        .image{
        margin-top:10px;
        width:100%;
       }
        .container { 
        padding 2px 16px;
        text-align: left;
        font-family:simplifica;
        }
        
        </style>
        
	</head>

    <body onload="initalize()"; style="background-image:url('/assets/background2.png'); background-size:85%;"> <!-- Call the initalize method when the page loads -->
    	
    	<div class="container">
    	
    	<div class="header"> 
          <h3 class="header"><img src="/assets/title.png" height="160" width="300"/></h3>
        </div>
        
        <div> 
        <h4 class="header2" style="text-align:center";> <a id="text1">Round:1 Players have drawn their cards</a> </h4>
        </div>
        
        <div> 
        <h4 class="header2" style="text-align:center";> <a id= "text2">The active player is Human Player </a></h4>
        </div>
        
        <div> 
             <p style="margin-top:10px";>  Choose Category: </p>
          </div>
       <div class="buttons"> 
             <button id="category1" class="buttons" onclick="humanChoice(0)">Attack</button>
          </div>
        <div class="buttons"> 
             <button id="category2" class="buttons" onclick="humanChoice(1)">Size</button>
          </div>   
              <div class="buttons"> 
             <button id="category3" class="buttons" onclick="humanChoice(2)">Defence</button>
          </div>   
          <div class="buttons"> 
             <button id="category4" class="buttons" onclick="humanChoice(3)">Speed</button>
          </div> 
          <div class="buttons"> 
             <button id="category5" class="buttons" onclick="humanChoice(4)">HP</button>
          </div>
          <br>
           <div> 
             <button id="next" class="button" onclick="nextRound()">Next Round</button>&nbsp;
             <button id="newGame" class="button" onclick="gameInit()">New Game</button>
          </div>
           
    	<div id="HumanPlayer" class="card" style="">
    	   <div class="titleCard"> 
    	      <p class="titleCard"> YOU </p>
    	    </div> 
    	    <div class="image">
    	      <img src="/assets/Pikachu.png" height="140" id="card0">
    	    </div>
    	       <div class="container"> 
    	       <h3 id="cardName0"></h3>
    	       <h5>Attributes:</h5>
    	         <ul>
    	           <li id="attributeOne0"></li>
    	           <li id="attributeTwo0"></li>
    	           <li id="attributeThree0"></li>
    	           <li id="attributeFour0"></li>
    	           <li id="attributeFive0"></li>
    	        </ul>
    	   </div>
    	</div>
    	
    	<div class="card" id="AIPlayer1">  
    	<div class="titleCard"> 
    	      <p class="titleCard">AI Player 1 </p>
    	    </div> 
    	    <div class="image">
    	      <img src="/assets/Pikachu.png"  height="140" id="card1">
    	    </div>
    	  <div class="container"> 
    	   <h3 id="cardName1"></h3>
    	   <h5>Attributes:</h5>
    	    <ul>
    	     <li id="attributeOne1"><u></u></li>
    	     <li id="attributeTwo1"><u></u></li>
    	     <li id="attributeThree1"><u></u></li>
    	     <li id="attributeFour1"><u></u></li>
    	     <li id="attributeFive1"><u></u></li>
    	     </ul>
    	   </div>
    	</div> 
    	
    	<div class="card" id="AIPlayer2"> 
    	<div class="titleCard"> 
    	      <p class="titleCard">AI Player 2 </p>
    	    </div>  
    	    <div class="image">
    	      <img src="/assets/Pikachu.png" height="140" id="card2">
    	    </div>
    	  <div class="container"> 
    	   <h3 id="cardName2"></h3>
    	   <h5>Attributes:</h5>
    	    <ul>
    	     <li id="attributeOne2"><u></u></li>
    	     <li id="attributeTwo2"><u></u></li>
    	     <li id="attributeThree2"><u></u></li>
    	     <li id="attributeFour2"><u></u></li>
    	     <li id="attributeFive2"><u></u></li>
    	     </ul>
    	   </div>
    	</div> 
    	
    	<div class="card"  id="AIPlayer3">  
    	<div class="titleCard"> 
    	      <p class="titleCard">AI Player 3 </p>
    	    </div> 
    	    <div class="image">
    	      <img src="/assets/Pikachu.png"  height="140" id="card3">
    	    </div>
    	  <div class="container"> 
    	   <h3 id="cardName3"></h3>
    	   <h5>Attributes:</h5>
    	    <ul>
    	     <li id="attributeOne3"><u></u></li>
    	     <li id="attributeTwo3"><u></u></li>
    	     <li id="attributeThree3"><u></u></li>
    	     <li id="attributeFour3"><u></u></li>
    	     <li id="attributeFive3"><u></u></li>
    	     </ul>
    	   </div>
    	</div> 
    	
    	<div class="card"  id="AIPlayer4">  
    	<div class="titleCard"> 
    	      <p class="titleCard">AI Player 4 </p>
    	    </div> 
    	    <div class="image">
    	      <img src="/assets/Pikachu.png"  height="140" id="card4">
    	    </div>
    	  <div class="container"> 
    	   <h3 id="cardName4"></h3>
    	   <h5>Attributes:</h5>
    	    <ul>
    	     <li id="attributeOne4"><u></u></li>
    	     <li id="attributeTwo4"><u></u></li>
    	     <li id="attributeThree4"><u></u></li>
    	     <li id="attributeFour4"><u></u></li>
    	     <li id="attributeFive4"><u></u></li>
    	     </ul>
    	   </div>
    	</div> 
    	 
   </div>
		
		<script type="text/javascript">
			var activePlayer = 0;//Globel variable, 0 is human player. 
			var round = 1;
			// Method that is called on page load
			function initalize() {
				gameInit();
				
				// --------------------------------------------------------------------------
				// You can call other methods you want to run when the page first loads here
				// --------------------------------------------------------------------------
				
				// For example, lets call our sample methods				
				
			}
			function gameInit(){
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/gameInit");
				round = 1;
				xhr.onload = function(e){
					cancelHighlightCards();
					enableCategory();
					$('#text1').text("Round:1 Players have drawn their cards");
 					$('#text2').text("The active player is Human Player");
					
					humanStart();
				}
				xhr.send();
			}
			function cancelHighlightCards(){
				$("#HumanPlayer").css({'background-color': 'lightgrey'});
				$("#AIPlayer1").css({'background-color': 'lightgrey'});
				$("#AIPlayer2").css({'background-color': 'lightgrey'});
				$("#AIPlayer3").css({'background-color': 'lightgrey'});
				$("#AIPlayer4").css({'background-color': 'lightgrey'});
			}
			
			function humanStart() {
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/roundStart"); // Request type and URL
				hideAI();
				cancelHighlightCards();
				xhr.onload = function(e) {
 					var responseText = xhr.response; 
 					var parsedText = JSON.parse(responseText);
 					var i;
 					$('#text1').text("Round "+round+": Players have drawn their cards");
 					$('#text2').text("The active player is human player");
 					enableCategory();
 					for(i = 0; i < parsedText.length; i++){
 						
 						document.getElementById("next").disabled = true;
 						$('#cardName'+i).text(parsedText[i].description);
 						$('#card'+i).attr('src',"/assets/"+parsedText[i].description+".png");
 						$('#attributeOne'+i).text("Attack:"+parsedText[i].attribute0);
 						$('#attributeTwo'+i).text("Size:"+parsedText[i].attribute1);
 						$('#attributeThree'+i).text("Defence:"+parsedText[i].attribute2);
 						$('#attributeFour'+i).text("Speed:"+parsedText[i].attribute3);
 						$('#attributeFive'+i).text("HP:"+parsedText[i].attribute4);
 					}
				};
				xhr.send();		
			}
			function nextRound(){
				if(activePlayer == 0){
					humanStart();
				}else{
					showCards();
				}
			}
			function showCards(){
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/roundStart");
				xhr.onload = function(e) {
 					var responseText = xhr.response; 
 					var parsedText = JSON.parse(responseText);
 					var i;
 					for(i = 0; i < parsedText.length; i++){
 						$('#cardName'+i).text(parsedText[i].description);
 						$('#card'+i).attr('src',"/assets/"+parsedText[i].description+".png");
 						$('#attributeOne'+i).text("Attack:"+parsedText[i].attribute0);
 						$('#attributeTwo'+i).text("Size:"+parsedText[i].attribute1);
 						$('#attributeThree'+i).text("Defence:"+parsedText[i].attribute2);
 						$('#attributeFour'+i).text("Speed:"+parsedText[i].attribute3);
 						$('#attributeFive'+i).text("HP:"+parsedText[i].attribute4);
 					}
 					AIRound();
				};
				xhr.send();	
			}
			
 			function AIRound(){
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/AIRound");
				cancelHighlightCards();
				
				xhr.onload = function(e){
					var responseText = xhr.response;
					var parsedText = JSON.parse(responseText);
 					showAI();
 					$('#text1').text("Round "+parsedText.round+": The winner is "+parsedText.winner);
 					$('#text2').text("You now have "+parsedText.humanCards +" cards");
 					if(parsedText.winner == "Human Player"){
 						activePlayer = 0;
 						$("#HumanPlayer").css({'background-color': '#B1E8FF'});
 						//Start another round that the active player is human player.
 					}else{
 						activePlayer = -1;//Means the active player is not the human.
 						if(parsedText.winner == "AI Player 1"){$("#AIPlayer1").css({'background-color': '#B1E8FF'});}
 						if(parsedText.winner == "AI Player 2"){$("#AIPlayer2").css({'background-color': '#B1E8FF'});}
 						if(parsedText.winner == "AI Player 3"){$("#AIPlayer3").css({'background-color': '#B1E8FF'});}
 						if(parsedText.winner == "AI Player 4"){$("#AIPlayer4").css({'background-color': '#B1E8FF'});}
 					}
 					round = round+1;
				};
				xhr.send();
			} 
				

			
			function hideAI(){
				document.getElementById("AIPlayer1").style.visibility = "hidden";
				document.getElementById("AIPlayer2").style.visibility = "hidden";
				document.getElementById("AIPlayer3").style.visibility = "hidden";
				document.getElementById("AIPlayer4").style.visibility = "hidden";
			}
			function showAI(){
				document.getElementById("AIPlayer1").style.visibility = "visible";
				document.getElementById("AIPlayer2").style.visibility = "visible";
				document.getElementById("AIPlayer3").style.visibility = "visible";
				document.getElementById("AIPlayer4").style.visibility = "visible";
			}
			function disableCategory(){
				document.getElementById("category1").disabled = true;
				document.getElementById("category2").disabled = true;
				document.getElementById("category3").disabled = true;
				document.getElementById("category4").disabled = true;
				document.getElementById("category5").disabled = true;
			}
			function enableCategory(){
				document.getElementById("category1").disabled = false;
				document.getElementById("category2").disabled = false;
				document.getElementById("category3").disabled = false;
				document.getElementById("category4").disabled = false;
				document.getElementById("category5").disabled = false;
			}
			
			function humanChoice(choice){
				var xhr =  createCORSRequest('GET', "http://localhost:7777/toptrumps/humanChoice?choice="+choice);
				showAI();
				document.getElementById("next").disabled = false;
				xhr.onload = function(e){
					var responseText = xhr.response; 
					disableCategory();
 					var parsedText = JSON.parse(responseText);
 					$('#text1').text("Round "+parsedText.round+": The winner is "+parsedText.winner);
 					$('#text2').text("You now have "+parsedText.humanCards +" cards");
 					if(parsedText.winner == "Human Player"){
 						activePlayer = 0;
 						$("#HumanPlayer").css({'background-color': '#B1E8FF'});
 					}else{
 						activePlayer = -1;
 						if(parsedText.winner == "AI Player 1"){$("#AIPlayer1").css({'background-color': '#B1E8FF'});}
 						if(parsedText.winner == "AI Player 2"){$("#AIPlayer2").css({'background-color': '#B1E8FF'});}
 						if(parsedText.winner == "AI Player 3"){$("#AIPlayer3").css({'background-color': '#B1E8FF'});}
 						if(parsedText.winner == "AI Player 4"){$("#AIPlayer4").css({'background-color': '#B1E8FF'});}
 					}
 					round = round+1;
				};
				xhr.send();
			}
			

			
			
			
			// -----------------------------------------
			// Add your other Javascript methods Here
			// -----------------------------------------
		
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
