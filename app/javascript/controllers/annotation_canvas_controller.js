import { Controller } from '@hotwired/stimulus';
import Konva from 'konva';

// Connects to data-controller="annotation-canvas"
export default class extends Controller {
  static targets = ['canvas'];

  static values = { imageUrl: String };

  connect() {
    this.stage = new Konva.Stage({
      container: 'annotation-container',
      width: this.canvasTarget.clientWidth,
      height: this.canvasTarget.clientHeight,
    });

    this.layer = new Konva.Layer();
    this.stage.add(this.layer);

    const currentImage = new Image();
    currentImage.src = this.imageUrlValue;
    currentImage.onload = () => {
      this.image = new Konva.Image({
        x: 0,
        y: 0,
        image: currentImage,
        width: this.stage.width(),
        height: this.stage.height(),
      });

      // add the shape to the layer
      this.layer.add(this.image);
    };
  }

  disconnect() {
    // clean up the canvas when navigating away
    this.stage.destroy();
  }
}
