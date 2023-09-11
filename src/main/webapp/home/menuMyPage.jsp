<!DOCTYPE HTML>
<%@page import="com.model.BadgeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BadgeDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="list.model.PlaceDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="java.net.URLEncoder"%>
<html>
   <head>
      <title>마이페이지</title>
      <meta charset="EUC-KR" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
      <style>
            <style>
      
      *{margin:0;padding:0;box-sizing:border-box;font-family:'Poppins'}
      #map{
       width:350px;
       height:350px;
      }
   body{background:#cdd7cc3d}
   .content{
     margin: auto;
     padding: 15px;
     max-width: 800px;
     text-align: center;
   }
   .dpx{
     display:flex;
     align-items:center;
     justify-content:space-around;
   }
   h1{
     font-size:28px;
     line-height:28px;
     margin-bottom:15px;
   }
   label{
     display:block;
     line-height:40px;
  
   }
   .option-input {
     -webkit-appearance: none;
     -moz-appearance: none;
     -ms-appearance: none;
     -o-appearance: none;
     appearance: none;
     position: relative;
     top: 13.33333px;
     height: 15px;
     width: 15px;
     transition: all 0.15s ease-out 0s;
     background: white;
     opacity: 60%;
     border-radius:30px;
     border: none;
     color: #fff;
     cursor: pointer;
     display: inline-block;
     margin-right: 0.5rem;
     margin-bottom:11px;
     outline: none;
     position: relative;
     z-index: 1000;
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background-color:transparent;
}
.option-input:checked::before {
  border-radius:8px;
  width: 10px;
  height:10px;
  margin-left:5px;
  display:flex;
  content: '\f00c';
  font-size: 10px;
  font-weight:bold;
  position: absolute;
  align-items:center;
  justify-content:center;
  font-family:'Font Awesome 5 Free';
}
.option-input:checked::after {
  background: #40e0d0;
  content: '';
  display: block;
  position: relative;
  z-index: 100;
}
.option-input.radio {
  border-radius: 50%;
}
.option-input.radio::after {
  border-radius: 50%;
}

@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
  }
}



      
      
      
      
      
      
      
      
      .page {
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
}


/* add default color for animation start  */


/* toggle this class */

.color-bg-start {
  background-color: salmon;
}


/* toggle class bg-animate-color */

.bg-animate-color {
  animation: random-bg .5s linear infinite;
}


/* add animation to bg color  */

@keyframes random-bg {
  from {
    filter: hue-rotate(0);
  }
  to {
    filter: hue-rotate(360deg);
  }
}

.fun-btn {
  /* change bg color to get different hues    */
  background-color: #0c97459c;
  color: white;
  padding: 0.65em 3em 0.65em 3em;
  border: none;
  transition: all .3s ease;
  border-radius: 0.5em;
  letter-spacing: 2px;
  text-transform: uppercase;
  outline: none;
  align-self: center;
  cursor: pointer;
  font-weight: bold;
}

      


.fun-btn:hover {
  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
}

.start-fun {
  background-color: #fff !important;
  /* change color of button text when fun is started   */
  color: salmon !important;
}

