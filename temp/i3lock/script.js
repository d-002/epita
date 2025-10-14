let interval, ctx;
let W, H;
const XSTEP = 15, YSTEP = 16;
const rain = [];

class Rain {
    constructor(span=H) {
        this.length = parseInt(Math.random()*10+20);
        this.x = parseInt(Math.random()*W);
        this.y = parseInt(Math.random()*span) - H - this.length;
    }

    update() {
        if (this.y-this.length >= H) return true;
        this.draw();
        this.y++;
        return false;
    }

    draw() {
        for (let i = 0; i < this.length; i++) {
            const char = String.fromCharCode(parseInt(Math.random()*20+12448));
            let t, color;
            if (i > this.length*0.8) {
                t = parseInt((i/this.length-0.7)*5*255);
                if (t > 255) t = 255;
                color = "rgb("+t+", 255, "+t+")";
            }
            else {
                t = parseInt(255*i/this.length);
                if (t > 255) t = 255;
                color = "rgb(0, " + t + ", 0)";
            }

            const x = this.x*XSTEP;
            const y = (this.y+i) * YSTEP;

            ctx.fillStyle = "#000";
            ctx.fillRect(x, y, XSTEP, YSTEP);
            ctx.fillStyle = color;
            ctx.fillText(char, x-1, y);
        }
    }
}

const heightCompare = (a, b) => { if (a.y < b.y) return 1; if (a.y > b.y) return -1; return 0; }
function update() {
    rain.sort(heightCompare);
    for(let i = 0; i < rain.length; i++) if (rain[i].update()) rain[i] = new Rain();
}

function init() {
    interval = self.setInterval(update, 1000/10);
    const canvas = document.getElementById("matrix");
    setupCanvas = () => {
        if (canvas.width == self.innerWidth) return;
        canvas.setAttribute("width", self.innerWidth);
        canvas.setAttribute("height", self.innerHeight);
        W = parseInt(canvas.width/XSTEP);
        H = parseInt(canvas.height/YSTEP);
        ctx.font = "16px consolas";
    };
    self.setInterval(setupCanvas, 1000);

    ctx = canvas.getContext("2d");
    setupCanvas();
    ctx.fillStyle = "#000";
    ctx.textBaseline = "top";
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    for(let i = 0; i < W*H/50; i++) rain.push(new Rain(H*2));

    Array.from(document.getElementsByClassName("star")).forEach((elt) => { elt.title = "Author favourite"; });
}
document.addEventListener("keydown", (e) => { if (e.key == "s") self.clearInterval(interval); });
