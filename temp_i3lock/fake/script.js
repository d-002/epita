let ctx, timer, comment;
let angle = null;
const timestamp = Date.now()-60000; // start of i3lock
let lastTime = 0;
let lastType = 0;
let failed = 0;

const anglespan = Math.PI/3;
const step = Math.PI/200;
const despawn = [100, 1500, 1000]; // press a key, check, wrong

function update() {
    // update canvas
    const full = 2*Math.PI;
    ctx.fillStyle = "#000";
    ctx.fillRect(0, 0, 200, 200);

    if (Date.now()-lastTime > despawn[lastType]) {
        angle = null;
        if (lastType == 2) failed++;
        if (lastType == 1) {
            lastType = 2;
            lastTime = Date.now();
        }
        else lastType = 0;
    }
    if (lastType == 0) {
        if (failed == 0) comment.innerHTML = "";
        else comment.innerHTML = failed+" failed attempt"+(failed > 1 ? "s" : "");
        ctx.fillStyle = "#ddd";
        ctx.beginPath();
        ctx.arc(100, 100, 99, 0, full);
        ctx.fill();
        ctx.fillStyle = "#000";
        ctx.beginPath();
        ctx.arc(100, 100, 90, 0, full);
        ctx.fill();
        if (angle != null) {
            // draw chunk of the circle
            ctx.fillStyle = "#000";
            ctx.beginPath();
            ctx.moveTo(100, 100);
            ctx.arc(100, 100, 100, angle-step, angle+anglespan+step);
            ctx.lineTo(100, 100);
            ctx.fill();
            ctx.fillStyle = "#fff";
            ctx.beginPath();
            ctx.moveTo(100, 100);
            ctx.arc(100, 100, 100, angle, angle+anglespan);
            ctx.lineTo(100, 100);
            ctx.fill();
            ctx.fillStyle = "#000";
            ctx.beginPath();
            ctx.arc(100, 100, 89, 0, full);
            ctx.fill();
        }
    }
    else if (lastType == 1) {
        comment.innerHTML = "Verifying...";
        ctx.fillStyle = "#00f";
        ctx.beginPath();
        ctx.arc(100, 100, 99, 0, full);
        ctx.fill();
        ctx.fillStyle = "#000";
        ctx.beginPath();
        ctx.arc(100, 100, 90, 0, full);
        ctx.fill();
        ctx.fillStyle = "#45e";
        ctx.beginPath();
        ctx.arc(100, 100, 88, 0, full);
        ctx.fill();
    }
    else {
        comment.innerHTML = "Wrong!";
        ctx.fillStyle = "#d70";
        ctx.beginPath();
        ctx.arc(100, 100, 99, 0, full);
        ctx.fill();
        ctx.fillStyle = "#000";
        ctx.beginPath();
        ctx.arc(100, 100, 90, 0, full);
        ctx.fill();
        ctx.fillStyle = "#f31";
        ctx.beginPath();
        ctx.arc(100, 100, 88, 0, full);
        ctx.fill();
    }

    // update timer
    const t = Date.now()-timestamp;
    const h = parseInt(t/3600000);
    const m = parseInt(t/60000%60);
    timer.innerHTML = parseInt(h/10) + "" + h%10 + ":" + parseInt(m/10) + "" + m%10;
}

function key(e) {
    if (e.key == "Enter") lastType = 1;
    else if (lastType != 0) return;
    angle = parseInt(Math.random()*2*Math.PI);
    lastTime = Date.now();
}

function init() {
    username = prompt("If you know the victim's username, enter it below:");
    if (username != null) document.getElementById("username").innerHTML = username;
    const canvas = document.getElementById("canvas");
    ctx = canvas.getContext("2d");
    timer = document.getElementById("timer");
    comment = document.getElementById("comment");

    document.addEventListener("click", () => { document.body.requestFullscreen(); });
    document.addEventListener("keydown", key);
    self.setInterval(update, 1000/60);
}
