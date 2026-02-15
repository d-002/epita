function clip(elt) {
    navigator.clipboard.writeText(elt.value);

    // also select field to fill in the system clipboard
    elt.select();
}

function clipCommand() {
    const command = document.getElementById("command");
    clip(command);

    const comment = document.getElementById("easy-copy").children[0];
    comment.style.animation = "none";
    comment.offsetWidth;
    comment.style.animation = null;
}