/* pulsating effect on button */
@keyframes grow {
  0% {
    transform: scale(1);
  }
  14% {
    transform: scale(1.3);
  }
  28% {
    transform: scale(1);
  }
  42% {
    transform: scale(1.3);
  }
  70% {
    transform: scale(1);
  }
}
      
      </style>
      </style>
      
      
      
      
   </head>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        <!--        <script type="text/javascript"
                                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f93746e33ed79e4637c2a1c0f03f736a"></script>
    --><body class="left-sidebar is-preload">
      <% MemberDTO info = (MemberDTO)session.getAttribute("info"); %>
      <div id="page-wrapper">

         <!-- Header -->
            <div id="header">

               <!-- Inner -->
                  <div class="inner">
                     <header>
                        <h1><a href="main.jsp" id="logo">PPLAN</a></h1>
                        <h3></h3>
                     </header>
                  </div>

               <!-- Nav -->
                  <nav id="nav">
                     <ul>
                        <li><a href="main.jsp">Home</a></li>
                        <!-- <li><a href="login/login.jsp">로그인</a></li> : 이미 로그인 해서 없어도 될 것 같음 -->
                          <li><a href="recommend.jsp">추천일정</a></li>
                        <li><a href="../game1/game.jsp">게임하기</a></li>
                         <li><a href="menuMyPage.jsp">마이페이지</a></li>
                        <%if(info !=null){ %>
                        <li><a href="../LogoutService">로그아웃</a></li>
                        <%} %>
                     </ul>
                  </nav>

            </div>


         <!-- Main -->
            <div id="mypagehere" class="wrapper style1">

               <div class="container">
                  <div class="row gtr-200">
                     <div class="col-4 col-12-mobile" id="sidebar">
                        <section>
                           <header>
                              <h3><a href="#" id="mypageLink"><strong ><%=info.getNick() %>'s Page</strong></a></h3>
                           </header>
                           <br>
                           <div class="row gtr-50">
                              <div class="col-8">
                                 <a href="#" class="image fit" id="modifyLink"><h4>MODIFY</h4></a>                              
                              </div>
                              
                              <div class="col-8">
                                 <a href="#" class="image fit" id="scheduleLink"><h4>SCHEDULE</h4></a>                           
                              </div>
                              
                              <div class="col-8">
                                 <a href="#" class="image fit" id='badgeLink'><h4>BADGE</h4></a>
                              </div> 
                           </div>
                        </section>
                     </div>
                     
                     <div class="col-8 col-12-mobile imp-mobile" id="content">
                        <article id="main">
                           <div id="myPageScreen">
                          <header><img id="jejuImg" src="images/jejulogo.jpg" alt="" height="450px"/></header>
                                 
                     </div>
                     <script>
                     document.addEventListener('DOMContentLoaded', function() {
                         // "MY PAGE" 텍스트를 클릭 시 이벤트 생성
                         function showMyPageScreen() {
                             document.getElementById('myPageScreen').style.display = 'block';
                               document.getElementById('modifyScreen').style.display = 'none';
                               document.getElementById('scheduleScreen').style.display = 'none';
                             document.getElementById('badgeScreen').style.display = 'none';
                         }
                         // "MY PAGE" 링크 요소를 가져오기
                            var mypageLink = document.getElementById('mypageLink');

                           // "MY PAGE" 링크 요소에 클릭 이벤트 등록
                            mypageLink.addEventListener('click', function(event) {
                                event.preventDefault();
                                // MY PAGE 화면을 보이도록 함수를 호출합니다.
                              showMyPageScreen();
                            });
                     });
                     </script>
                     
                     
                        <div id="modifyScreen" style="display: none;">
                           <header>MODIFY</header>
                           <form action="../UpdateService" method="post">
                           <div class="form-field">
                              <label for="password">Password</label> 
                              <input name="pw" type="password" id="password">
                           </div>
                           <br>
                           <div class="form-field">
                              <label for="nick">NickName</label> 
                              <input name="nick" type="text" id="nick">
                              <span id="nickCheck"></span>
                           </div>

                           <br>
                           <button type="submit" class="btn-update">UPDATE</button>
                        </form>
                        </div>
                     
                        
                        <script type="text/javascript">
                        $(document).ready(function(){
         
                           $("#nick").keyup(function(){
                              const nickCheck = document.getElementById("nickCheck");
                              let inputNick = $("#nick").val();
            
       
                              $.ajax({
                                 url : "../nickCheck",
                                 data : {"nick" : inputNick},
                                 success : function(text){
                                 if(text==="true"){
                                       nickCheck.innerText = "중복된 닉네임입니다.";
                                 }else{
                                       nickCheck.innerText = "사용 가능한 닉네임입니다.";
                                 }
                                 },
                                 error : function(e){
                                    console.log(e);
                                 }
                                 });   
                              });
                        });
                        
                         // 페이지 로딩 완료 시 이벤트를 등록
                        document.addEventListener('DOMContentLoaded', function() {
                           // "MODIFY" 텍스트를 클릭 시 정보 수정 창 보임
                               function showModifyScreen() {
                                document.getElementById('modifyScreen').style.display = 'block';
                            }
                         // "MODIFY" 링크 요소를 가져옵니다.
                         var modifyLink = document.getElementById('modifyLink');

                         // "MODIFY" 링크 요소에 클릭 이벤트를 등록
                         modifyLink.addEventListener('click', function(event) {
                                // 기본 동작 (링크 이동)을 취소합니다.
                                event.preventDefault();
                             // 정보 수정 화면을 보이도록 함수 호출 + myPageScreen 숨김
                             showModifyScreen();
                             myPageScreen.style.display = 'none';
                             scheduleScreen.style.display ='none';
                             badgeScreen.style.display = 'none';
                             mapContainer.style.display='none';
                            });
                        });
                         
                         
                         
                         
                        </script>
                        
                        
                    <div id="scheduleScreen" style="display: none;">
                           <header>SCHEDULE</header>
                           <!-- 일정 페이지 -->
                           <br>
                           <form action="../writeComment" method="post">
                           <div id="scheduleContainer">
                              <div class="schedule-list">
                        <div class="storage">
                        </div>
                                 <div class="recommend-btn">
                                    <button type="button" id="recommendButton">일정추천</button>
                 
                                  </div>              
                                   <div class="schedule-comment" style=" display:none;">
                                       <div class="comment-content">
                                    <h3>한줄평 작성</h3>
                                     <textarea name="content" id="reviewTextArea" class="review-textarea" placeholder="한줄평을 작성해주세요..."></textarea>
                                                <div class="submit-review">
                                                <button type="submit" value="comment" id="submitReviewButton">작성 완료</button>
                                             </div>   
                                       </div>
                                    </div>
                                 </div>
                              </div>
                             </form>

                              <script>
                              $(document).ready(function() {
                                  var id = '<%=info.getId() %>';
                                $.ajax({
                                    url: "../GetSche",
                                    type: "POST",
                                    data:{"id":id},
                                    dataType: "JSON",
                                    success: function(result) {
                                       console.log(result);
                                        let html = "<ul>"; // 수정된 부분: 변수를 반복문 밖으로 이동
                                        
                                        for (let i = 0; i < result.length; i++) {
                              
                                                html += " <li><label><input type='radio' id='lbn' class='option-input checkbox' name='mem_schedule' value='" + result[i].schedule_id + "'><a href='#' class='scheduleLink'>";
                                                html += result[i].sche;
                                                html += "</a></label></li>";
                                         
                                        }
                                        html += "</ul>";
                                      $(".storage").html(html);
                                      
                                      
                                     $(document).ready(function() {
                                     $(".scheduleLink").click(function(event) {
                                        event.preventDefault(); 
                                         var selectedValue = $(this).text();
                                         refreshMap(selectedValue);
                                     });
                                 });
                                 },
                                 error: function(e) {
                                     console.log(e);
                                 } 
                                 
                                 
                                 
                             });
                          
                        });
                         
                           
                        </script>
                        
                        <script type="text/javascript"
               src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e287908b28c66fab4de78695625ec5a"></script>
                         
                           <div class="schedule-map" id="mapContainer">
                                 <div id="mapWrap" >
                                    <div id="map">
                             
                                    <script>
                                       var container = document.getElementById('map'),
                                        options = {
                                          center : new kakao.maps.LatLng(33.3596213, 126.5311884),
                                          level : 11
                                       };
   
                                       var map = new kakao.maps.Map(container, options);
   
                                  
                   
                                    </script>
                                 </div>
                              </div>
                      </div>
                           </div>
                           <!-- </form> -->
                          
                           <script>
                               const recommendButton = document.getElementById('recommendButton');
                               const commentSection = document.querySelector('.schedule-comment');
                               const closeButton = document.getElementById('closeButton');

                               recommendButton.addEventListener('click', () => {
                                    // recommendButton 버튼을 감추기
                                    recommendButton.style.display = 'none';
                                   // 선택한 일정에 대한 한줄평 작성 영역을 보이게 설정
                                   commentSection.style.display = 'block';
                               });
                            
                               

                               // submitReviewButton 클릭 이벤트 등의 코드
                           </script>

                        
                        
                        
                        <script>
                        document.addEventListener('DOMContentLoaded', function() {
                           
                               function showScheduleScreen() {
                                document.getElementById('scheduleScreen').style.display = 'block';
                            }
                               
                               function relayout() {    
                                   
                                   // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
                                   // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
                                   // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
                                   map.relayout();
                               }
                               
                         var scheduleLink = document.getElementById('scheduleLink');

                         scheduleLink.addEventListener('click', function(event) {
                                event.preventDefault();
                             showScheduleScreen();
                             relayout();
                                 var scheduleContainer = document.getElementById('scheduleContainer');

                                 if (scheduleContainer.style.display === 'none') {
                                    scheduleContainer.style.display = 'block'; 
                                 }                             
                             
                             myPageScreen.style.display = 'none';
                             modifyScreen.style.display = 'none';
                             badgeScreen.style.display = 'none';
                             mapContainer.style.display='block';
                             
                            });
                        });
                        </script>
                        <script>
                        document.addEventListener('DOMContentLoaded', function() {
                              var scheduleLinks = document.querySelectorAll('.scheduleLink');
                              function relayout() {    
                                  
                                  // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
                                  // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
                                  // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
                                  map.relayout();
                              }
                              relayout();
                               scheduleLinks.forEach(function(link) {
                                link.addEventListener('click', function(event) {
                                       event.preventDefault();

                                    var mapContainer = document.getElementById('mapContainer');

                                    if (mapContainer.style.display === 'none') {
                                        mapContainer.style.display = 'block';
                                    } else {
                                        mapContainer.style.display = 'none';
                                    }
                                      });
                                  });
                              });
                        </script>
                        
                        
                        <div id="badgeScreen" style="display: none;">
                           <header>BADGE</header>
                           <!-- 뱃지 페이지 -->
                           <br>
                           <div id="imageContainer" style="display: none;">
                              <div class="badge-list">
                              <%-- 뱃지 fk 삭제해야 됨 --%>
                                 <ul>
                                    <%if(info!=null){ %>
                                    <%
                                       BadgeDAO dao = new BadgeDAO();
                                    
                                       ArrayList<BadgeDTO> list = dao.badge(info.getId());
                                       
                                       for(int i = 0; i < list.size(); i++){
                                          out.print("<li>");
                                          out.print("<div class=\"img-area\">");
                                          out.print("<img src='" + list.get(i).getBadge_img() + "' alt=''/>");
                                          out.print("</div>");
                                          out.print("<span class='tit'>" + list.get(i).getBadge_name() + "</span>");   
                                       }}%>
                                       
                              
                                                                                        
                                 </ul>
                              </div> 
                           </div>
                           </div>
                        
                        
                        <script>
                        document.addEventListener('DOMContentLoaded', function() {
                               function showBadgeScreen() {
                                document.getElementById('badgeScreen').style.display = 'block';
                            }
                         var badgeLink = document.getElementById('badgeLink');

                         badgeLink.addEventListener('click', function(event) {
                                event.preventDefault();
                                showBadgeScreen();
                                
                                 // 이미지들을 담고 있는 div 요소를 가져옵니다.
                                 var imageContainer = document.getElementById('imageContainer');

                                 if (imageContainer.style.display === 'none') {
                                     imageContainer.style.display = 'block'; // 보이도록 설정
                                 }
                                
                             myPageScreen.style.display = 'none';
                             modifyScreen.style.display = 'none';
                             scheduleScreen.style.display = 'none';
                             mapContainer.style.display='none';
                             
                            });
                        });
                        </script>                        



                        </article>
                  </div>
                        
                  
                     </div>
                  </div>
               </div>

            </div>


         <!-- Footer -->
            <div id="footer">
               <div class="container">
                  <div class="row">

                  </div>
                  <hr />
                  <div class="row">
                     <div class="col-12">

                 <!-- Contact -->
                           <section class="contact">
                              <header>
                                 <h3>나만의 여행, PPLAN</h3>
                              </header>
                              <br>
                              <p>TROPHY</p>

                           </section>

                        <!-- Copyright -->
                           <div class="copyright">
                              <ul class="menu">
                                 <li>&copy; PPLAN. All rights reserved.</li>
                              </ul>
                           </div>

                     </div>

                  </div>
               </div>
            </div>

      </div>

      <!-- Scripts -->
      <script>
      function refreshMap(scheduleValue) {
           console.log(scheduleValue);
           
           $('#map').remove();
           let ttttt = "<div id='map'></div>";
           $('#mapWrap').html(ttttt);
           container = document.getElementById('map');
           options = {
               center: new kakao.maps.LatLng(33.3596213, 126.5311884),
               level: 11
           };
           map = new kakao.maps.Map(container, options);

           $.ajax({
               url: "../GetPlace",
               type: "POST",
               data: {"schedule": scheduleValue},
               dataType: "JSON",
               success: function(result) {
                   console.log(result);

                   var linePath = [];

                   for (var i = 0; i < result.length; i++) {
                       addMarker(new kakao.maps.LatLng(parseFloat(result[i].place_latitude), parseFloat(result[i].place_longitude)));
                       linePath.push(new kakao.maps.LatLng(parseFloat(result[i].place_latitude), parseFloat(result[i].place_longitude)));
                   }

                   var polyline = new kakao.maps.Polyline({
                       path: linePath,
                       strokeWeight: 2,
                       strokeColor: 'blue',
                       strokeOpacity: 1,
                       strokeStyle: 'solid'
                   });

                   polyline.setMap(map);

                   function addMarker(position) {
                       var marker = new kakao.maps.Marker({
                           position: position
                       });
                       marker.setMap(map);
                   }
               },

               error: function(e) {
                   console.log(e);
               }
           });
       }



         
       
      
      </script>
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/jquery.scrollex.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

   </body>
</html>