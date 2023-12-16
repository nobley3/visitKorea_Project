// 현재 이미지 슬라이드와 텍스트 슬라이드 위치를 나타내는 변수
let currentSlide = 0;
let intervalId;
let isAnimationPaused = false;
let isPlaying = true; // 현재 재생 중인지 여부를 나타내는 변수


//이전버튼
$(".btnpreNum").click(function(){
    let totalSlides = document.querySelectorAll('.slideTitle > li').length;
    currentSlide = (currentSlide + totalSlides - 1) % totalSlides;

    // 이미지 슬라이드 이동
    moveImageSlide(currentSlide, totalSlides);

    // 텍스트 슬라이드 이동
    moveToSlide(currentSlide, totalSlides);
    
    clearInterval(intervalId);
    isAnimationPaused = false;
    document.querySelector('.bar').style.animationPlayState = 'paused';
    $(".btnPlay").show();
    $(".btnStop").hide();
});

// 다음버튼
$(".btnnexNum").click(function(){
    let totalSlides = document.querySelectorAll('.slideTitle > li').length;
    currentSlide = (currentSlide + 1) % totalSlides;

    // 이미지 슬라이드 이동
    moveImageSlide(currentSlide, totalSlides);

    // 텍스트 슬라이드 이동
    moveToSlide(currentSlide, totalSlides);
    
     clearInterval(intervalId);
     
     isAnimationPaused = false;
     document.querySelector('.bar').style.animationPlayState = 'paused';
     
     $(".btnPlay").show();
    $(".btnStop").hide();
});



$(".btnStop").show();

//재생버튼
$(".btnPlay").click(function(){

    isAnimationPaused = false;
    intervalId = setInterval(autoSlide, 3000);
    
     if (isPlaying) {
        // 재생 중인 경우, 멈춤으로 변경
        isPlaying = false;
        document.querySelector('.bar').style.animationPlayState = 'running';
        document.querySelector('.btnPlay').style.backgroundImage = 'url(https://korean.visitkorea.or.kr/resources/images/main/btn_slide_play02.png)';
        $(".btnStop").show(); // "멈춤" 버튼 보이기
        $(".btnPlay").hide(); // "재생" 버튼 숨기기
    } else {
        // 멈춤 중인 경우, 재생으로 변경
        isPlaying = true;
        document.querySelector('.bar').style.animationPlayState = 'pause';
        document.querySelector('.btnPlay').style.backgroundImage = 'url(https://korean.visitkorea.or.kr/resources/images/main/btn_slidem_stop02.png)';
        $(".btnStop").hide(); // "멈춤" 버튼 숨기기
        $(".btnPlay").show(); // "재생" 버튼 보이기
    }
});


//멈춤버튼
$(".btnStop").click(function(){
    isAnimationPaused = true;
    document.querySelector('.bar').style.animationPlayState = 'paused';
    clearInterval(intervalId);
    // btnPlay 버튼에 이미지 표시
    document.querySelector('.btnPlay').style.backgroundImage = 'url(https://korean.visitkorea.or.kr/resources/images/main/btn_slide_play02.png)';
    $(".btnPlay").show(); // "재생" 버튼 보이기
    $(".btnStop").hide(); // "멈춤" 버튼 숨기기
});



// 이미지 슬라이드로 이동하는 함수
function moveImageSlide(slideIndex, totalImageSlides) {
    let imageWidth = document.querySelector('.imgsmallBox').clientWidth;
    let translateDistance = -(imageWidth * slideIndex);
    document.querySelector('.imgList').style.transform = `translateX(${translateDistance}px)`;
    updateImagePagingNumbers(slideIndex + 1, totalImageSlides);
}

// 텍스트 슬라이드로 이동하는 함수
function moveToSlide(slideNumber, totalImageSlides) {
    let slideWidth = document.querySelector('.textList li').clientWidth;
    let slideAmount = -(slideWidth * slideNumber);
    document.querySelector('.textList').style.transform = `translateX(${slideAmount}px)`;
    updatePagingNumbers(slideNumber + 1, totalImageSlides);
}


// 텍스트와 이미지 슬라이드를 자동으로 이동시키는 함수
function autoSlide() {
   let totalSlides = document.querySelectorAll('.slideTitle > li').length;
  
  // let totalSlides =  imgcnt;
   
    //alert( "totalSlides" + totalSlides);
   
    currentSlide = (currentSlide + 1) % totalSlides;

    // 이미지 슬라이드 이동
    moveImageSlide(currentSlide, totalSlides);

    // 텍스트 슬라이드 이동
    moveToSlide(currentSlide, totalSlides);
}

// 일정 시간마다 슬라이드를 움직임
intervalId = setInterval(autoSlide, 3000);

// 페이징 번호 업데이트 함수
function updateImagePagingNumbers(current, total) {
    let firstNumElement = document.querySelector('.firstNum');
    let secondNumElement = document.querySelector('.secondNum');

    if (firstNumElement && secondNumElement) {
        firstNumElement.textContent = String(current).padStart(2, '0');
        secondNumElement.textContent = String(total).padStart(2, '0');
    }
}
// 텍스트 슬라이드 페이징 번호 업데이트 함수
function updatePagingNumbers(current, total) {
    let textFirstNumElement = document.querySelector('.textFirstNum');
    let textSecondNumElement = document.querySelector('.textSecondNum');

    if (textFirstNumElement && textSecondNumElement) {
        textFirstNumElement.textContent = String(current).padStart(2, '0');
        textSecondNumElement.textContent = String(total).padStart(2, '0');
    }
}







// 좋아요버튼

document.addEventListener("DOMContentLoaded",function(){
            let likebtn = document.querySelectorAll(".likebtn");
             likebtn.forEach(function(button,index){
                button.addEventListener("click",function(){
                    button.classList.toggle("on");
                });
             });
        });
        // ai톡톡
        const photoItems = document.querySelectorAll('.hotPoto ul li');

        photoItems.forEach(item => {
            item.addEventListener('mouseover', () => {
                item.classList.add('on');
            });

            item.addEventListener('mouseout', () => {
                item.classList.remove('on');
            });
        });
