<%@page import="com.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<link rel="stylesheet" href="../css/login.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
a {

display: block;

text-align: center;

}

.link-up{
   color:#0B3861;
   text-decoration-line: none;
   font-weight: bold;
}
.btn-sign{
	margin-bottom:4px;
}
</style>
   <script>
  
            window.Kakao.init("0e287908b28c66fab4de78695625ec5a");//카카오 초기화
            window.Kakao.isInitialized();//카카오 API가 초기화되었는지를 확인하는 JavaScript 함수
            function kakaoLogin(){ //로그인기능
               window.Kakao.Auth.login({
                  scope:'profile_nickname,account_email',//로그인할때 내가 받아오는 값
                  success: function(authObj){
                     console.log(authObj);
                     window.Kakao.API.request({
                        url:'/v2/user/me',
                        success : res => {   //성공했을때 
                           const kakao_account=res.kakao_account;
                           console.log(kakao_account);
                        }
                  });
               
            }
               });
            }

            function kakaoLogout() {
                 if (Kakao.Auth.getAccessToken()) {
                 Kakao.API.request({
                     url: '/v1/user/unlink',
                     success: function (authObj) {
                         console.log(authObj)
                     },
                     fail: function (error) {
                     console.log(error)
                     },
                 })
                 Kakao.Auth.setAccessToken(undefined)
                 alert("로그아웃 성공");
                 }
             }  
            </script>

