
$(document).ready(function(){

    // 아이디 중복검사 결과를 저장할 변수
    let isusableId = false;

     // 아이디 중복검사 버튼 누를 때
    $("#checkId").click(function(){
        
        let id = $("#userid").val().trim();
        
        // 아이디 공백,중복검사,유효성 검사
        if(id === ''){
            $("#confirmid").css("color","red").text("아이디를 입력하세요.");
            isusableId = false;
        }else if(id.indexOf(' ') >= 0){
            $("#confirmid").css("color","red").text("아이디를 공백없이 입력하세요.");
            isusableId = false;
        }else if(!/^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{4,12}$/.test(id)){
            $("#confirmid").css("color","red").text("아이디는 영문 대소문자와 숫자를 포함하여 4~12자리로 입력해야합니다!");
            isusableId = false;
        }else{
            // 아이디 중복검사
            $.ajax({
                url:"/tour/checkId",
                type : "post",
                data: {userid : id},
                success : function(data){
                    if(data.trim()=== "사용중인 아이디 입니다."){
                        $("#confirmid").css("color","red").text("사용 중인 아이디 입니다.");
                        isusableId = false;
                    }else{
                        $("#confirmid").css("color","blue").text("사용 가능한 아이디 입니다.");
                        isusableId = true;
                    }
                },
                error : function(err){
                    console.log(err);
                    isusableId = false;
                }
            });
        }
    });
    
    
    
    
    
    
    //$("#checkId").click(function() 끝

    let isusableNickname = false;

    // 닉네임 중복검사 누르면
    $("#checkNickname").click(function(){

        let nickname = $("#nickname").val();

        // 닉네임 공백, 중복검사
        if(nickname === ''){
            $("#confirmnickname").css("color","red").text("닉네임을 입력하세요.");
            isusableNickname = false;
        }else if(nickname.indexOf(' ') >= 0){
            $("#confirmnickname").css("color", "red").text("닉네임을 공백없이 입력하세요.");
            isusableNickname = false;
        }else{
            // 닉네임 중복검사
            $.ajax({
                url : "/tour/checkNickname",
                type : "post",
                data : {nickname : nickname},
                success : function(data){
                    if(data==="1"){
                        $("#confirmnickname").css("color", "red").text("사용 중인 닉네임입니다.");
                        isusableNickname = false;
                    }else{
                        $("#confirmnickname").css("color", "blue").text("사용 가능한 닉네임입니다.");
                        isusableNickname = true;
                    }
                },
                error : function(err){
                    console.log(err);
                    isusableNickname = false;
                }
            });
        }
    });
    //$("#checkNickname").click(function()끝

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


    // 회원가입 버튼 누를 때
    $("#registerButton") .click(function(){
        
        let id = $("#userid").val();
        let nickname = $("#nickname").val();
        let pw = $("#pw").val();
        let checkpw = $("#checkpw").val();

        // 모든필드 입력
        if(id===""||nickname==""||pw===""||checkpw==""){
            $("#resultMessage").text("모든 필드를 입력하세요.");

            if (id === "") {
                $("#userid").focus();
            } else if (nickname === "") {
                $("#nickname").focus();
            } else if (pw === "") {
                $("#pw").focus();
            } else if (checkpw === "") {
                $("#checkpw").focus();
            }
            return;
        }

        // 아이디 중복확인 유무
        if(!isusableId){
            $("#confirmid").css("color", "red").text("아이디 중복확인을 하세요.");
            return;
        }

        // 닉네임 중복확인 유무
        if(!isusableNickname){
            $("#confirmnickname").css("color", "red").text("닉네임 중복확인을 하세요.");
            return;
        }

        // 회원가입시도
        let user = {
                userid:id, 
                nickname:nickname,
                pw:pw
            };

        $.ajax({
            url : "/tour/userregister",
            type : "post",
            data : user,
            success : function(response){
            	alert("회원가입이 완료되었습니다.");
            	window.location.href="/tour/home";
                //$("#resultMessage").text("회원가입이 완료되었습니다.");
            },
            error : function(err){
                console.log(err);
            }
        });
    });
    //$("#registerButton") .click(function()끝
});