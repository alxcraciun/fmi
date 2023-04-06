window.onload = () => {
    let checkbox = [ document.querySelectorAll("input[type='checkbox'") ];
    let time = 0;

    checkbox.forEach(checkbox => {
        time += randInt(50, 100); 
        setTimeout(() => {checkbox.click()}, time)
        }
    )    
}

function randInt(a,b) {
    return Math.floor(Math.random() * (b-a) + a);
}