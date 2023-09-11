<%@page import="list.model.FoodDTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="list.model.ListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html lang="en">
  <head>
     <title>PPLAN gogo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../modal/styles.css">
<link
   href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

<style>
      
      
      @import url('https://fonts.googleapis.com/css?family=Amatic+SC');
      @font-face {
       font-family: 'SUITE-Regular';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
       font-weight: 400;
       font-style: normal;
      }
   @font-face {
       font-family: 'EF_jejudoldam';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-EF@1.0/EF_jejudoldam.woff2') format('woff2');
       font-weight: normal;
       font-style: normal;
   }
   
@font-face {
    font-family: 'neurimboGothicRegular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/neurimboGothicRegular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
body {
  margin: 0;
  height: 100%;
  background-image: linear-gradient(to top, #d9afd9 0%, #97d9e1 100%);
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
}
.active{
font-family: 'SUITE-Regular';
}
  #food_add{
     display : none;  
  }
.button_container {
  position: absolute;
  left: 0;
  right: 0;
  top: 30%;
}

.description, .link {
  font-family: 'Amatic SC', cursive;
  text-align: center;
}

.description {
  font-size: 35px;
}

#detailSidebar h2{
      font-family: 'Amatic SC', cursive;
  text-align: center;
  font-size:50px;
      }

.btn12 {
  border: none;
  display: block;
  text-align: center;
  cursor: pointer;
  text-transform: uppercase;
  outline: none;
  overflow: hidden;
  position: relative;
  color: #fff;
  font-weight: 700;
  font-size: 15px;
  background-color: #222;
  padding: 17px 60px;
  margin: 0 auto;
  box-shadow: 0 5px 15px rgba(0,0,0,0.20);
  font-family:'neurimboGothicRegular';
}

.btn12 span {
  position: relative; 
  z-index: 1;
}

.btn12:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  height: 490%;
  width: 140%;
  background: #78c7d2;
  -webkit-transition: all .5s ease-in-out;
  transition: all .5s ease-in-out;
  -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
  transform: translateX(-98%) translateY(-25%) rotate(45deg);
}

.btn12:hover:after {
  -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
  transform: translateX(-9%) translateY(-25%) rotate(45deg);
}

.link {
  font-size: 20px;
  margin-top: 30px;
}

.link a {
  color: #000;
  font-size: 25px; 
}
      
      
      
      
      
      
      
      
      #map{
       width: 100%;
        height: 100%;
        position:absolute;
        left:0;
        top:0;
        margin:0;
        padding:0;
        z-index:-30;
      }
      html, body {
          width: 100%;
        height: 100%;
        position:absolute;
        left:0;
        top:0;
        margin:0;
        padding:0;
}

body{
 overflow:hidden;
}
  #detailSidebar {
  height:100%;
    overflow: hidden; /* Hide the default scrollbar */
    /* Add other styles for the detail sidebar if needed */
  }

#closeDetailSidebar{
  float:right;
  color: black;
  background-color: white;
  border:none;
  border-radius: 13px;
}

#closeDetailSidebar:hover{
  background-color: #E6E6E6;
  border-radius: 13px;
 
}
#placeContainer::-webkit-scrollbar {
    width: 13px;
}
#placeContainer::-webkit-scrollbar-track {
    background-color: #e4e4e4;
    border-radius: 100px;
}
#placeContainer::-webkit-scrollbar-thumb {
    background-color: #d4aa70;
    border-radius: 100px;
}
#placeContainer {
    scrollbar-color: #D4AA70 #e4e4e4;
}
#placeContainer::-webkit-scrollbar-thumb {
    background-image: linear-gradient(180deg, #1f1a63 0%, #2c2585 99%);
    box-shadow: inset 2px 2px 5px 0 rgba(#fff, 0.5);
    border-radius: 100px;
}




#placeContainer{
height:90%;
overflow-y:scroll;
}

#placeImg {
  border: none;
  background: none;
  width:30%;
  padding: 0;
  cursor: pointer;
  overflow: hidden; /* Ensure the border radius clips the image */
  position: relative;
  border-radius: 10px;
 
}

#placeImg img {
float: left;
  display: block;
  width:100%;
  height: 100px;
  object-fit: cover;
  border-radius: 10px;
  border: 1px solid transparent;
  transition: transform 0.3s ease; /* Add a smooth transition on hover */
   margin-bottom: 10px;
 
}

/* Animation effect on hover */
#pImg:hover{
  transform: scale(1.1); /* Increase the image size slightly on hover */
  box-shadow: 0 0 8px rgba(0, 0, 0, 0.3); /* Add a subtle box shadow */
  border: 1px #999; /* Change the border color on hover */
}
.pop-layer .pop-container {
  padding: 10px 10px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}



