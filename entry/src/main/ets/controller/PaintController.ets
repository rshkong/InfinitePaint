import { CanvasModel } from '../model/CanvasModel';
import { Stroke } from '../model/Stroke';
import { Point } from '../model/Point';
import { InfiniteCanvasView } from '../view/InfiniteCanvasView';

export class PaintController {
    private currentStroke: Stroke | null = null;
    private lastDistance: number = 0;
    private lastFocusX: number = 0;
    private lastFocusY: number = 0;
    private scaling: boolean = false;

    constructor(private model: CanvasModel, private view: InfiniteCanvasView) {}

    handleTouch(event: TouchEvent): boolean {
        const touches = event.touches;
        const action = event.type;

        if (action === 'touchstart') {
            this.currentStroke = new Stroke();
            this.currentStroke.addPoint(touches[0].clientX, touches[0].clientY);
            this.model.addStroke(this.currentStroke);
        } else if (action === 'touchmove') {
            if (touches.length > 1) {
                this.handleScale(event);
            } else if (this.currentStroke) {
                this.currentStroke.addPoint(touches[0].clientX, touches[0].clientY);
            }
        } else if (action === 'touchend') {
            if (this.currentStroke) {
                this.currentStroke.addPoint(touches[0].clientX, touches[0].clientY);
                this.currentStroke = null;
            }
            this.scaling = false;
        }
        this.view.invalidate();
        return true;
    }

    private handleScale(event: TouchEvent): void {
        const t0 = event.touches[0];
        const t1 = event.touches[1];
        const x0 = t0.clientX;
        const y0 = t0.clientY;
        const x1 = t1.clientX;
        const y1 = t1.clientY;

        const dx = x1 - x0;
        const dy = y1 - y0;
        const distance = Math.sqrt(dx * dx + dy * dy);
        const focusX = (x0 + x1) / 2;
        const focusY = (y0 + y1) / 2;

        if (!this.scaling) {
            this.lastDistance = distance;
            this.lastFocusX = focusX;
            this.lastFocusY = focusY;
            this.scaling = true;
            return;
        }

        const scaleFactor = distance / this.lastDistance;
        const panX = focusX - this.lastFocusX;
        const panY = focusY - this.lastFocusY;

        this.view.zoom(scaleFactor, focusX, focusY);
        this.view.pan(panX, panY);

        this.lastDistance = distance;
        this.lastFocusX = focusX;
        this.lastFocusY = focusY;
    }
}
