
$(document).ready(function(){

	//중복확인 누르면
		$("#checkNickname").click(function(e){
		    
			e.preventDefault(); // 기본 폼 제출 방지
			
			let nickname = $("#nickname").val();
			
			
			$.ajax({
				type:"post",
				url: "/tour/updatecheckNickname",
				data:{nickname:nickname},
				success:function(data){
					if(data==="1"){
						 $("#confirmnickname").css("color", "red").text("사용 중인 닉네임입니다.");
						 
					}else{
						 $("#confirmnickname").css("color", "blue").text("사용 가능한 닉네임입니다.");
						 
					}
				},
				error : function(err){
					console.log(err);
					
					
				}
			});
			
		});

	//취소버튼
	$("#cancelbtn").click(function(){
		 history.back(); 
	
	});


    // 비밀번호 유효성 및 확인
    $("#pw").on("input",function(){

        let pw = $("#pw").val();
        let checkpw = $("#checkpw").val();
        let pwreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;

        if(!pwreg.test(pw)&&!pwreg.test(checkpw)){
            $("#confirmpw").css("color", "red").text("비밀번호는 영문대소문자/숫자/특수문자를 포함하여 8~16자리로 입력해야합니다!");
        }else{
            $("#confirmpw").css("color", "blue").text("사용 가능한 비밀번호 입니다.");
        }
    });

    // 비밀번호가 일치하지 않습니다
    $("#checkpw").on("input",function(){
        let pw = $("#pw").val();
        let checkpw = $("#checkpw").val();
        let pwreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;

        if(pw!==checkpw){
            $("#confirmpw").css("color", "red").text("비밀번호가 일치하지 않습니다.");
        }else if(!pwreg.test(pw)&&!pwreg.test(checkpw)){
            $("#confirmpw").css("color", "red").text("비밀번호는 영문대소문자/숫자/특수문자를 포함하여 8~16자리로 입력해야합니다!");
        }else{
            $("#confirmpw").css("color", "blue").text("사용 가능한 비밀번호 입니다.");
        }
    });

    // CapsLock 여부
    function checkCapsLock(event){
        
        let CapsLockOn = event.getModifierState && event.getModifierState('CapsLock');

        if(CapsLockOn){
            $("#resultMessage").css("color", "red").text("<CapsLock>이 켜져 있습니다.");
        }else{
            $("#resultMessage").text("");
        }
    }

        document.getElementById("pw").addEventListener('keydown',checkCapsLock);
        document.getElementById("checkpw").addEventListener('keydown',checkCapsLock);


    //이메일 직접입력 or 이메일 option 선택

        let emailList = document.querySelector('#emaillist');
        let emailD = document.querySelector('#emailD');

    emailList.addEventListener('change',(event)=>{
        // option에 있는 도메인 선택 시
        if(event.target.value !== "type"){
            // 선택한 도메인을 input에 입력하고 disabled
            emailD.value = event.target.value;
            emailD.disabled = true;
        }else{
            //직접입력 시
            // input 내용 초기화 & 입력 가능하도록 변경
            emailD.value = "";
            emailD.disabled = false;
        }
    });

    // 비밀번호 보이게 안보이게
    $('.joinContents i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).toggleClass('fa-eye fa-eye-slash')
                .prev('input').attr('type',"text");
        } else {
            $(this).toggleClass('fa-eye fa-eye-slash')
                .prev('input').attr('type','password');
        }
    });

});