.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 10000;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
  overflow-y: auto;
}

        .custom-infowindow {
            width: 300px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        
        .custom-infowindow img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }
        
        .custom-infowindow h3 {
            margin: 10px 0;
            font-size: 18px;
        }

.add_basket{
  margin-top: 20px;
  padding: 10px 20px;
  background-color: #4d74f9;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-family: 'SUITE-Regular';
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}
<!--모달-->
/* 딤처리 팝업레이어 스타일 */
.dim-layer {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 9999; /* 딤처리 팝업이 다른 요소들보다 위에 표시되도록 설정합니다. */
}

.dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 3px solid #4d74f9;
  z-index: 10000;
  opacity: 86%;
  overflow-y: auto;
}

.pop-layer {
  display: none;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
  z-index: 10000; /* 팝업 레이어가 딤처리 팝업 위에 표시되도록 설정합니다. */
  overflow-y: auto;
}

/* 팝업 내용 스타일 */
.pop-content {
  text-align: center;
}

.pop-content p{
  margin-top: 15px;
  font-size: 14.5px;
  color: black;
  font-family: 'SUITE-Regular';
}
#pgname{
  margin-top: 15px;
  font-size: 13.5pt;
  color: black;
  font-family: 'SUITE-Regular';
}


/* 닫기 버튼 스타일 */
 .close-btn {
  margin-top: 20px;
  padding: 10px 20px;
  background-color: #333;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-left:10px;
  font-family: 'SUITE-Regular';
}
#schedule-button {
  border: 0;
  outline: none;
  /*font-size: 30px;*/
  background: #0489B1;
  color: white;
  padding: 5px;
  cursor: pointer;
  border-radius: 10px;
  width: 120px;
  height: 55px;
}
.logo{
font-family: 'neurimboGothicRegular';
font-size:60px;

}

#schedule-button span {
   font-size: 21.5px;
}

#schedule-button:hover {
  color: white;
  background: skyblue;
}

   </style>
  </head>
  <body>
  <script type="text/javascript"
               src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e287908b28c66fab4de78695625ec5a"></script>
      <div class="wrapper d-flex align-items-stretch">
         <nav id="sidebar">
            <div class="custom-menu">
               <button type="button" id="sidebarCollapse" class="btn btn-primary">
             <i class="fa fa-bars"></i>
             <span class="sr-only">Toggle Menu</span>
           </button>
        </div>
            <div class="p-4 pt-5">
              <h1><a href="../../home/main.jsp" class="logo">PPLAN</a></h1>
           <ul class="list-unstyled components mb-5">
             <li class="active">
               <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">장소</a>
               <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="#">관광지</a>
                    
                </li>
                <li>
                    <a href="#">식당</a>
                </li>
               </ul>
             </li>
           
           </ul>
            

           <div class="footer">
              <p class="description">Let's go</p>
              <button class="btn12" onclick="submitForm()" id="schedule-button"><span>CREATE</span></button>
           </div>

         </div>
       </nav>
      

    <!-- Detail sidebar -->
    <div id="detailSidebar">
      <button type="button" id="closeDetailSidebar" class="btn btn-secondary">X</button>
      <h2>JEJU ISLAND</h2>
      <p></p>
      <div id="placeContainer"></div>
     </div>

<!-- 모달창(상세정보) -->
 <div class="dim-layer">
  <div class="dimBg"></div>
  <div class="pop-layer">
    <!-- 팝업 내용을 담을 div 요소를 생성합니다. -->
    <div class="pop-container">
      <div class="pop-content">
        <!-- 팝업 내용을 이곳에 작성하세요 -->
        <h3>모달 제목</h3>
        <p id="popupContent">모달 내용입니다.</p>
        <button class="add_basket">추가</button>
        <button class="close-btn" onclick="closeModal()">닫기</button>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

            <script>

var basket = new Array();
var marker;


