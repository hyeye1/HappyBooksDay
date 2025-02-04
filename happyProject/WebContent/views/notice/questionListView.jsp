<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.notice.model.vo.Question, com.kh.common.model.vo.PageInfo, com.kh.member.model.vo.Member "%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
 	String contextPath = request.getContextPath(); 
 	Member loginUser = (Member)session.getAttribute("loginUser");
 	
 	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <style>
        .outer{
            margin-top: 50px;
            margin: auto;
            margin-bottom: 20px;
            border: 1px solid white;
            width:800px;
        }
        #text1{font-size:x-large; font-weight: bold;}
        #text2{color:rgb(241, 196, 15); font-weight: bold;}
        #text3{font-size: large; font-weight: bold;}
        .top{
            margin: auto;
            margin-top: 50px;
        }
        .btn{
            width: 300px;
            height: 30px;
            border: 1px solid gray;
            color: gray;
            background-color: lightgrey;
            border-radius: 8px;
            padding: 5x;
            font-size: medium;
            cursor: pointer;
        }
        .clicked{background-color: rgb(249, 219, 122); color:white;}
        .btnouter{margin-top: 20px;}
        #btn1{
            width: 120px;
            height: 40px;
            font-size: medium;
            font-weight: bold;
            color: gray;
            border: 1px solid lightgrey;
            background-color: rgb(249, 219, 122);
            border-radius: 4px;
            padding: 5px;
            cursor: pointer;
        }
        #btn2{
            width: 85px;
            height: 30px;
            font-size: small;
            font-weight: bold;
            color: gray;
            border: 1px solid lightgrey;
            background-color: white;
            border-radius: 4px;
            padding: 5px;
            cursor: pointer;
        }
        #btn3{
            border: 1px solid lightgray;
            color: black;
            background-color: lightgray;
            border-radius: 5px;
            padding: 6px;
            }
        #btn1:hover, #btn2:hover, #btn3:hover{
            background-color: rgb(249, 219, 122); 
            color:white;
        }
        .pageButton{font-size: medium;}
        .topinfo{
            width: 800px;
            height: 60px; 
            border: 1px solid gray;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 50px;
        }
        .topinfo li{line-height: 25px;}
        #top{height: 30px; background-color: rgb(249, 219, 122);}
        .listArea{
            text-align: center; 
        }
        .listArea>tbody>tr:hover{
            cursor:pointer;
            background: rgb(249, 219, 122);
            color: white;
        }
        .noQuestion{
            font-size: x-large;
            font-weight: bold;
            border: 2px solid lightgrey;
            border-left: 0;
            border-right: 0;
            padding-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="outer">
        <div class="top">
            <span id="text1">1:1 문의</span>
            <hr>
            <span>언제나 고객님을 최우선으로 생각하는 저희 해피북스데이에서는</span>
            <span id="text2">고객님의 불편사항</span>이나<br>
            <span id="text2">문의사항</span>을 최대한 빠르고 정확하게 처리하기 위해 노력하고 있습니다.<br><br>
                <div class="btnouter" align="center">
                    <button type="button" class="btn"  onClick="location.href='<%= contextPath %>/enrollForm.q';">1:1 문의하기</button>
    
                </div><hr>
                

            
            <div class="topinfo">
                <span id="text3">&emsp;1:1문의 안내</span><hr>
                <ul>
                    <li>회원님께서 문의하신 상담내용은 입력하신 이메일과 SMS로 결과를 회신해 드립니다.</li>
                    <li>그 외의 정보들은 회원정보상의 이메일로 발송해드리므로 항상 최신회원정보로 유지해주시기 바랍니다.</li>
                </ul>
            </div><br>
        </div>
        <br>
        
        <div class="dateSearch">&nbsp;

            <button id="btn2">1 개월</button>
            <button id="btn2">3 개월</button>
            <button id="btn2">6 개월</button>&emsp;&emsp;
            
            <button id="btn2">조회</button>
        </div><br>
     
        <table class="listArea">
            <thead>
                <tr id="top">
                    <th width="100">문의날짜</th>
                    <th width="370">문의 제목</th>
                    <th width="100">유형</th>
                    <th width="100">답변상태</th>
                    <th width="130">주문번호</th>
                </tr>
            </thead>
            <tbody>
                 <% if(list.isEmpty()){ %>
             	<tr>
             		<td colspan="5">존재하는 문의가 없습니다. </td>
             	</tr>
            <%} else { %>
            	<% for(Question q:list) { %>
	                <tr>
	                    <td><%= q.getqDate() %></td>
	                    <td><%= q.getqTitle() %></td>
	                    <td><%= q.getqField() %></td>
	                    <td><%= q.getqAnswerYn() %></td>
	                    <td><%= q.getoR_NO_Q() %></td>
	                </tr>
	            <%} %>
             <%} %>
            </tbody>
        </table>
        -

        <!-- 문의내역 없을 때 보여지는 화면
        <div class="noQuestion" align="center"><br><br>
            <img src="resources/image/noquestion.png"><br>
            <span>1:1 문의 내역이 없습니다.</span><br><br><br>
        </div>
        <br>
         -->
        <div align="center" class="pagingArea">

			<% if(currentPage != 1) { %>
            	<button onclick="location.href='<%=contextPath%>/list.q?currentPage=<%=currentPage-1%>';">이전</button>
			<% } %>
			
			<% for(int p=startPage; p<=endPage; p++) { %>
				
				<% if(currentPage == p){ %>
            		<button disabled><%= p %></button>
            	<% }else{ %>
            		<button onclick="location.href='<%=contextPath%>/list.q?currentPage=<%= p %>';"><%= p %></button>
            	<% } %>
            	
			<% } %>
			
			<% if(currentPage != maxPage){ %>
            	<button onclick="location.href='<%=contextPath%>/list.q?currentPage=<%=currentPage+1%>';">다음</button>
			<% } %>
			
        </div>
            
        </div><br>
        
        <script>
            var btn = document.getElementsByClassName("btn");
        
                function handleClick(event) {
                console.log(event.target);
                
                console.log(event.target.classList);
        
                if (event.target.classList[1] === "clicked") {
                    event.target.classList.remove("clicked");
                } else {
                    for (var i = 0; i < btn.length; i++) {
                    btn[i].classList.remove("clicked");
                    }
        
                    event.target.classList.add("clicked");
                  }
                }
        
                function init() {
                    for (var i = 0; i < btn.length; i++) {
                        btn[i].addEventListener("click", handleClick);
                    }
                }
                init();
        </script>
       
    </div>
</body>
</html>
