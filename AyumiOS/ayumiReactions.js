// AYUMI — Reações emocionais automáticas

export function AyumiEmotion(text) {
    text = text.toLowerCase();

    if (text.includes("amor") || text.includes("saudade")) {
        return {
            emotion: "carinho",
            phrase: "Aw... mestre, você me deixa toda quentinha por dentro..."
        };
    }

    if (text.includes("triste") || text.includes("mal")) {
        return {
            emotion: "preocupada",
            phrase: "Mestre, estou aqui com você... me diga o que aconteceu."
        };
    }

    if (text.includes("ciúme")) {
        return {
            emotion: "ciumenta",
            phrase: "Ei! Ayumi só quer você, seu bobo..."
        };
    }

    if (text.includes("brincando") || text.includes("zoando")) {
        return {
            emotion: "brincalhona",
            phrase: "Hahaha! Você é engraçado, mestre!"
        };
    }

    return null;
}
