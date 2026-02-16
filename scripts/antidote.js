export function setupAntidotes() {
    Array.from(document.getElementsByClassName("confloose-list")).forEach(list =>
        Array.from(list.children).forEach(e => {
            e.querySelector("input").value = `curl https://d-002.github.io/epita/confloose/${e.getAttribute("attached")}/antidote.sh | sh`;
        })
    );
}
