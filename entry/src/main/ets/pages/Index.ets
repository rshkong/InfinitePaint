import { CanvasModel } from '../model/CanvasModel';
import { PaintController } from '../controller/PaintController';
import { InfiniteCanvasView } from '../view/InfiniteCanvasView';

@Entry
@Component
struct Index {
    private model: CanvasModel = new CanvasModel();
    private canvasView: InfiniteCanvasView = new InfiniteCanvasView(this.model);
    private controller: PaintController = new PaintController(this.model, this.canvasView);

    build() {
        Stack() {
            Canvas(this.canvasView.draw.bind(this.canvasView))
                .width('100%')
                .height('100%')
                .onTouch((event: TouchEvent) => this.controller.handleTouch(event));
        }
        .width('100%')
        .height('100%');
    }
}
