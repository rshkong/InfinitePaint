import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';

export default class MainAbility extends UIAbility {
    onWindowStageCreate(windowStage: window.WindowStage) {
        windowStage.loadContent("pages/Index", null);
    }
}
