function clip(elt) {
    navigator.clipboard.writeText(elt.textContent);

    // also select field if the user wants to copy in a different way
    elt.select();
}
