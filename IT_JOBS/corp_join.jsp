<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Secular+One&display=swap');

*{
 box-sizing:border-box;
}

body{
	background-color: #FAFAFA;
	color: #424242;
}

/*input 박스를 감싸는 span태그들*/
.span{
	display: block;
    position: relative;
    width: 300px;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    vertical-align: top;

}

input{
	display : block;
	margin : 0 auto;
	width: 200px;
	height: 30px;
	border: white;
}

/*각 input박스 글자*/
h4{
	margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}

/*input창 div박스*/
.join_corp{
	position:absolute;
	margin-top: 15%;
	left: 50%;
	margin-left: -150px;
	margin-bottom: 10%;

}

/* 중복확인 버튼 */
#idcheck{
	width: 300px;
	margin: 10px 0 8px;

}

/*비밀번호 유효성검사 경고문*/
#input_pw p{
		margin : 5 auto;
		color: red;
}

/*'다음으로'버튼*/
#submit{
	margin-top: 40px;
	width: 300px;
    height: 51px;
    background: #819FF7;
    border-style: none;
    color: white;
}

/*WELCOM TO IT_JOBS*/
#IT_JOBS{
	display: block;
	margin: 0;
	font-family: 'Secular One', sans-serif;
	color: #819FF7;
}

#logo_div{
	position:absolute;
	width: 352px;
	height: 80px;
	left: 50%; 
	transform: translateX(-50%);


	margin-top: 10%;
}

</style>


<script type="text/javascript">
	//아이디 중복체크
	function idChk(){
		var doc = document.getElementsByName("member_id")[0];
		if(doc.value == null || doc.value.trim() ==""){
			alert("아이디를 먼저 입력해 주세요!");
		}else{
			window.open("corp.do?command=corp_idchk&member_id="+doc.value,"","width=300, height=300");
		}
	}
	
	function idChkConfirm(){
		var chk = document.getElementsByName("member_id")[0].title;
		if(chk == "n"){
			alert("아이디 중복확인을 먼저 해주세요");
			document.getElementsByName("member_id")[0].focus();
		}
	}
	

	
	// 비밀번호 유효성 검사
	function validate(element,min,max){
		var leng = element.value.length;
	    var p = document.createElement("p");
	    p.id = "warning";
	    p.textContent = min + "자 이상" + max + "자 이하로 입력하세요.";

		if((leng<min)||(leng>max)){
			element.parentElement.insertBefore(p,element.nextSibling).style.fontSize = "10px";
		}else if((leng>=min)||(leng<=max)){
			element.style.borderColor="#ffffff";
			var warning = document.getElementById('warning');
			warning.remove();
			
		}	
	}
	
	
</script>
</head>
<body>
<%@ include file="./form/nav_corp.jsp" %>
<div id="logo_div">
	<h1 id="IT_JOBS">WELCOME &nbsp; TO &nbsp; IT &nbsp;JOBS.</h1>
</div>
<div>
<form action="corp.do" method="post">
<input type="hidden" name="command" value="corp_join_01"/>
	<div class="join_corp">

			
			<div id="input_id">
			<h4 id=""><label for="member_id">아이디</label></h4>
			<span class="span">
			<input type="text" id="member_id" name="member_id" required="required" title="n">
			</span>
			<span>
			<input id="idcheck" type="button" value="중복확인" onclick="idChk();">
			</span>
			</div>
			
			<div id="input_pw">
			<h4><label for="member_pw">비밀번호</label></h4>
			<span class="span">
			<input type="password"  id="member_pw" name="member_pw" onclick="idChkConfirm();" required="required" onblur="validate(this,6,15)">
			</span>
			</div>
			
			<div id="input_name">
			<h4><label for="member_name">회사명</label></h4>
			<span class="span">
			<input type="text" id="member_name" name="member_name" onclick="idChkConfirm();" required="required">
			</span>
			</div>
			
			<div id="input_postcode">
			<h4><label for="member_postcode">우편번호</label></h4>
			<span class="span">
			<input type="text" id="member_postcode" name="member_postcode" onclick="idChkConfirm();"/>
			</span>
			</div>
			
			<div id="input_addr">
			<h4><label for="member_addr">회사주소</label></h4>
			<span class="span">
			<input type="text" id="member_addr" name="member_addr" onclick="idChkConfirm();"/>
			</span>
			</div>
			
			<div id="input_phone">
			<h4><label for="member_phone">담당자 연락처</label></h4>
			<span class="span">
			<input type="tel" id="member_phone" name="member_phone" onclick="idChkConfirm();"/>
			</span>
			</div>
			
			<div id="input_email">
			<h4><label for="member_email">담당자 이메일</label></h4>
			<span class="span">
			<input type="email" id="member_email" name="member_email" onclick="idChkConfirm();" required="required"/>
			</span>
			</div>
			
		<button type="submit" name="regist" id="submit"><b>다음으로</b></button>

	</div>
</form>
</div>
</body>
</html>


