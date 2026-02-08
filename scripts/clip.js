function clip(elt) {
    navigator.clipboard.writeText(elt.value);

    // also select field to fill in the system clipboard
    elt.select();
}
