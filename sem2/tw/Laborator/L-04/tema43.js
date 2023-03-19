function myFlat(arr) {
    return arr.reduce((acc, elem) => {
        if (Array.isArray(elem))
            return [...acc, ...elem];
        else
            return [...acc, elem];
    }, []);
}

console.log(myFlat([[1, 2], [3], [4, 5, 6]]))