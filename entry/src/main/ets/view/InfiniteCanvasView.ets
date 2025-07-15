import { CanvasModel } from '../model/CanvasModel';
import { Stroke } from '../model/Stroke';
import { Point } from '../model/Point';
import { PaintController } from '../controller/PaintController';

export class InfiniteCanvasView {
    private paint: any = {};
    private scale: number = 1.0;
    private offsetX: number = 0;
    private offsetY: number = 0;

    constructor(private model: CanvasModel) {}

    controller?: PaintController;

    setPaintController(controller: PaintController): void {
        this.controller = controller;
    }

    draw(context: CanvasRenderingContext2D): void {
        context.save();
        context.translate(this.offsetX, this.offsetY);
        context.scale(this.scale, this.scale);
        this.model.getStrokes().forEach((stroke: Stroke) => {
            this.drawStroke(context, stroke);
        });
        context.restore();
    }

    private drawStroke(context: CanvasRenderingContext2D, stroke: Stroke): void {
        context.beginPath();
        stroke.getPoints().forEach((point: Point, index: number) => {
            if (index === 0) {
                context.moveTo(point.x, point.y);
            } else {
                context.lineTo(point.x, point.y);
            }
        });
        context.stroke();
    }

    pan(dx: number, dy: number): void {
        this.offsetX += dx;
        this.offsetY += dy;
    }

    zoom(factor: number, focusX: number, focusY: number): void {
        this.offsetX = (this.offsetX - focusX) * factor + focusX;
        this.offsetY = (this.offsetY - focusY) * factor + focusY;
        this.scale *= factor;
    }

    invalidate(): void {
        // To be implemented by the consuming component
    }
}
