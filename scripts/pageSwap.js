const nav = {};
const pages = {};

function swapPage(elt) {
    swapPageByName(elt.getAttribute("page-name"));
}

function swapPageByName(target) {
    Object.entries(nav).forEach(([name, elt]) => {
        if (name == target)
            elt.classList.add("active");
        else
            elt.classList.remove("active");
    });
    Object.entries(pages).forEach(([name, elt]) => {
        if (name == target)
            elt.classList.remove("hidden");
        else
            elt.classList.add("hidden");
    });

    document.location.href = document.location.href.split("#")[0]+"#"+target;
}

Array.from(document.getElementById("main-nav").children).forEach(elt => {
    nav[elt.getAttribute("page-name")] = elt;
});
Array.from(document.querySelectorAll(".page")).forEach(elt => {
    pages[elt.getAttribute("page-name")] = elt;
});

// go to current page if needed
if (document.location.href.includes("#"))
    swapPageByName(document.location.href.split("#")[1]);
