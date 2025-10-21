const selected = [];

const elts = {
    list: null,
    command: null
};

function updateSelected() {
    let data = "";
    if (selected.length != 0)
        data = `echo $(curl https://d-002.github.io/epita/confloose/master-install.sh) ${selected.join(" ")} | sh`;

    elts.command.children[0].textContent = `${selected.length} sélectionnés`;
    elts.command.children[3].value = data;
}

export function listenSelection() {
    // update elts
    elts.list = document.getElementById("confloose-list");
    elts.command = document.getElementById("command-container");

    // set up listener
    const listener = elts.list.addEventListener("click", evt => {
        let confloose;

        while (1) {
            confloose = evt.target.getAttribute("attached");
            if (confloose != null)
                break; // reached the tile element

            if (evt.target == elts.list)
                return; // did not select an interesting element

            if (evt.target == document)
                return; // fallback

            evt = evt.parentNode;
        }

        evt.target.classList.toggle("selected");
        if (evt.target.classList.contains("selected"))
            selected.push(confloose);
        else
            selected.splice(selected.indexOf(confloose), 1);
        updateSelected();
    });

    return listener;
}
