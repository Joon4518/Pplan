

const questions = [
    {
        question: '어느날 눈 떠보니 새로운 곳에 놓인 당신, 평생 살아야 하는 이 곳은?',
        answers: [
            { text: '아무리 얇게 입어도 땀이 뻘뻘 나는 여름', result: '여름'},
            { text: '아무리 껴입어도 뼛속까지 시린 겨울', result: '겨울'}
        ]
    }, {
        question: '길을 걸어가던 중 외계인이 나타났다!',
        answers: [
            { text: '당장 핸드폰을 들어 사진을 찍는다', result: '포토'},
            { text: '신기하게 바라보다가 가던 길을 마저 걸어간다', result: 'NOT 포토'}
        ]
    },{
        question: '어느날 선택 요정이 나타났다! 한 가지 선택지를 고르면 들어준다는데?',
        answers: [
            { text: '로또 100억 당첨! 대신 평생 친구, 연인 못사귐..', result: '혼자'},
            { text: '연봉 360만원.. 대신 내가 친해지고 싶은 사람이라면 누구든지 친구, 연인이 될 수 있다!', result: 'NOT 혼자'}
        ]
    }, {
        question: '좀비가 나타났다..! 목표는 생존! 어떻게 해야할까?',
        answers: [
            { text: '물과 음식은 충분하다! 집에서 버티자!', result: '실내' },
            { text: '계속 집에서 버틸 수는 없지.. 밖으로 나가자!', result: 'NOT 실내'},
        ]      
   }, {
        question: '무조건 하나를 선택해야 한다! 당신의 선택은?',
        answers: [
            { text: '평생 운동(각종 스포츠, 방탈출 등 체험활동) 못하기', result: '문화' },
            { text: '평생 영상(드라마, 영화, 예능 등) 못보기', result: '액티비티'}
        ]      
   }
    // 다른 질문들도 추가할 수 있습니다.
];

let questionIndex = 0;
const selectedAnswers = [];
let serverResponse = null;

document.getElementById('start-button').addEventListener('click', startGame);

function startGame() {
    document.getElementById('game-container').style.display = 'none';
    document.getElementById('quiz-container').classList.remove('hidden');
    showQuestion();
}

function showQuestion() {
    if (questionIndex < questions.length) {
        const currentQuestion = questions[questionIndex];
        const answersHTML = currentQuestion.answers.map(answer =>
            `<button class='selectbtn' onclick="selectAnswer('${currentQuestion.result}', '${answer.result}')">${answer.text}</button>`
        ).join('');

        document.getElementById('quiz-container').innerHTML = `
            <h2 id='quiz'>${currentQuestion.question}</h2>
            ${answersHTML}
        `;
    } else {
        document.getElementById('quiz-container').style.display = 'none';
        document.getElementById('loading-spinner').classList.remove('hidden');
        sendSelectedAnswersToServer();
    }
}

function selectAnswer(questionResult, answerResult) {
    selectedAnswers.push({ question: questionResult, answer: answerResult });
    questionIndex++;
    showQuestion();
}

function sendSelectedAnswersToServer() {
    const answerResults = selectedAnswers.map(answer => answer.answer);
   document.getElementById('loading-spinner').classList.remove('hidden');

    // 1초 후에 Ajax 요청 보내기
    setTimeout(function () {
        $.ajax({
            type: 'POST',
            url: '../game', // 서버의 URL
            data: { answerResult: answerResults },
            datatype:JSON,
            traditional: true,
            success: function (response) {
                // 서버로부터 응답을 받았을 때의 처리
                console.log(response);
                
            const result = JSON.parse(response);
            const placeName = result.place_name;
            const placeImg = result.place_img;
            const placeContent = result.place_content;
            
            
                // 결과 페이지 표시
                document.getElementById('quiz-container').style.display = 'none';
                const resultContainer = document.getElementById('result-container');
                const resultText = document.getElementById('result-text');
                const resultImg = document.getElementById('result-img');
              const resultContent = document.getElementById('result-content');
              
                resultText.textContent = placeName || '결과가 없습니다.';
                resultImg.src = placeImg;  // 이미지 경로 설정
              resultContent.textContent = placeContent;
                
                resultContainer.classList.remove('hidden');

                // 로딩중 스피너 숨기기
                document.getElementById('loading-spinner').classList.add('hidden');
            },
            error: function (error) {
                // 에러가 발생했을 때의 처리
                console.error('에러:', error);
            }
        });
    }, 1000);
}



