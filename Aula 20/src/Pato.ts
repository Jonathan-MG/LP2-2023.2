export interface Pato{
    quack(): void;
    fly(): void;
}

export interface Peru{
    fly(): void;
    gobble(): void;
}

export interface BemTeVi{
    fly(): void;
    bemtevi(): void;
}

export class BemTeViAdapter implements Pato{
    constructor(private bemtv: BemTeVi){}
    fly(): void {
        this.bemtv.fly();
    }
    quack(): void {
        this.bemtv.bemtevi();
    }
}

export class BemTeViAzul implements BemTeVi{
    fly(): void {
        console.log("Bem-te-vi voando.....");
    }
    bemtevi(): void {
        console.log("Bem-te-vi bem-te-vizando....");
    }
}

export class PeruAdapter implements Pato{
    constructor(private peru: Peru){}
    fly(): void {
        this.peru.fly();
    }
    quack(): void {
        this.peru.gobble();
    }
}

export class PeruDoMato implements Peru{
    fly(): void {
        console.log("Peru do Mato voando...");
    }
    gobble(): void {
        console.log("Peru do mato falando...");
    }
}

export class PatoBranco implements Pato{
    fly(): void {
        console.log("Pato branco voando...");
    }
    quack(): void {
        console.log("Pato branco falando...");
    }
}

export class PatoDoSul implements Pato{
    fly(): void {
        console.log("Pato do Sul voando...");
    }
    quack(): void {
        console.log("Pato do Sul falando...");
    }
}