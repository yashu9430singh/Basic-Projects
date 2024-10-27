import './App.css';
import { useState, useEffect } from 'react';
import { random } from 'lodash';
import QuoteMachine from './components/QuoteMachine';

function App() {
  const [quotes, setQuotes] = useState([]);
  const [selectedQuoteIndex, setSelectedQuoteIndex] = useState(null);

  // Fetching quotes once when the component mounts
  useEffect(() => {
    fetch('https://gist.githubusercontent.com/natebass/b0a548425a73bdf8ea5c618149fe1fce/raw/f4231cd5961f026264bb6bb3a6c41671b044f1f4/quotes.json')
      .then(data => data.json())
      .then(fetchedQuotes => {
        setQuotes(fetchedQuotes); // Set the quotes
        setSelectedQuoteIndex(selectQuoteIndex(fetchedQuotes)); // Select a random quote index after fetching
      })
      .catch(error => console.error('Error fetching quotes:', error));
  }, []);

  // Function to select a random quote index
  const selectQuoteIndex = (quotesArray) => {
    if (!quotesArray.length) return null;
    return random(0, quotesArray.length - 1); // Select a random index
  };

  // Click handler for the "Next Quote" button
  const nextQuoteClickHandler = () => {
    setSelectedQuoteIndex(selectQuoteIndex(quotes));
  };

  return (
    <div className="App" id="quote-box">
      {/* Display the selected quote */}
      <QuoteMachine selectedQuoteIndex={selectedQuoteIndex} 
        quotes={quotes} 
        nextQuoteClickHandler={nextQuoteClickHandler}/>
    </div>
  );
}

export default App;
