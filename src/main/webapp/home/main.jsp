<%@page import="com.model.BadgeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BadgeDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
   Helios by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>

<title>나만의 여행, PPLAN</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>

</head>
<body class="homepage is-preload">
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
						<a href="index.html" id="logo">PPLAN</a>
					</h1>
					<hr />
					<%if(info != null){ %>
					<%--  <%   BadgeDAO dao = new BadgeDAO();
                        
                           ArrayList<BadgeDTO> list = dao.badge(info.getId()); %>
                           <p> <%out.print("<img src='" + list.get(0).getBadge_img() + "' alt='' style='width: 30px; height: 30px;'/>"); %>
                            --%>
					<p><%=info.getNick() %>님 환영합니다
					</p>
					<%}else{%>
					<p>나만의 여행, 지금 만들어보세요</p>
					<%} %>
				</header>
				<footer>
					<%if(info != null){ %>
					<a href="../map/sidebar/map.jsp" data-text="Start" id="new-btn"></a>
					<%}else{%>
					<a href="#banner" data-text="Start" id="new-btn" class="new-btn1"></a>
					<%} %>
					<!-- <a href="#banner" class="button circled scrolly">Start</a> -->
				</footer>
			</div>

			<script>
                    document.addEventListener('DOMContentLoaded', function() {
                        const newBtn1 = document.querySelector('.new-btn1');
                        
                        if (newBtn1) {
                            newBtn1.addEventListener('click', function(event) {
                                event.preventDefault();
                                
                                const banner = document.querySelector('#banner');
                                banner.scrollIntoView({ behavior: 'smooth' });
                            });
                        }
                    });    
                  </script>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp">Home</a></li>
					<li><a href="recommend.jsp">추천일정</a></li>
					<li><a href="../game1/game.jsp">게임하기</a></li>

					<%if(info != null){ %>
					<li><a href="menuMyPage.jsp#mypagehere">마이페이지</a></li>
					<li><a href="../LogoutService">로그아웃</a></li>
					<%}else{%>
					<li><a href="login/login.jsp">로그인</a></li>
					<%} %>
				</ul>
			</nav>

		</div>

		<!-- Banner -->
		<section id="banner">
			<header>

				<%if(info != null){ %>
				<div class="title">
					<h2><%=info.getNick() %>'s
					</h2>
					<h3>
						<strong>&nbsp;&nbsp;&nbsp;&nbsp;JEJU</strong>.
					</h3>
				</div>
				<p>
					내 여행지는? &nbsp;<a id="gm-click" href="../game1/game.jsp"><strong
						id="gm-click">GAME gogo</strong></a>
				</p>
				<%}else{%>
				<div class="title">
					<h3>
						<strong>JEJU</strong>.
					</h3>
					<h2>Schedule sketch</h2>
				</div>
				<p>
					<a href="login/login.jsp"><strong>로그인을 해주세요</strong></a>
				</p>
				<%} %>
			</header>
		</section>

		<!-- Carousel -->
		<section class="carousel">
			<div class="reel">

				<article>
					<a href="#" class="image featured"><img
						src="https://www.lottehotel.com/content/dam/lotte-hotel/lotte/jeju/overview/introduction/g-0807.jpg.thumb.768.768.jpg"
						alt="" /></a>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="https://www.lottehotel.com/content/dam/lotte-hotel/lotte/jeju/overview/introduction/g-0809.jpg.thumb.768.768.jpg"
						alt="" /></a>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="https://mediaim.expedia.com/destination/1/d28b9de100e3957c0f38d1644562f390.jpg"
						alt="" /></a>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/20/32ec3ee6-fad9-440d-95ea-628ff6453a48.jpg"
						alt="" /></a>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="https://api.cdn.visitjeju.net/photomng/imgpath/201807/12/2a73a721-cd77-41aa-9efc-b061c55bca90.jpg"
						alt="" /></a>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/28/0b66710e-4fda-4cd7-8f10-803ac4c52a61.jpg"
						alt="" /></a>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="https://api.cdn.visitjeju.net/photomng/imgpath/202111/12/ed9c60f8-7424-42a7-bf27-aa503fe11453.jpg"
						alt="" /></a>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="https://api.cdn.visitjeju.net/photomng/imgpath/202111/10/751bfda5-574c-4307-9acc-53786451ca97.jpg"
						alt="" /></a>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="https://api.cdn.visitjeju.net/photomng/imgpath/202101/09/df72d9ff-df5a-41ee-b4bc-933c57580879.jpg"
						alt="" /></a>
				</article>

				<article>
					<a href="#" class="image featured"><img
						src="https://api.cdn.visitjeju.net/photomng/imgpath/201912/11/75160dd4-c210-4e08-b2a3-bdfadfd1512c.jpg"
						alt="" /></a>

				</article>

			</div>
		</section>

		<!-- Footer -->
		<div id="footer">
			<div class="container">

				<div class="row">
					<div class="col-12">

						<header>
							<h3>PPLAN</h3>
						</header>
						<p>JEJU. 나만의 여행</p>
						<hr>

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


		<!-- Scripts -->
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