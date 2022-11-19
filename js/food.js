// const btn=document.getElementById('btn');

// const SpeechRecognition=window.SpeechRecognition || window.webkitSpeechRecognition;
// const recognition=new SpeechRecognition();

// recognition.onstart =function()
// {
//    console.log("You can speek now!!");
// }
// recognition.onresult=function(event)
// {
//     var text=event.results[0][0].transcript;
//     console.log(text);
//     document.getElementById('result').innerHTML=text;
//     read[text];
// }
// function read(text)
// {
//     var speech=new SpeechSynthesisUtterance();
//     speech.text=text;
//     if(text.include('time'))
//     speech.text='It is'+new Date().getHours()+''+new Date().getMinutes()+'right now'
//     else if(text.include('my birthday'))
//     speech.text='Do you think !!';
//     window.speechSynthesis.speak(speech);
    
// }
// try {
//     var SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
//     var recognition = new SpeechRecognition();
//   }
//   catch(e) {
//     console.error(e);
//     $('.no-browser-support').show();
//     $('.app').hide();
//   }
 
function record() {
    
        // get output div reference
        var output = document.getElementById("output");
        // get action element reference
        var action = document.getElementById("action");
        // new speech recognition object
        var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
        var recognition = new SpeechRecognition();
    
        // This runs when the speech recognition service starts
        recognition.onstart = function() {
            action.innerHTML = "<small>listening, please speak...</small>";
        };
        
        recognition.onspeechend = function() {
            action.innerHTML = "<small>stopped listening, hope you are done...</small>";
            recognition.stop();
        }
      
        // This runs when the speech recognition service returns result
        recognition.onresult = function(event) {
            var transcript = event.results[0][0].transcript;
            var confidence = event.results[0][0].confidence;
            output.innerHTML = "<b>Text:</b> " + transcript + "<br/> <b>Confidence:</b> " + confidence*100+"%";
            output.classList.remove("hide");
        };
      
         // start recognition
         recognition.start();
    }

