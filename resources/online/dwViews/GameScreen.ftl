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
    	      <a class="titleCard" id="titleCard0"> YOU </a>
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
    	      <a class="titleCard" id="titleCard1">AI Player 1 </a>
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
    	      <a class="titleCard" id="titleCard2">AI Player 2 </a>
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
    	      <a class="titleCard" id="titleCard3">AI Player 3 </a>
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
    	      <a class="titleCard" id="titleCard4">AI Player 4 </a>
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
			function hideAI(){
				document.getElementById("AIPlayer1").style.visibility = "hidden";
				document.getElementById("AIPlayer2").style.visibility = "hidden";
				document.getElementById("AIPlayer3").style.visibility = "hidden";
				document.getElementById("AIPlayer4").style.visibility = "hidden";
			}
			function showAI(parsedText){
				if(parsedText.AI1InGame)document.getElementById("AIPlayer1").style.visibility = "visible";
				if(parsedText.AI2InGame)document.getElementById("AIPlayer2").style.visibility = "visible";
				if(parsedText.AI3InGame)document.getElementById("AIPlayer3").style.visibility = "visible";
				if(parsedText.AI4InGame)document.getElementById("AIPlayer4").style.visibility = "visible";
				
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
 					document.getElementById("next").disabled = true;
 					showCards(parsedText);
				};
				xhr.send();		
			}
			function nextRound(){
				if(activePlayer == 0){
					humanStart();
				}else{
					AIStart();
				}
			}
			/*This method is called when a round of AI starts*/
			function AIStart(){
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/roundStart");
				xhr.onload = function(e) {
 					var responseText = xhr.response; 
 					var parsedText = JSON.parse(responseText);
					showCards(parsedText);
 					AIRound();
				};
				xhr.send();	
			}
			
			/*This method is called to put the cards(which are drawn by the players this round) on the right position. */
			function showCards(parsedText){
					var i;
 					var j;
 					var AI1 = false, AI2 = false, AI3 = false, AI4 = false, human = false;
 					//alert(parsedText.length);
 					for(j = 0; j < parsedText.length; j++){
 						var owner = parsedText[j].owner;
 						if(owner == "Human Player"){
 							i = 0;
 							human = true;
 						}
 						else if(owner == "AI Player 1"){
 							i = 1;
 							AI1 = true;
 						}
 						else if(owner == "AI Player 2"){
 							i = 2;
 							AI2 = true;
 						}
 						else if(owner == "AI Player 3"){
 							i = 3;
 							AI3 = true;
 						}
 						else if(owner == "AI Player 4"){
 							i = 4;
 							AI4 = true;
 						}
 						$('#cardName'+i).text(parsedText[j].description);
 						$('#card'+i).attr('src',"/assets/"+parsedText[j].description+".png");
 						$('#attributeOne'+i).text("Attack:"+parsedText[j].attribute0);
 						$('#attributeTwo'+i).text("Size:"+parsedText[j].attribute1);
 						$('#attributeThree'+i).text("Defence:"+parsedText[j].attribute2);
 						$('#attributeFour'+i).text("Speed:"+parsedText[j].attribute3);
 						$('#attributeFive'+i).text("HP:"+parsedText[j].attribute4);
 					}
 					if(!human){
 						alert("Game over, you lose.");
 						endGameAuto();
 						 window.history.back(-1);   
 					}
 					if(!AI1) document.getElementById("AIPlayer1").style.visibility = "hidden";
 					if(!AI2) document.getElementById("AIPlayer2").style.visibility = "hidden";
 					if(!AI3) document.getElementById("AIPlayer3").style.visibility = "hidden";
 					if(!AI4) document.getElementById("AIPlayer4").style.visibility = "hidden";
 					if(human&&parsedText.length==1){
 						alert("Congrats! You win.");
 						 window.history.back(-1);   
 					}
			}
			
			//function [AIStart] calls this function to execute the AI round. 
 			function AIRound(){
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/AIRound");
				cancelHighlightCards();
				
				xhr.onload = function(e){
					var responseText = xhr.response;
					var parsedText = JSON.parse(responseText);
 					if(parsedText.isDraw){
 						handleDraw(parsedText);
 					}else{
 						handleResult(parsedText);
 					}
				};
				xhr.send();
			} 
			
			/*When the human player choose a category, this function handles it.*/
			function humanChoice(choice){
				var xhr =  createCORSRequest('GET', "http://localhost:7777/toptrumps/humanChoice?choice="+choice);
				
				document.getElementById("next").disabled = false;
				xhr.onload = function(e){
					var responseText = xhr.response; 
					disableCategory();
 					var parsedText = JSON.parse(responseText);
 					showAI(parsedText);
 					if(parsedText.isDraw){
 						handleDraw(parsedText);
 					}else{
 						handleResult(parsedText);
 					}
				};
				xhr.send();
			}
			
			/*This method handles the result of a round, highlight the wining card.*/
			function handleResult(parsedText){
				var winCategory;
					showAI(parsedText);
					switch(parsedText.roundChoice){
					case 0:
						winCategory = "Attack";
						break;
					case 1:
						winCategory = "Size";
						break;
					case 2:
						winCategory = "Defence";
						break;
					case 3:
						winCategory = "Speed";
						break;
					case 4:
						winCategory = "HP";
						break;
					}
					$('#text1').text("Round "+parsedText.round+": "+parsedText.winner+" wins with "+winCategory);
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
			}
						
			//States that a draw happens. Show the category that cause the draw.
			function handleDraw(parsedText){
				var winCategory;
				switch(parsedText.roundChoice){
				case 0:
					winCategory = "Attack";
					break;
				case 1:
					winCategory = "Size";
					break;
				case 2:
					winCategory = "Defence";
					break;
				case 3:
					winCategory = "Speed";
					break;
				case 4:
					winCategory = "HP";
					break;
				}
				$('#text1').text("Round "+parsedText.round+": This round was a Draw for "+winCategory);
				$('#text2').text("Common pile now have "+parsedText.commonPile +" cards");
				showAI();
			}
			//After the human player is out, the AIs end the game automatically so the result will be recorded. 
			function endGameAuto(){
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/endGameAuto"); // Request type and URL	
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
