function tema1(arr) {
    const pare = arr.filter(el => el % 2 == 0);
    const impare = arr.filter(el => el % 2 == 1);
    const html = renderList(pare, "Pare") + renderList(impare, "Impare");
    document.write(html);
}

tema1([1, 2, 3, 4, 5, 6])

function renderList(arr, title) {
    const listElements = arr.reduce((acc, el) => acc + `<li>${el}</li>`, '');
    // const listElements = arr.map(el => `<li>${el}</li>).join()
    return `
    <h2>${title}</h2>
    <ul>
    ${listElements}
    </ul>
    `;
}

