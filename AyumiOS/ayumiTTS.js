// AYUMI — Gerador de voz (TTS feminino suave)

export class AyumiTTS {
    constructor() {
        this.voiceName = "pt-BR-Female-Ayumi";
    }

    speak(text, onStart = null, onEnd = null) {
        const utter = new SpeechSynthesisUtterance(text);
        utter.lang = "pt-BR";
        utter.pitch = 1.35;
        utter.rate = 1.0;

        if (onStart) utter.onstart = onStart;
        if (onEnd) utter.onend = onEnd;

        speechSynthesis.speak(utter);
    }
}
