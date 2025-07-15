import { Stroke } from './Stroke';

export class CanvasModel {
    private strokes: Stroke[] = [];

    addStroke(stroke: Stroke): void {
        this.strokes.push(stroke);
    }

    getStrokes(): Stroke[] {
        return this.strokes;
    }

    clear(): void {
        this.strokes = [];
    }
}
