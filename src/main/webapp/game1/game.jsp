<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>여행지 추천 게임</title>
<link rel="stylesheet" href="css/game4.css">
</head>
<body>
    <div id="game-container">
        <h1>어디로 떠날까?</h1>
        <p>나에게 맞는 여행지 찾기!</p>
        <button class="btn" onclick="startGame()"><span>START</span></button>
        <!-- <button id="start-button" onclick="startGame()">게임 시작</button> -->
    
    </div>

    <div id="quiz-container" class="hidden"></div>
    
    <div id="result-container" class="hidden">
    
       <div id="close">
           <a href="../home/main.jsp" class="fas fa-2x fa-angle-left angle-left-color"><img src="left.png" width="30px" height="30px"></a>
       </div>

       
       <div class="result-area">
          <h1 id="result-h1">나에게 맞는 여행지는?</h1>
          <div id="loading-spinner" class="hidden">로딩 중...</div>
          <div id="result">
             <p id="result-text"></p>
             <img src="" id="result-img">
             <p id="result-content"></p>
          </div>
       </div>
    </div>


    <script src="js/game.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>