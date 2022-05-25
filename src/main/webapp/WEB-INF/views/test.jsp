<%--
  Created by IntelliJ IDEA.
  User: 다비치
  Date: 2022-05-25
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CSS Template</title>
    <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <input id="code_html" type="text" value="삼겹살" autocomplete="off" readonly="">
    <input type="button" value="말하기"/>
    <input id="code_direct" type="text" value="족발" autocomplete="off" readonly="">
    <input type="button" value="말하기"/>
    <input id="code_reddit" type="text" value="100번 손님 상담실로 들어와주세요" autocomplete="off" readonly="">
    <input type="button" value="말하기"/>
<script>
    var voices = [];
    function setVoiceList() {
        voices = window.speechSynthesis.getVoices();
    }
    setVoiceList();
    if (window.speechSynthesis.onvoiceschanged !== undefined) {
        window.speechSynthesis.onvoiceschanged = setVoiceList;
    }
    function speech(txt) {
        if(!window.speechSynthesis) {
            alert("음성 재생을 지원하지 않는 브라우저입니다. 크롬, 파이어폭스 등의 최신 브라우저를 이용하세요");    return;
        }
        var lang = 'ko-KR';
        var utterThis = new SpeechSynthesisUtterance(txt);
        utterThis.onend = function (event) {    console.log('end');
        };
        utterThis.onerror = function(event) {    console.log('error', event);
        };  var voiceFound = false;
        for(var i = 0; i < voices.length ; i++) {
            if(voices[i].lang.indexOf(lang) >= 0 || voices[i].lang.indexOf(lang.replace('-', '_')) >= 0) {
                utterThis.voice = voices[i];      voiceFound = true;
            }
        }
        if(!voiceFound) {
            alert('voice not found');    return;
        }
        utterThis.lang = lang;
        utterThis.pitch = 1;
        utterThis.rate = 0.7;  //속도
        window.speechSynthesis.speak(utterThis);
    }
    document.addEventListener("click", function(e) {
        var t = e.target;
        var input = t.previousElementSibling;
        speech(input.value);
    });
</script>
</body>

</html>
