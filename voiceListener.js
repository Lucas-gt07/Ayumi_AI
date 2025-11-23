// AYUMI — Módulo de Escuta de Voz
// Ativa quando você diz: “Ayumi” ou “Acorda Ayumi”

export class AyumiWakeWord {
    constructor(onWakeCallback) {
        this.onWakeCallback = onWakeCallback;
        this.isListening = false;
        this.wakeWords = ["ayumi", "a yumi", "acorda ayumi", "oi ayumi"];
    }

    start() {
        const recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
        recognition.lang = "pt-BR";
        recognition.continuous = true;

        recognition.onresult = (event) => {
            const text = event.results[event.results.length - 1][0].transcript.toLowerCase();
            console.log("[AYUMI LISTEN]:", text);

            if (this.wakeWords.some(w => text.includes(w))) {
                this.onWakeCallback();
            }
        };

        recognition.start();
        this.isListening = true;
    }
}
