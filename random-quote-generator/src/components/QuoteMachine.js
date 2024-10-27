import React from 'react';
import Button from './Button';

const QuoteMachine = (props) =>{
    const {selectedQuoteIndex,quotes,nextQuoteClickHandler} = props;
    return (
    <>
    {selectedQuoteIndex !== null && quotes.length > 0 && (
        <p>{quotes[selectedQuoteIndex].quote} - {quotes[selectedQuoteIndex].author}</p>
      )}
      <Button buttonDisplayName="Next Quote" clickHandler={nextQuoteClickHandler} />
    </>
  );
};

export default QuoteMachine;