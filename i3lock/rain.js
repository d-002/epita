const XSTEP = 11, YSTEP = 12;

class Rain {
  constructor(manager, y_span) {
    this.manager = manager;

    this.length = parseInt(Math.random() * 10 + 20);
    this.x = parseInt(Math.random() * this.manager.W);
    this.y = parseInt(Math.random() * y_span) - this.manager.H - this.length;
  }

  update() {
    if (this.y - this.length >= this.manager.H)
      return true;
    this.draw();
    this.y++;
    return false;
  }

  draw() {
    for (let i = 0; i < this.length; i++) {
      const char = String.fromCharCode(parseInt(Math.random() * 20 + 12448));
      let t, color;
      if (i > this.length * 0.8) {
        t = parseInt((i / this.length - 0.7) * 5 * 255);
        if (t > 255)
          t = 255;
        color = "rgb(" + t + ", 255, " + t + ")";
      } else {
        t = parseInt(255 * i / this.length);
        if (t > 255)
          t = 255;
        color = "rgb(0, " + t + ", 0)";
      }

      const x = this.x * XSTEP;
      const y = (this.y + i) * YSTEP;

      this.manager.ctx.fillStyle = "#000000";
      this.manager.ctx.fillRect(x, y, XSTEP, YSTEP);
      this.manager.ctx.fillStyle = color;
      this.manager.ctx.fillText(char, x - 1, y + 10);
    }
  }
}

export class RainManager {
  constructor(elt) {
    this.canvas = elt;
    self.addEventListener("resize", () => this.resize());

    this.ctx = elt.getContext("2d");
    this.ctx.fillStyle = "#000000";
    this.ctx.textBaseline = "top";

    this.rain = [];
    this.resize();

    this.interval = self.setInterval(() => this.update(), 100);
  }

  get_number = () => Math.floor(this.W * this.H / 100);

  resize() {
    // update canvas size
    const old_w = this.W || 0;
    const old_h = this.H || 0;
    this.W = self.innerWidth;
    this.H = self.innerHeight;
    this.canvas.setAttribute("width", this.W);
    this.canvas.setAttribute("height", this.H);
    this.ctx.font = YSTEP + "px consolas";

    // update rain count
    this.W = Math.floor(this.W / XSTEP);
    this.H = Math.floor(this.H / YSTEP);
    const current = this.rain.length;
    const target = this.get_number();

    if (old_w && old_h)
      this.rain.forEach(rain => {
        rain.x *= this.W / old_w;
        rain.y *= this.H / old_h;
      });
    for (let i = current; i < target; i++)
      this.rain.push(new Rain(this, this.H * 2));
    for (let i = target; i < current; i++)
      this.rain.pop();
  }

  update() {
    this.rain.sort((a, b) => b.y - a.y);
    for (let i = 0; i < this.rain.length; i++)
      if (this.rain[i].update())
        this.rain[i] = new Rain(this, this.H);
  }
}
