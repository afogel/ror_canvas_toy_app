import { Controller } from '@hotwired/stimulus';
import Konva from 'konva';

// Connects to data-controller="annotation-canvas"
export default class extends Controller {
  static targets = ['canvas', 'landmarks'];

  static values = { imageUrl: String };

  connect() {
    this.stage = new Konva.Stage({
      container: 'annotation-container',
      width: this.canvasTarget.clientWidth,
      height: this.canvasTarget.clientHeight,
    });

    this.layer = new Konva.Layer();
    this.stage.add(this.layer);
    this.group = new Konva.Group({ name: 'annotation' });
    this.layer.add(this.group);

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
    this.polygon = new Konva.Line({
      stroke: '#00F1FF',
      strokeWidth: 3,
      closed: false,
      fill: 'rgb(140,30,255,0.25)',
      id: 'annotation',
      name: 'polygon',
    });

    this.group.add(this.polygon);
    this.drawAnnotation();
  }

  handleClick() {
    const points = this.getCurrentPoints();
    const coordX = this.group.getRelativePointerPosition().x;
    const coordy = this.group.getRelativePointerPosition().y;
    points[points.length] = [coordX, coordy];
    this.landmarksTarget.value = JSON.stringify(points);
    this.drawAnnotation();
  }

  getCurrentPoints({ flattened } = { flattened: false }) {
    const points = JSON.parse(this.landmarksTarget.value)
    if (flattened) return points.reduce((a, b) => a.concat(b), []);
    return points;
  }

  drawAnnotation() {
    this.polygon.remove();
    this.polygon.points(this.getCurrentPoints({ flattened: true }));
    this.group.destroyChildren();
    this.group.add(this.polygon);
    this.polygon.draw();
    this.group.moveToTop();
  }

  disconnect() {
    // clean up the canvas when navigating away
    this.stage.destroy();
  }
}
