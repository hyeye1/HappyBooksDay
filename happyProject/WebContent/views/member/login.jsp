<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .loginOuter{
            width: 1000px;
            height: 700px;
            margin: auto;
        }
        .loginInput input{
            width: 260px;
            height: 28px;
            margin: 8px;
            border: 1.5px solid lightgray;
            border-radius: 5px;
        }
        Input::placeholder{
            font-size: 11px;
            color: darkgray;
        }
        #loginBtn{
            width: 270px;
            height: 32px;
            margin-bottom: 8px;
            margin-top: 15px;
            background-color: rgb(249, 219, 122);
            color: grey;
            border: none;
            border-radius: 5px;
            font-weight: 550;
            font-size: 13.5px;
        }
        .loginMid{width: 270px; height: 90px; border-bottom: 1.5px solid darkgray;}
        #loginHoldYN{
            float: left;
            color: gray;
            font-size: 11px;
            font-weight: 500;
        }
        #joinNow a{
            float: right;
            margin-top: 3px;
            margin-right: 3px;
            text-decoration:none;
            color:gray;
            font-size: 12.5px;
            font-weight: 550;
        }
        .loginSns input{
            width: 45px;
            margin: 12px;
            margin-top: 5px;
        }
        .loginSns p{
            font-size: 13.5px;
            font-weight: 700;
            color: rgb(94, 94, 94);
        }
        .loginFind{
            margin: 15px;
        }
        .loginFind a{
            clear: both;
            margin-top: 25px;
            text-decoration: none;
            color: rgb(134, 134, 134);
            font-size: 12.5px;
            font-weight: 600;
        }
        .loginOuter button, #loginHoldYN input, label{cursor: pointer;}
        
    </style>
</head>
<body>

<form action="<%= request.getContextPath() %>/login.me" method="post" id="loginForm">
    <div class="loginOuter" align="center">
       <a href="<%=request.getContextPath()%>"> <img  src="resources/images/logo.png" width="180px" style="margin-right: 2px; margin-top: 70px;"></a>
        <br> <br>
        <div class="loginInput">
            <input type="text" id="memId" name="memId" placeholder="  아이디" required><br>
            <input type="password" id="memPwd" name="memPwd" placeholder="  비밀번호" required>
        </div>
        <div class="loginMid">
            <button type="submit" id="loginBtn">로그인</button> <br>
            <span id="loginHoldYN"><input type="checkbox" id="loginOn" name="loginOn" value="true" onclick="loginOn"><label for = "loginOn">로그인 상태 유지</label></span>
            	<script>
					$(function(){
						$("#loginOn").change(function(){
							if($(this).prop("checked")){
								var value = "true";
							}
						})
					})
            	</script>
            <span id="joinNow"><a href="<%= request.getContextPath() %>/joinForm1.me">회원가입</a></span>
        </div>
        <div class="loginSns" align="center">
            <br>
            <p>간편로그인</p>
            <input type="image" src="resources/images/naverlogin.png" id="naverLogin">
            <input type="image" src="resources/images/kakaologin.png" id="kakaoLogin">
            <input type="image" src="resources/images/facebooklogin.png" id="facebookLogin">
        </div>
        <div class="loginFind">
            <span id="loginFindId"><a href="<%= request.getContextPath() %>/findIdForm.me">아이디 찾기</a></span>
            <span style="color: darkgrey;">|</span>
            <span id="loginFindPwd"><a href="<%= request.getContextPath() %>/findPwdForm.me">비밀번호 찾기</a></span>
        </div>


    </div>
    
  </form>
</body>
</html>