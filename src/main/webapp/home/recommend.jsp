<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.RecomDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.RecomDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>

<html>
<style>
.like_btn {
   width:30px;
   height:30px;
 background:none;
  padding: 0;
  border:none;
  cursor: pointer;
}

.like_btn img {
  width: 100%; /* 이미지를 버튼의 가로 너비에 맞춤 */
  height: 100%; /* 세로 비율을 유지한 채로 이미지 크기 조절 */
  object-fit: cover;
  background-color: #ffffff;
}
#rec-container td {
  padding: 15px; /* 셀 안에 여백을 원하는 값으로 조절 */
  vertical-align: middle;
}
#paging{
   text-align:center;   
}


</style>
   <head>
      <title>RECOMMEND</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/rec.css" />
      
   </head>
   <body class="left-sidebar is-preload">
   <%
   RecomDAO dao = new RecomDAO();
               ArrayList<RecomDTO> rec = dao.getRec(); 
               MemberDTO info = (MemberDTO)session.getAttribute("info");
   %>
   
      <div id="page-wrapper">

         <!-- Header -->
            <div id="header">

               <!-- Inner -->
                  <div class="inner">
                     <header>
                        <h1><a href="main.jsp" id="logo">Pplan</a></h1>
                     </header>
                  </div>

               <!-- Nav -->
                  <nav id="nav">
                    <ul>
                        <li><a href="main.jsp">Home</a></li>
                        <li><a href="recommend.jsp">추천일정</a></li>
                        <li><a href="../game1/game.jsp">게임하기</a></li>
                        
                        <%if(info != null){ %>
                           <li><a href="menuMyPage.jsp">마이페이지</a></li>
                           <li><a href="../LogoutService">로그아웃</a></li>
                        <%}else{%>
                        <li><a href="login/login.jsp">로그인</a></li>
                        <%} %>
                     </ul>
                  </nav>

            </div>

         <!-- Main -->
            <div class="wrapper style1">

               <div class="container">
                  <div class="row gtr-200">
                     <div class="col-4 col-12-mobile" id="sidebar">
                        <hr class="first" />
  <section>
                           <header>
                              <h3 id="rec-label"><a href="#">추천 일정</a></h3>
                           </header>
                           <div id="rec-container"><a href="#"  id="resultDiv"></a>
                           
                           <table>
                           
                           <%
                           // 페이지당 게시물 수와 현재 페이지 설정
                           int postsPerPage = 5; // 한 페이지에 표시할 게시물 수
                           int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

                           // rec 리스트에서 해당 페이지에 해당하는 게시물만 추출
                           int startIndex = (currentPage - 1) * postsPerPage;
                           int endIndex = Math.min(startIndex + postsPerPage, rec.size());
                           
                           String recList = "";
                              for(int i = startIndex; i < endIndex; i++){
                                 recList += "<tr><td>"+rec.get(i).getMem_id()+"</td><td>";
                                 recList += "<button id='recbtn' type='button' onclick='sendData(\"" + rec.get(i).getPlace() + "\", \"" + rec.get(i).getSche_id() + "\")'>";
                                 recList += rec.get(i).getPlace();
                                 recList += "</button></td>";
                                 recList += "<td id='"+rec.get(i).getSche_id()+"'><button class='like_btn' type='button'><img class='"+rec.get(i).getSche_id()+"' src='https://cdn-icons-png.flaticon.com/512/6733/6733487.png' onclick='like_click(event, this)'>";
                                 recList += "</button></td></tr>";
                              }
                         out.print(recList);                       
                           
                           %>
                            
                         </table>
                         <div id="paging">
                         <% for (int i = 1; i <= Math.ceil((double) rec.size() / postsPerPage); i++) { %>
                             <a href="?page=<%= i %>"><%= i %></a>
                         <% } %>
                     </div>
                         </div>

                        </section>
                      
                     </div>
                     
                     <script type="text/javascript">
                     function like_click(event, ele) {
                         
                         let scheId = ele.getAttribute('class');
                        //console.log(scheId);
                         // 장소정보를 가져오는 비동기통신 부분
                         $.ajax({
                            url : "../likeUp",
                            type : "POST",
                            data : {"scheId" : scheId},
                            success : function(result){
                               console.log(result);
                              $("#"+scheId).html(result);
                               
                            },
                            error : function(e){
                               console.log(e);
                            }
                         });
                         
                     };
                     
                     
                     
                     </script>
                     
                     <div class="col-8 col-12-mobile imp-mobile" id="content">
                        <article id="main">
                           <header>
                              
                              
                           </header>
                           <div id="mapWrap">
                           <div id="map" style="width:100%;height:350px;"></div>
                           </div>
                           
                        </article>
                        
                        <div><h3 id="responseValue"> </h3></div>
                     </div>
                  </div>
                  <hr />
                  
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
                              <p>RECOMMEND JEJU.</p>
                     
                           </section>

                        <!-- Copyright -->
                           <div class="copyright">
                              <ul class="menu">
                                 <li>&copy; TROPHY. All rights reserved.</li>
                              </ul>
                           </div>

                     </div>

                  </div>
               </div>
            </div>

      </div>

      <!-- Scripts -->
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17ef75805e870442ce556e97240445b9"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/recommend.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/jquery.scrollex.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

   </body>
</html>