</head>
<main class="main">
  <section class="home">
    <h1>Welcome to the <span onclick="location.href='../main.jsp'">PPLAN</span></h1>
    <button id="sign-up" class="btn">Sign Up</button>
    <button id="sign-in" class="btn">Log In</button>
    <p><a class="link-copy">Trophy 2023</a></p>
  </section>

  <section class="sign-up">
    <article class="signup-left">
      <h1>PPLAN</h1>
      <div class="wc_message">
        <h3>Let's PPLAN Now!</h3>
        <p>It's Easy and takes less then 30 seconds.</p>
      </div>
      <div class="btn-back">
        <a href="login.jsp" class="fas fa-2x fa-angle-left angle-left-color"><img src="left.png" width="30px" height="30px"></a>
      </div>
    </article>

    <article class="form-area">
      <!-- Form area Sign Up -->

      <div class="organize-form form-area-signup">
        <h2>SIGN UP</h2>
        <form action="../../JoinService" class="form" method="post">
          <div class="form-field">
            <label for="name">ID</label>
            <input name ="id" type="text" id="name" /><span id="idCheck"></span>
          </div>
          
         <script type="text/javascript">
         $(document).ready(function(){
               
               $("#name").keyup(function(){
                  const idCheck = document.getElementById("idCheck");
                  let inputId = $('#name').val();
                  
                  $.ajax({
                     url : "../../idCheck",
                     data : {"id" : inputId},
                     success : function(text){
                        
                        if(text==="true"){
                           idCheck.innerText = "중복된 아이디입니다.";
                        }else{
                           idCheck.innerText = "사용 가능한 아이디입니다.";
                        }
                     },
                     error : function(e){
                        console.log(e);
                     }
                  });
                  
                  
               });
            });
         
         </script>
       
          <div class="form-field">
            <label for="password">Password</label>
            <input name="pw" type="password" id="password" />
          </div>

          <div class="form-field">
            <label for="nick">NickName</label>
            <input name="nick" type="text" id="nick" /><span id="nickCheck"></span>
          </div>
                  <script type="text/javascript">
         $(document).ready(function(){
               
               $("#nick").keyup(function(){
                  const nickCheck = document.getElementById("nickCheck");
                  let inputNick = $("#nick").val();
               
                  $.ajax({
                     url : "../../nickCheck",
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
         
         </script>

          <div class="form-field">
            <label for="email">Email</label>
            <input name="email" type="text" id="email" />
          </div>

          <button class="btn-sign btn-up">Sign Up</button>
        </form>

      </div>

      <!-- Form area Sign In -->
      <div class="organize-form form-area-signin">
        <h2>Log IN</h2>
        <form action="../../LoginService" method="post" class="form">
          <div class="form-field">
            <label for="email-in">ID</label>
            <input type="text" name="id" id="email-in" />
          </div>

          <div class="form-field">
            <label for="password-in">Password</label>
            <input type="password" name="pw" id="password-in" />
          </div>
          <br>
          <br>
          <button class="btn-sign btn-in">Log In</button>
          <br>
            <a href="javascript:kakaoLogin();"><img src="kakao_login_medium_wide.png" width="98%"></a>
           <a href="javascript:kakaoLogout();" class="link-up1">logout</a> 
           <br>
           <br>
           
		<a href="#" class="link-up">Sign Up</a>
        </form>
        </div>
        
    </article>

    <article class="signup-right">
      <i class="fas fa-2x fa-bars bars-style"></i>
      <p><a class="link-copy">Trophy 2023</a></p>
    </article>
  </section>
  <script type ="text/javascript"> 
 const el = {
        signUpHome: document.getElementById('sign-up'),
        signInHome: document.getElementById('sign-in'),
        btnHome: document.querySelector('.btn-back'),
        pageMain: document.querySelector('.main'),
        pageHome: document.querySelector('.home'),
        pageSignUp: document.querySelector('.sign-up'),
        formArea: document.querySelector('.form-area'),
        sideSignLeft: document.querySelector('.signup-left'),
        sideSignRight: document.querySelector('.signup-right'),
        formSignUp: document.querySelector('.form-area-signup'),
        formSignIn: document.querySelector('.form-area-signin'),
        linkUp: document.querySelector('.link-up'),
        linkIn: document.querySelector('.link-in'),
        btnSignUp: document.querySelector('.btn-up'),
        btnSignIn: document.querySelector('.btn-in'),
        labels: document.getElementsByTagName('label'),
        inputs: document.getElementsByTagName('input'),
      };


      // ADD Events
      // Show the page Sign Up
      el.signUpHome.addEventListener('click', function(e) {
        showSign(e, 'signup');
      });
      el.linkUp.addEventListener('click', function(e) {
        showSign(e, 'signup');
      });

      // Show the page sign in
      el.signInHome.addEventListener('click', function(e) {
        showSign(e, 'login');
      });
      el.btnSignUp.addEventListener('click', function(e) {
        showSign(e, 'login');
      });

      // Show the page Home
      el.btnHome.addEventListener('click', showHome);


      // Functions Events
      // function to show screen Home
      function showHome(event) {
        
        
        setTimeout(function() {
          el.sideSignLeft.style.padding = '0';
          el.sideSignLeft.style.opacity = '0';
          el.sideSignRight.style.opacity = '0';
          el.sideSignRight.style.backgroundPositionX = '235%';

          el.formArea.style.opacity = '0';
          setTimeout(function() {
            el.pageSignUp.style.opacity = '0';
            el.pageSignUp.style.display = 'none';
            for (input of el.inputs)  {
              input.value = '';
            }
          }, 900);

        }, 100);

        setTimeout(function() {
          el.pageHome.style.display = 'flex';
        },1100);
        
        setTimeout(function() {
          el.pageHome.style.opacity = '1';
        }, 1200);

      }
      // function to show screen Sign up/Sign in
      function showSign(event, sign) {

        if (sign === 'signup') {
          el.formSignUp.style.display = 'flex';
          el.formSignIn.style.opacity = '0';
          setTimeout(function() {
            el.formSignUp.style.opacity = '1';
          }, 100);
          el.formSignIn.style.display = 'none';

        } else {
          el.formSignIn.style.display = 'flex';
          el.formSignUp.style.opacity = '0';
          setTimeout(function() {
            el.formSignIn.style.opacity = '1';
          }, 100);
          el.formSignUp.style.display = 'none';
        }

        el.pageHome.style.opacity = '0';
        setTimeout(function() {
          el.pageHome.style.display = 'none';
        }, 700);
        
        setTimeout(function() {
          el.pageSignUp.style.display = 'flex';
          el.pageSignUp.style.opacity = '1';
          
          setTimeout(function() {
            el.sideSignLeft.style.padding = '20px';
            el.sideSignLeft.style.opacity = '1';
            el.sideSignRight.style.opacity = '1';
            el.sideSignRight.style.backgroundPositionX = '230%';

            el.formArea.style.opacity = '1';
          }, 10);

        }, 900);
      }

      // Behavior of the inputs and labels
      for (input of el.inputs) {
        console.log(input)
        input.addEventListener('keydown', function() {
          this.labels[0].style.top = '10px';
        });
        input.addEventListener('blur', function() {
          if (this.value === '') {
            this.labels[0].style.top = '25px';
          }
        })
      } 
      
 </script>
</main>
</html>