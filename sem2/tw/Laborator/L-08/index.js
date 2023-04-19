const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const app = express();

app.use(bodyParser.json());

const people = [
    {firstName: 'John', lastName = 'Doe', age: 40, city: 'Paris, FR'},
    {firstName: 'Jane', lastName = 'Doe', age: 44, city: 'Bucharest, RO'},
];

const filterPeople = (age, city) => {
    let filtered = people;
    if (age) {
        filtered = filtered.filter(p => p.age == age);
    }
    if (city) {
        filtered = filtered.filter(p => p.city.toLowerCase().includes(city));
    }
    return filtered;
}

const rederList = (people) => `
    <ul>
    ${people.map(p => `<li> ${p.firstName} ${p.lastName}</li>`).join('')}
    </ul>
`;

app.get('/persoane/', function(req, res) {
    const people = filterPeople(req.query.age);
    const html = renderList(people);
    res.send(html);
});

app.get('/persoane/:city', function(req, res) {
    const people = filterPeople(req.query.age, req.params.city);
    const html = renderList(people);
    res.send(html);
});

app.get('/add', function (req, res) { 
    res.sendFile(path.join())
});



window.addEventListener('load', () => {
    document.querySelector('form').addEventListener('submit', (e) => {
        e.preventDefault();
        const formData = new FormDataa(e.target);
        const firstName = formData.get('firstName');
        const lastName = formData.get('lastName');
        const age = formData.get('age');
        const city = formData.get('city');
        try {
            const result = await fetch('/add', {
                method: 'POST',
                body: JSON.stringify( {firstName, lastName, age, city} ) 
            });
            if (result.ok) {
                window.location.href = '/persoane';
            } else {
                alert('eroare');
            }
        } 
    });
})
