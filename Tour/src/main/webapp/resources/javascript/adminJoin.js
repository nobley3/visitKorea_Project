$(document).ready(function(){
	
	let isusableId = false;
	//아이디 중복확인버튼
	$("#checkid").click(function(e){
		//alert("click");
		e.preventDefault();
		
		let userid = $("#userid").val();
		
		if(userid===''){
			 $("#confirmid").css("color","red").text("아이디를 입력하세요.");
			 isusableId = false;
		}else if(userid.indexOf(' ') >= 0){
			 $("#confirmid").css("color","red").text("아이디를 공백없이 입력하세요.");
	         isusableId = false;
		}else if(!/^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{4,12}$/.test(userid)){
			 $("#confirmid").css("color","red").text("아이디는 영문 대소문자와 숫자를 포함하여 4~12자리로 입력해야합니다!");
             isusableId = false;
		}
		else{
			
		$.ajax({
			type:"post",
			url:"/tour/checkId",
			data :{userid:userid},
			success:function(data){
				if(data==="1"){
					$("#confirmid").css("color", "red").text("사용 중인 아이디입니다.");
					isusableId = false;
				}else{
					$("#confirmid").css("color", "blue").text("사용 가능한 닉네임입니다.");
					isusableId = true;
				}
			},
			error:function(err){
				console.log(err);
			}
			
		});
	}
		
		
	});
	//$("#checkid").click 끝
	
	// 아이디중복 경고메시지 삭제
	$("#userid").on("input", function () {
	    $("#confirmid").text(""); 
	});
	
	// 비밀번호 유효성 및 확인
	$("#pw").on("input",function(){
		let pw = $("#pw").val();
		let checkpw = $("#checkpw").val();
		let pwreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;
		
		if(!pw){
			$("#confirmpw").css("color", "").text(""); // 비밀번호가 비어있을 때 메시지 제거
		}
		else if(!pwreg.test(pw)&&!pwreg.test(checkpw)){
			 $("#confirmpw").css("color", "red").text("비밀번호는 영문대소문자/숫자/특수문자를 포함하여 8~16자리로 입력해야합니다!");
		}
		else{
			$("#confirmpw").css("color", "blue").text("사용 가능한 비밀번호 입니다.");
		}
	});
	
	// 비밀번호가 일치하지 않습니다
    $("#checkpw").on("input",function(){
        let pw = $("#pw").val();
        let checkpw = $("#checkpw").val();
        let pwreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;

        if(checkpw==""){
        	 $("#confirmpw").css("color", "red").text("비밀번호 확인을 해주세요.");
        }
        else if(pw !== checkpw){
            $("#confirmpw").css("color", "red").text("비밀번호가 일치하지 않습니다.");
        }else if(!pwreg.test(pw)&&!pwreg.test(checkpw)){
            $("#confirmpw").css("color", "red").text("비밀번호는 영문대소문자/숫자/특수문자를 포함하여 8~16자리로 입력해야합니다!");
        }else{
            $("#confirmpw").css("color", "blue").text("사용 가능한 비밀번호 입니다.");
        }
    });
	
	
	
	
	//alert("hi");
	//가입버튼누를때
	$("#registerbtn").click(function(){
	//alert("click");
		
		let userid =  $("#userid").val();
		let nickname = $("#nickname").val();
		let pw = $("#pw").val();
		
		let adminInfo = {
				userid : userid,
				nickname : nickname,
				pw : pw				
		};
		
		 // 모든필드 입력
        if(userid===""||nickname==""||pw===""){
            $("#resultMessage").text("모든 필드를 입력하세요.");
            if (userid === "") {
            	$("#userid").focus();
            } else if (nickname === "") {
                $("#nickname").focus();
            } else {
                $("#pw").focus();
            } 
            return;
        }
		
        // 아이디 중복확인 유무
        if(!isusableId){
            $("#confirmid").css("color", "red").text("아이디 중복확인을 하세요.");
            return;
        }
		
		$.ajax({
			
			url : "/tour/insertAdmin",
			type : "post",
			data : adminInfo,
			success : function(data){
				$("#resultMessage").text("회원가입성공");
				// 폼리셋
				$("#userid, #nickname, #pw,#checkpw").val("");
				
				$("#userid, #nickname, #pw").val("");
				$("#confirmpw").css("color", "").text("");
				$("#confirmid").css("color", "").text("");
				
			},
			error : function(err){
				console.log(err);
				$("#resultMessage").text("회원가입실패");
			}
		});
		
	});
	//$("#registerbtn").click 끝
	
	//취소버튼
	$("#cancelbtn").click(function(){
		 history.back(); 
	
	});
	
	//회원가입 성공 메세지 후 다시 등록할 때 메세지 리셋
	$("#userid, #nickname, #pw").click(function() {
        $("#resultMessage").text("");
    });
	
	
});