function addContent(imgpath,name,placeNum,latitude,longitude,addr){
   if(basket.length < 10){
      create_marker(imgpath,name,latitude,longitude,addr);       
       basket.push(placeNum);       
   }else{
      alert("장소가 가득 찼습니다.");
   }
       closeModal();
}
function create_marker(imgpath,name,latitude,longitude,addr){
   var marker = new kakao.maps.Marker(
         {
            position:new kakao.maps.LatLng(latitude,longitude)}
         );
   
   var infowindow_content = ' <div class="custom-infowindow">';
   infowindow_content +=    '<img src="'+imgpath+'" alt="Image">';
   infowindow_content +=    '<h3>' + name+'</h3>';
   infowindow_content +=    '<p>' + addr+'</p>';
   infowindow_content +=    '</div>';
   
   var infowindow = new kakao.maps.InfoWindow({
        content: infowindow_content, // 인포윈도우에 표시할 내용
        removable : false
    });
   
   marker.setMap(map);
    
    
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    
    function makeOverListener(map, marker, infowindow) {
        return function() {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(infowindow) {
        return function() {
            infowindow.close();
        };
    }
}




  function layer_popup(el){

      var $el = $(el);    //레이어의 id를 $el 변수에 저장
      var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

      isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

      var $elWidth = ~~($el.outerWidth()),
          $elHeight = ~~($el.outerHeight()),
          docWidth = $(document).width(),
          docHeight = $(document).height();

      // 화면의 중앙에 레이어를 띄운다.
      if ($elHeight < docHeight || $elWidth < docWidth) {
          $el.css({
              marginTop: -$elHeight /2,
              marginLeft: -$elWidth/2
          })
      } else {
          $el.css({top: 0, left: 0});
      }

      $el.find('a.btn-layerClose').click(function(){
          isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
          return false;
      });

      $('.layer .dimBg').click(function(){
          $('.dim-layer').fadeOut();
          return false;
      });

  }
  function closeModal() {
      // 딤처리 팝업레이어와 팝업레이어를 숨깁니다.
      document.querySelector('.dim-layer').style.display = 'none';
  }
  function submitForm() {
      // form 요소 생성
      if(basket.length > 0){
         var form = document.createElement("form");
         form.setAttribute("method", "post");
         form.setAttribute("action", "../../home/schedule.jsp");
   
         // 배열 값을 숨겨진 input 요소로 추가
         for (var i = 0; i < basket.length; i++) {
             var input = document.createElement("input");
             input.setAttribute("type", "hidden");
             input.setAttribute("name", "dataArray");
             input.setAttribute("value", basket[i]);
             form.appendChild(input);
         }
   
         // form을 body에 추가하고 전송
         document.body.appendChild(form);
         form.submit();
      }else{
         alert("장소를 선택하세요");
      }
  }
  

  </script>
           <!-- Page Content  -->
         <div id="content" class="p-4 p-md-5 pt-5">
         <!-- 지도 화면 -->

            <script type="text/javascript"
               src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e287908b28c66fab4de78695625ec5a"></script>
            <script>
         var mapContainer = document.getElementById('content'), // 지도를 표시할 div 
                mapOption = { 
                 center: new kakao.maps.LatLng(33.380701, 126.570667), // 지도의 중심좌표
                 level: 9 // 지도의 확대 레벨
             };
         
         var map = new kakao.maps.Map(mapContainer, mapOption); 
         

         </script>
         </div>
      </div>
      
      

      <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <% ListDAO dao = new ListDAO();
         ArrayList<String> pgname = dao.placeNameGet();
      %>
      <script>
         var pgname = <%= new Gson().toJson(pgname) %>;
      </script>
  <script type="text/javascript">
  
  $(document).ready(function() {
    
     $("a[href='#']").on("click", function() {
       $("#detailSidebar").addClass("active");
       let clickText = $(this).text();
       
       // alert(typeof text);
       // alert(text.length);
       /* console.log(clickText);
       console.log(clickText == "관광지"); */
       if(clickText == "관광지"){
         /* $("#testData").text("관광지 부분입니다아아앙");
         console.log("관광지"); */
         
         $.ajax({
            url : "../../PlaceSelect",
            type : "POST",
            dataType : "JSON",
            success : function(result){
               /* console.log(result); */
               let html = "";
               for(let i = 0; i < result.length; i++){
                  html += "<button type='button' id='placeImg'>";
                  html += "<img id='pImg' class='"+result[i].place_num +"' src='"+result[i].place_img +"' onclick='img_click(event, "+ i +",this,"+result[i].place_latitude+","+result[i].place_longitude+",\""+result[i].place_addr+"\")'>";
                  html += "</button>";
               }
               $("#placeContainer").html(html);
               
               
            },
            error : function(e) {
               console.log(e);
            }
         });
         

         
      }else if(clickText == "식당"){
         /* $("#testData").text("여기는 식당이다아!");
         console.log("식당"); */
         
         $.ajax({
            url : "../../FoodSelect",
            type : "POST",
            dataType : "JSON",
            success : function(result){
               /* console.log(result); */
               let html = "";
               for(let i = 0; i < result.length; i++){
                  html += "<button type='button' id='placeImg'>";
                  html += "<img id='pImg' class='"+result[i].food_num +"' src='"+result[i].food_img +"' onclick='fdimg_click(event, "+ i +",this,"+result[i].food_latitude+","+result[i].food_longitude+",\""+result[i].food_addr+"\")'>";
                  html += "</button>";
               }
               $("#placeContainer").html(html);
               
               
            },
            error : function(e) {
               console.log(e);
            }
         });
  
      }

     });

     // Close the detail sidebar when the close button is clicked
     $("#closeDetailSidebar").on("click", function() {
       $("#detailSidebar").removeClass("active");
     });
   });
  
  function img_click(event,index, ele,latitude,longitude,addr) {
      
      let placeNum = ele.getAttribute('class');
      let html = "";
      // 장소정보를 가져오는 비동기통신 부분
      $.ajax({
         url : "../../GetPlaceInfo",
         type : "POST",
         data : {"placeNum" : placeNum},
         dataType : "JSON",
         success : function(result){
            //console.log(result);
            html = "";
    
            for(let i = 0; i < result.length; i++){
            
               html += result[i].review_name;
               html += " : " + result[i].review_info;
               html += " (" + result[i].review_rating + ")";
               html += "<br>";
            }
            
            
            
             // 이곳에서 '이미지값' 변수를 사용하여 클릭한 이미지와 연관된 값을 얻을 수 있습니다
              /* console.log("클릭한 이미지 인덱스:", index); */
             var img_val = event.target.src;
             /* console.log("클릭한 이미지 URL:", img_val); */

         

             // 딤처리 팝업레이어를 보여줍니다.
             document.querySelector('.dim-layer').style.display = 'block';
         
             // 팝업 내용을 동적으로 생성합니다.
             var popupContent = "<div class='pop-content'>";
             popupContent += "<img src='" + img_val + "' width='100%'>";
             popupContent += "<p id='pgname'><strong>"+pgname[index]+"</strong></p>";   
             popupContent += "<p>"+html+"</p>"; 
             popupContent += "<button class='add_basket'   onclick='addContent(\""+img_val+"\",\""+pgname[index]+"\","+placeNum+","+latitude+","+longitude +",\""+addr +"\")'>추가</button>";
             popupContent += "<button class='close-btn' onclick='closeModal()'>닫기</button>";
             popupContent += "</div>";
         
             // 팝업 내용을 설정합니다.
             document.querySelector('.pop-layer').innerHTML = popupContent;
            
         },
         error : function(e){
            console.log(e);
         }
      });
      
  };
  
  <%
  ArrayList<FoodDTO> fgname = dao.foodGet();
  
  %>
  
  var fgname = <%= new Gson().toJson(fgname) %>;

  function fdimg_click(event,index, ele,latitude,longitude,addr) {
      
      let foodNum = ele.getAttribute('class');
      
      // 장소정보를 가져오는 비동기통신 부분
      $.ajax({
         url : "../../GetFoodInfo",
         type : "POST",
         data : {"foodNum" : foodNum},
         dataType : "JSON",
         success : function(result){
            /* console.log(result); */
            html = "";
  
            for(let i = 0; i < result.length; i++){
            
               html += result[i].fd_review_name;
               html += " : " + result[i].fd_review_info;
               html += " (" + result[i].fd_review_rating + ")";
               html += "<br>"; 
   
            }
            
            // 이곳에서 '이미지값' 변수를 사용하여 클릭한 이미지와 연관된 값을 얻을 수 있습니다
            /* console.log("클릭한 이미지 인덱스:", index); */
           var img_val = event.target.src;
           /* console.log("클릭한 이미지 URL:", img_val); */

       

           // 딤처리 팝업레이어를 보여줍니다.
           document.querySelector('.dim-layer').style.display = 'block';
       
           // 팝업 내용을 동적으로 생성합니다.
           var popupContent = "<div class='pop-content'>";
           popupContent += "<img src='" + img_val + "' width='100%'>";
           popupContent += "<p id='pgname'><strong>"+fgname[index].food_name+"</strong></p>";   
           popupContent += "<p>"+html+"</p>"; 
         popupContent += "<button class='add_basket' id='food_add' onclick='addContent("+fgname[index].food_name+","+foodNum+","+latitude+","+longitude +","+addr +")'"+">추가</button>";
           popupContent += "<button class='close-btn' onclick='closeModal()'>닫기</button>";
           popupContent += "</div>";
       
           // 팝업 내용을 설정합니다.
           document.querySelector('.pop-layer').innerHTML = popupContent;
        
         },
         error : function(e){
            console.log(e);
         }
      });
      
  }
  
  
  </script>
  
  </body>
</html>
 