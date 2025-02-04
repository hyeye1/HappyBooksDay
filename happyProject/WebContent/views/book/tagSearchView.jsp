<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, com.kh.book.model.vo.*"%>
<%
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .outer{
            margin: auto;
            margin-bottom: 20px;
            border: 1px solid white;
            width:1000px;
        }
        .tagSearch{
            margin-bottom: 20px;
            font-size: xx-large; 
            font-weight: bold; 
            color: rgb(241, 196, 15);
        }
        #searchBox{
            width: 230px;
            height: 30px;
            border-top: 0;
            border-left: 0;
            border-right: 0;
            border-color: rgb(163, 163, 163);
            font-size: large;
            font-weight: bold;
            color: lightgray;
        }
        #searchBtn{
            width: 70px;
            height: 36px;
            font-size: medium;
            font-weight: bold;
            color: darkgray;
            border: none;
            background-color: rgb(249, 219, 122);
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 5px;
        }
        #searchBtn:hover{background-color: rgb(249, 219, 122); color:white;}
        .bestTag span{
            font-size: large;
            font-weight: bold;
            margin-right: 600px;
        }
        .bestTagBox{
            width: 800px;
            height: 160px;
            border: 1px solid white;
            background-color: rgb(255, 233, 161);
            margin-bottom: 30px;
            border-radius: 80px;
            margin-top: 20px;
        }
        .tag a{
        	text-decoration: none;
            height: 36px;
            width: 87px;
            line-height: 2.7; 
            display: block; 
            text-align: center;
            float:left;
            margin-left:-10px;
            margin-top:-8px;
        	color: grey;
        	border-radius: 80px;
        }
        .tag{
            width: 85px;
            height: 40px;
            padding:8px;
            margin-top: 25px;
            margin-left: 30px;
            font-size: medium;
            color: grey;
            background-color: white;
            border: 0px;
            border-radius: 20px;
            cursor: pointer;
        }
        
        .tag:hover{
        	background-color: rgb(255, 233, 161);
            width:85px;
            margin-top:0px;
            font-color: white;
            font-size: 20px;
            font-weight: 900;
                }
       .tag a:hover{
            color: white;
            font-size: 20px;
            font-weight: 900;
            line-height: 200%;			
            }
       .tagSearch input::placeholder {
                color:lightgrey; 
            }
        .searchBook{
            width: 1000px;
            background-color: rgb(245, 245, 245);
            border: 1px solid rgb(173, 172, 172);
            border-left: 0;
            border-right: 0;
            border-bottom: 0;
            padding-top: 10px;
            
        }
        .searchBook span{
            font-size: large;
            font-weight: bold;
            color: gray;
            
        }
        #tagPoint{color: rgb(241, 196, 15);}
        #book{
            font-size: small;
            text-align: left;
            width: 120px;
            height: 180px;
            margin: 30px;
            margin-left: 15px;
            margin-top: 70px;
        }
        .bookList{padding-left: 70px;}
        .bookList th{cursor: pointer; float:left; }
        .bookList tr{float:right; margin-top:50px;}
        #bookImg{ 
            width: 130px;
            height: 180px;
            border-radius: 3px;
            box-shadow: 2px 0px 20px -2px gray;
            border: 1px solid darkgray;
        }
        #no{
        	font-size:13px;
        }
        #bkName{
            color: black;
            font-size: 14px;
            font-weight: 600;
            vertical-align: top;
        	}
        #author{
        	font-size:13px;
        	font-weight: 500;
        	}
        #price{
            color: rgb(52, 152, 219);
            font-size: 14px;
            font-weight: 700;
            vertical-align: bottom;
        	}
    </style>
</head>
<body>
	
	
	<%@ include file="../common/menubar.jsp" %>

	
	 
    <div class="outer">
	<p align="left" style="color: gray; font-size:11px; font-weight: bolder;">HOME > 해쉬태그 검색</p>
        <img src="resources/images/tag.png" width="1000" height="250">
        <br><br><br>
        <form class="tagSearch" action="" method="GET" align="center">
            <span>#</span>
            <input id="searchBox" type="text" placeholder="검색할 해쉬태그 입력" name="hashkey">
            <button id="searchBtn">검색</button>
        </form>
        <div class="bestTag" align="center">
        	<br>
            <span>놓칠 수 없는 인기 태그</span>
            <div class="bestTagBox">
                <button class="tag"><a  href="hashtag.li?hashkey=꿈">#꿈</a></button>
                <button class="tag"><a  href="hashtag.li?hashkey=희망">#희망</a></button>
                <button class="tag"><a  href="hashtag.li?hashkey=여행">#여행</a></button>
                <button class="tag"><a  href="hashtag.li?hashkey=가족">#가족</a></button>
                <button class="tag"><a  href="hashtag.li?hashkey=친구">#친구</a></button><br>
                <button class="tag"><a  href="hashtag.li?hashkey=마음">#마음</a></button>
                <button class="tag"><a  href="hashtag.li?hashkey=위로">#위로</a></button>
                <button class="tag"><a  href="hashtag.li?hashkey=감정">#감정</a></button>
                <button class="tag" style="width: 90px;"><a  href="hashtag.li?hashkey=재테크">#재테크</a></button>
            </div>
        </div>
        <br><br>
       <div class="searchBook" align="center">
            <span id="tagPoint">'#<%= request.getParameter("hashkey") %>'</span> 
            <span>검색어로 총</span>
            <span id="tagPoint"><%= list.size() %></span>
            <span>가지의 관련 도서를 찾았습니다!</span>
            <br><hr>

            <table class="bookList">
                <tr>
                <%for(int i = 0; i<list.size(); i++) {%>
                    <th>
                        <img src="<%= list.get(i).getBkMainImg() %>" id="bookImg">
                    </th>
                    <th id="book">
                     <!--  <img src="resources/images/bestbook.png" width="80"><br> -->
                        <span id="no"> <%= (i+1) %>.<br> </span><br>
                        <span id="bkName"> <%= list.get(i).getBkName() %><br> </span>
                        <span id="author"> <%= list.get(i).getAuthor() %><br> </span>
                        <span id="price"> <%= list.get(i).getBkPrice() + "원" %> </span>
                    </th>

                    <% } %>
                </tr>
            </table>
       </div>

    <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>