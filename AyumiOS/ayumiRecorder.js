// AYUMI — grava a sua fala depois que ela acorda

export class AyumiRecorder {
    constructor(onTextReady) {
        this.onTextReady = onTextReady;
    }

    startRecording() {
        const recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
        recognition.lang = "pt-BR";
        recognition.interimResults = false;

        recognition.onresult = (event) => {
            const text = event.results[0][0].transcript;
            console.log("[FALA DO USUÁRIO]:", text);
            this.onTextReady(text);
        };

        recognition.start();
    }
}
