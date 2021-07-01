import React, { useEffect, useState } from 'react';
import './App.css';
import dataJSON from './data.json';
// import axios from 'axios';

import axios from './axios-form';

function App() {

  const [users, setUsers] = useState([]);
  const [text, setText] = useState('');
  const [suggestions, setSuggestions] = useState([]);
  const [results, setResults] = useState([]);
  const [input, setInput] = useState('');
  const [textarea, setTextarea] = useState('');



  useEffect(() => {
    const loadUsers = () => {
      setUsers(dataJSON.oglasi)
    }
    loadUsers();
  }, [])


  const onSuggestHandler = (text) => {
    setText(text);
    setSuggestions([]);

    setResults(users.filter(selected => selected.naslov === text))
    console.log('results in onSuggestHandler', results);
  }

  const onChangeHandler = (text) => {
    let matches = [];
    if (text.length > 3) {
      matches = users.filter(user => {

        if (user.deleted === 1) {
          return null;
        }
        console.log('user deleted', user.deleted == 0);
        const regex = new RegExp(`${text}`, "gi");
        console.log(user.naslov.match(regex));
        return user.naslov.match(regex)

      })
    };

    if (matches.length > 10) {
      matches = matches.slice(0, 10)
    }
    setSuggestions(matches);
    setText(text);
  }

  const onChangeInputHandler = (e) => {
    setInput(e.target.value)
  }

  const onChangeTextareaHandler = (e) => {
    setTextarea(e.target.value)
  }

  const onSubmitHandler = (event) => {
    event.preventDefault();

    if (input.length > 0 && textarea.length > 0 && results.length > 0) {

      results[0]["email"] = input;
      results[0]["comment"] = textarea;

      console.log(results)


      axios.post('/details.json', results)
        .then(response => {
          // console.log(response);
          alert("Your question has been sent ! :) ")
        })
        .catch(error => {
          console.log(error)
        })
    } else {
      alert('All fields are required !')
    }
  }




  return (
    <div className="App">
      <h1>Oglasi nekretnine</h1>
      <input
        className={"AutoInput"}
        type="text"
        placeholder="Unesite oglas ovde"
        onChange={e => onChangeHandler(e.target.value)}
        value={text}
      />

      {suggestions && suggestions.map((suggestion, i) => {
        return (
          <div
            className="Suggestion"
            key={i}>
            <div onClick={() => onSuggestHandler(suggestion.naslov)}>
              {suggestion.naslov}
            </div>

          </div>
        )
      })}
      <form onSubmit={onSubmitHandler}>
        {results && results.map((result, i) => {
          return (
            <div
              key={i}
              className="Result"
            >
              <div>
                <b>Oglas</b> : {result.naslov}
              </div>
              <div>
                <b>Grad</b> : {result.grad}
              </div>
              <div>
                <b>Deo grada</b> : {result.deoGrada}
              </div>
              <div>
                <b>Ulica</b> : {result.ulica}
              </div>
              <div>
                <b> Cena</b> : {result.cena}
              </div>
              <div>
                <b>Kvadratura</b> : {result.kvadratura}
              </div>
              <div>
                <b>Tip nekretnine</b> : {result.tipNekretnine}
              </div>
            </div>
          )
        })}

        <div className="EmailComment">
          <input
            placeholder="e-mail "
            type="email"
            onChange={onChangeInputHandler}
            value={input}
          />

          <textarea
            placeholder="Your comment ..."
            onChange={onChangeTextareaHandler}
            value={textarea}

          />

        </div>
        <button className="button">Submit</button>
      </form>
    </div>
  );
}

export default App;
