function removeDuplicates(arr) {
    let dict = {};
    arr.forEach(el => { dict[el + '_' + typeof(el)] = el });
    return Object.values(dict);
}

console.log(removeDuplicates([1, 2, 3, 3, 2, 'a', '1', '2']))