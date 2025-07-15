import { Point } from './Point';

export class Stroke {
    private points: Point[] = [];

    addPoint(x: number, y: number): void {
        this.points.push(new Point(x, y));
    }

    getPoints(): Point[] {
        return this.points;
    }
}
