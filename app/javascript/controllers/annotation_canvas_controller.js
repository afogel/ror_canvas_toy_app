import { Controller } from "@hotwired/stimulus"
import Konva from 'konva';

// Connects to data-controller="annotation-canvas"
export default class extends Controller {
  static targets = ['canvas'];
  connect() {
    this.stage = new Konva.Stage({
      container: 'annotation-container',
      width: this.canvasTarget.clientWidth,
      height: this.canvasTarget.clientHeight,
    });
  }

  disconnect() {
    // clean up the canvas when navigating away
    this.stage.destroy();
  }
}
