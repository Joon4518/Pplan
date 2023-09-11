<%@page import="com.model.MemberDTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="list.model.PlaceDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.controller.SegmentedPaths"%>
<%@page import="com.controller.TSPSolver"%>
<%@page import="list.model.ListDAO"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!--
   Helios by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>일정생성</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/sche.css" />
<noscript>
   <link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17ef75805e870442ce556e97240445b9"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="left-sidebar is-preload">
<%
         MemberDTO info = (MemberDTO)session.getAttribute("info");
      %>
   <div id="page-wrapper">

      <!-- Header -->
      <div id="header">

         <!-- Inner -->
         <div class="inner">
            <header>
               <h1>
                  <a href="main.jsp" id="logo">Pplan</a>
               </h1>
            </header>
         </div>

         <!-- Nav -->
         <nav id="nav">
              <ul>
                        <li><a href="main.jsp">Home</a></li>
                        <li><a href="recommend.jsp">추천일정</a></li>
                        <li><a href="../game1/game.jsp">게임하기</a></li>
                        <%if(info != null){ %>
                           <li><a href="menu_myPage.jsp">마이페이지</a></li>
                           <li><a href="../LogoutService">로그아웃</a></li>
                        <%}else{%>
                        <li><a href="login/login.jsp">로그인</a></li>
                        <%} %>
                     </ul>
         </nav>

      </div>


      <%
      // 전달된 배열 받기
      String[] dataArray = request.getParameterValues("dataArray");
      String placeStr = "";
      ListDAO dao = new ListDAO();
      ArrayList<PlaceDTO> daoArr = new ArrayList<>();

      if (dataArray != null) {
         for (int i = 0; i < dataArray.length; i++) {
            PlaceDTO selectedDTO = dao.selectedPlaceGet(Integer.parseInt(dataArray[i]));
            daoArr.add(selectedDTO);
         }

         /*             out.println("<h1>전송 받은 placeNum값 :</h1>");
                     out.println("<ul>");v
                     for (String value : dataArray) {
         out.println("<li>" + value + "</li>");
                     }
                     
                    for(PlaceDTO dto : daoArr){
                       out.println("<li>" + "<img src = \""+dto.getPlace_img()+"\">" + "</li>");
                    }
                     out.println("</ul>"); */
      } else {
         out.println("<h1>No Array Data Received</h1>");
      }
      Map<String, double[]> points = new HashMap<>();
      for (PlaceDTO dto : daoArr) {
         points.put(dto.getPlace_name(),
         new double[]{Double.parseDouble(dto.getPlace_latitude()), Double.parseDouble(dto.getPlace_longitude())});

      }
      TSPSolver tspSolver = new TSPSolver();
      SegmentedPaths segmentedPaths = tspSolver.findSegmentedPaths(points);

      /* segmentedPaths.printPaths(); */
      ArrayList<ArrayList<PlaceDTO>> schedule = segmentedPaths.paths();

      ArrayList<String> scheduleStr = new ArrayList<>();
      %>


      <!-- Main -->
      <div class="wrapper style1">

         <div class="container">
            <div class="row gtr-200">
               <div class="col-4 col-12-mobile" id="sidebar">
                  <hr class="first" />
                  <section>
                     <header>
                        <h3 id="sch_makelist1">
                           <a href="#">생성된 일정</a>
                        </h3>
                     </header>
                     <!--  <form action="/saveSchedule">
                            -->
                     <script type="text/javascript">
                           <%-- var positionArrArr = new Array(new Array());
                           var positionArr = new Array();
                           <%for(int i=0;i<schedule.size();i++) {%>
                                 <%for(int j=0;j<schedule.get(i).size();j++) {%>
                                    positionArrArr[<%=i%>].push("<%=schedule.get(i).get(j).getPlace_name()%>");
                                    positionArrArr[<%=i%>][<%=j%>] = "<%=schedule.get(i).get(j).getPlace_name()%>";
                                  <%}%>
                           <%}%> --%>
                          
                           </script>

                     <%
                     for (int j = 0; j < schedule.size(); j++) {
                        scheduleStr = new ArrayList<>();
                        placeStr = "";

                        for (int i = 0; i < schedule.get(j).size(); i++) {
                           placeStr += schedule.get(j).get(i).getPlace_name() + "///";
                        }
                     %>

                     <%--  <a href="#" onclick="CreateSchedule(<%=j%>)"> --%>
                     <div id="sch_makelist">
                        <input type="checkbox" name="cb" class="checkbox"
                           id="checkbox<%=j%>" value="<%=placeStr%>" />
                        <%
                        for (int i = 0; i < schedule.get(j).size(); i++) {
                           scheduleStr.add(schedule.get(j).get(i).getPlace_name());
                        %>
                        <span>&nbsp; <%=schedule.get(j).get(i).getPlace_name()%>&nbsp;
                        </span>
                        <%
                        }
                        %>


                     </div>
                     <!-- </a> -->



                     <%
                     }
                     %>


                     <%--                               <%
                                 for(PlaceDTO dto : daoArr){
                                   out.println("<span>" + "<img width='30%' height='20%'  src = \""+dto.getPlace_img()+"\">" + "</span>");
                                 }
                              %> --%>

                     <footer id="submitButton_footer">
                        <button onclick="submitForm()" id="submitButton" class="button">일정
                           저장</button>

                     </footer>

                     <!-- </form> -->
                  </section>
                

               </div>
               <div class="col-8 col-12-mobile imp-mobile" id="content">
                  <article id="main">
                     
                     <div id="mapWrap">
                        <div id="map" style="width: 100%; height: 500px;"></div>
                     </div>
                     <script>   
                              var container = document.getElementById('map');
                              var options = {
                                      center: new kakao.maps.LatLng(33.3596213, 126.5311884),
                                      level: 10
                                  };
                              var map = new kakao.maps.Map(container, options);
                               
                              var markers = {};
                              var markerPlace; 
                              
                              /** 체크박스 상태 변경 시 발생 함수*/
                              $(document).ready(function(){
                                       
                                  $(".checkbox").change(function(){
                                     var markers = new Array();
                                     var linePath = [];
                              
                                     $('#map').remove();
                                    let ttttt = "<div id='map' style='width:100%;height:500px;'></div>";
                                    $('#mapWrap').html(ttttt); 
                                    container = document.getElementById('map');
                                    options = {
                                            center: new kakao.maps.LatLng(33.3596213, 126.5311884),
                                            level: 10
                                        };
                                    map = new kakao.maps.Map(container, options);
                                     
                                      if($(".checkbox").is(":checked")){
                                          /* alert("체크"); */
/*                                           console.log($("input:checkbox[name='cb']:checked").val());
                                          markerPlace = $("input:checkbox[name='cb']:checked").val(); */
                                          var pp = new Array();
                                          $('input:checkbox[name=cb]').each(function () {
                                             if($(this).is(":checked")==true){
                                                pp.push($(this).val());
                                             }
                                            
                                            });
                                          markerPlace = pp;
                                          for(var p = 0;p<pp.length;p++){
                                          $.ajax({
                                              url : "../placeToLatLng",
                                              type : "POST",
                                              dataType : "Json",
                                              data : {"markerPlace":pp[p]},
                                              success : function(result){
                                                 //console.log(result);
                                                 /* console.log(result); */
                                                 
                                                 linePath = [];
                                                 
                                                 for(var i =0; i<result.length;i++){
                                                 
                                                    addMarker(new kakao.maps.LatLng(parseFloat(result[i].place_latitude), parseFloat(result[i].place_longitude)));
                                                    linePath.push(new kakao.maps.LatLng(parseFloat(result[i].place_latitude), parseFloat(result[i].place_longitude)));
                                                 
                                                 
                                                 }
                                                 var polyline = new kakao.maps.Polyline({
                                                  path: linePath, // 선을 구성하는 좌표배열 입니다
                                                  strokeWeight: 2, // 선의 두께 입니다
                                                  strokeColor: 'blue', // 선의 색깔입니다
                                                  strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                                                  strokeStyle: 'solid' // 선의 스타일입니다
                                              });
                                              
                                              // 지도에 선을 표시합니다 
                                              
                                              polyline.setMap(map);
                                              function addMarker(position) {
                                                   
                                                  // 마커를 생성합니다
                                                 var marker = new kakao.maps.Marker({
                                                    position: position
                                                 });
                                                 //hideMarkers();
                                                 // 마커가 지도 위에 표시되도록 설정합니다
                                                 marker.setMap(map);
                                                 // 생성된 마커를 배열에 추가합니다
                                                 markers.push(position);
                                                 
                                              }
                                              },
                                              error : function(e) {
                                                 console.log(e);
                                              }
                                           });
                                          }
                                      }
                                      else{
                                      }
                                  });
                              });

                              $(document).ready(function() {
                                  $(".routeCheckbox").change(function() {
                                      if ($(this).is(":checked")) {
                                          var selectedValue = $(this).val();
                                          /* console.log("Checked: " + selectedValue); */
                                      }
                                  });
                              });
                              function submitForm() {
                                 
                                 var checkedCheckboxes = $('input:checkbox[name=cb]:checked');
                                   
                                   if (checkedCheckboxes.length === 0) {
                                       alert("일정을 저장하기 전에 최소한 하나 이상의 체크박스를 선택해주세요.");
                                       return; // 폼 제출 방지
                                   }
                                    // form 요소 생성
                                    var form = document.createElement("form");
                                    form.setAttribute("method", "post");
                                    form.setAttribute("action", "../saveSchedule");
                                    var placeStr = new Array();   
                                    // 배열 값을 숨겨진 input 요소로 추가
                                    $('input:checkbox[name=cb]').each(function () {
                                        if($(this).is(":checked")==true){
                                           placeStr.push($(this).val());
                                           //console.log($(this).val());
                                        }
                                    });
                                    for(var i = 0;i<placeStr.length;i++){
                                        var input = document.createElement("input");
                                        input.setAttribute("type", "hidden");
                                        input.setAttribute("name", "place");
                                        input.setAttribute("value", placeStr[i]);
                                        form.appendChild(input);
                                    }
                               
                                    // form을 body에 추가하고 전송
                                    document.body.appendChild(form);
                                    form.submit();
                                    
                                }
                              

                           </script>

                  </article>
               </div>
            </div>
            <hr />

         </div>

      </div>

      <!-- Footer -->
      <div id="footer">
         <div class="container">
            <div class="row"></div>
            <hr />
            <div class="row">
               <div class="col-12">

                  <!-- Contact -->
                  <section class="contact">
                     <header>
                        <h3>일정 생성 가보자고</h3>
                     </header>
                     <p>공유할사람</p>
                     <ul class="icons">
                        <li><a href="#" class="icon brands fa-twitter"><span
                              class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon brands fa-facebook-f"><span
                              class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon brands fa-instagram"><span
                              class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon brands fa-pinterest"><span
                              class="label">Pinterest</span></a></li>
                        <li><a href="#" class="icon brands fa-dribbble"><span
                              class="label">Dribbble</span></a></li>
                        <li><a href="#" class="icon brands fa-linkedin-in"><span
                              class="label">Linkedin</span></a></li>
                     </ul>
                  </section>

                  <!-- Copyright -->
                  <div class="copyright">
                     <ul class="menu">
                        <li>&copy; Untitled. All rights reserved.</li>
                        <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                     </ul>
                  </div>

               </div>

            </div>
         </div>
      </div>

   </div>

   <!-- Scripts -->

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17ef75805e870442ce556e97240445b9"></script>
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/schedule.js"></script>
   <script src="assets/js/jquery.dropotron.min.js"></script>
   <script src="assets/js/jquery.scrolly.min.js"></script>
   <script src="assets/js/jquery.scrollex.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>