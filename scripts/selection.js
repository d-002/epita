const selected = [];

const elts = {
    list: null,
    command: null
};

function updateSelected() {
    let data = "";
    if (selected.length != 0)
        data = `echo $(curl https://d-002.github.io/epita/confloose/master-install.sh) ${selected.join(" ")} | sh`;

    let word = "sélectionné"
    if (selected.length >= 2)
        word += "s";
    elts.command.children[0].textContent = `${selected.length} ${word}`;
    elts.command.children[3].value = data;
}

export function listenSelection() {
    // update elts
    elts.list = document.getElementById("confloose-list");
    elts.command = document.getElementById("command-container");

    // set up listener
    const listener = elts.list.addEventListener("click", evt => {
        let confloose;

        let elt = evt.target;
        if (elt.tagName == "INPUT")
            return;

        while (1) {
            confloose = elt.getAttribute("attached");
            if (confloose != null)
                break; // reached the tile element

            if (elt == elts.list)
                return; // did not select an interesting element

            if (elt == document)
                return; // fallback

            elt = elt.parentNode;
        }

        elt.classList.toggle("selected");
        if (elt.classList.contains("selected"))
            selected.push(confloose);
        else
            selected.splice(selected.indexOf(confloose), 1);
        updateSelected();
    });

    return listener;
}
