// script.js

// ============================================
//           DOM Element Selection
// ============================================
// (Your element selection code is here)
const billInput = document.getElementById('bill-input');
const tipButtons = document.querySelectorAll('.tip-percent-btn');
const customTipInput = document.getElementById('custom-tip-input');
const peopleInput = document.getElementById('people-input');
const tipAmountDisplay = document.getElementById('tip-amount-display'); // Needed for DOM update
const totalAmountDisplay = document.getElementById('total-amount-display'); // Needed for DOM update
const resetButton = document.getElementById('reset-button');

// ============================================
//           Event Listeners
// ============================================
// (Your updated event listener code is here)
// ... (Ensure listeners call calculateTip() and manage active states) ...
billInput.addEventListener('input', calculateTip);
tipButtons.forEach(button => {
    button.addEventListener('click', (event) => {
        // ... (active state management) ...
        tipButtons.forEach(btn => btn.classList.remove("active"));
        
        // Add active class to the clicked button
        const activeButton = event.target;
        activeButton.classList.add("active");
        
        // Clear custom tip input
        customTipInput.value = '';

        calculateTip();
    });
});
customTipInput.addEventListener('input', () => {
    // ... (active state management) ...
    tipButtons.forEach(btn => btn.classList.remove("active"));
    calculateTip();
});
peopleInput.addEventListener('input', calculateTip);

resetButton.addEventListener('click', resetCalculator);
// ============================================
//             Core Functions
// ============================================

/**
 * @function calculateTip
 * @description Calculates tip and total amounts per person based on user inputs,
 * then prepares to update the display.
 */
function calculateTip() {
    // Log execution start (optional)
    // console.log('--- Executing calculateTip ---');

    // --- 1. Retrieve Input Values (Strings) ---
    const billValueStr = billInput.value;
    const peopleValueStr = peopleInput.value;
    const customTipValueStr = customTipInput.value;
    let selectedButtonTipStr = null;
    const activeButton = document.querySelector('.tip-percent-btn.active');
    if (activeButton) {
        selectedButtonTipStr = activeButton.dataset.tip;
    }

    // --- 2. Convert to Numbers ---
    const billAmount = parseFloat(billValueStr);
    const numberOfPeople = parseFloat(peopleValueStr);
    const customTipPercent = parseFloat(customTipValueStr);
    const selectedButtonTipPercent = selectedButtonTipStr ? parseFloat(selectedButtonTipStr) : null;
    // ===========================================================
    // --- 3. INPUT VALIDATION SECTION ---
    // ===========================================================

    // Task 9.2: Validate Bill Amount
    const isBillValid = !isNaN(billAmount) && billAmount >= 0;
    console.log(`Validation - Bill Amount (${billAmount}) Is Valid: ${isBillValid}`);

    // Task 9.3: Validate Tip Percentage (using actualTipPercent determined below)
    let isTipValid = false; // Initialized here

    // Task 9.4: Validate Number of People
    // Must be a number, must be greater than 0, and must be an integer.
    const isPeopleValid = !isNaN(numberOfPeople) && numberOfPeople > 0 && Number.isInteger(numberOfPeople);

    // Log the validation result for debugging.
    console.log(`Validation - Number of People (${numberOfPeople}) Is Valid Integer: ${isPeopleValid}`);

    // ===========================================================

    // --- 4. Determine Tip Percentage to Use ---
    let actualTipPercent = 0;
    // ... (logic to determine actualTipPercent) ...
    if (!isNaN(customTipPercent) && customTipPercent >= 0) {
        actualTipPercent = customTipPercent;
    } else if (selectedButtonTipPercent !== null && !isNaN(selectedButtonTipPercent) && selectedButtonTipPercent >= 0) {
        actualTipPercent = selectedButtonTipPercent;
    }

    // Perform Tip Validation (Task 9.3)
    isTipValid = !isNaN(actualTipPercent) && actualTipPercent >= 0;
    console.log(`Validation - Actual Tip Percent (${actualTipPercent}) Is Valid: ${isTipValid}`);

    // --- 5. Calculate Total Tip ---
    let totalTipAmount = 0;
    if (isBillValid && isTipValid) {
        totalTipAmount = billAmount * (actualTipPercent / 100);
    }

    // --- 6. Calculate Total Bill ---
    const totalBillAmount = billAmount + totalTipAmount; // NaN propagation handles invalid billAmount

    // --- 7. Calculate Per-Person Amounts ---
    // Refined: Use all validation flags to determine if calculation should proceed.
    let tipAmountPerPerson = 0;
    let totalAmountPerPerson = 0;

    if (isBillValid && isTipValid && isPeopleValid) {
        // Only calculate if all relevant inputs are valid according to our rules.
        tipAmountPerPerson = totalTipAmount / numberOfPeople;
        totalAmountPerPerson = totalBillAmount / numberOfPeople;
    } else {
        // If any validation failed, ensure per-person amounts are 0.
        tipAmountPerPerson = 0;
        totalAmountPerPerson = 0;
        // Add a warning if the specific reason was invalid people count
        if (!isPeopleValid) {
             console.warn(`Cannot calculate per-person amounts. Number of People (${numberOfPeople}) is not a positive integer.`);
        } else {
             console.warn("Calculation skipped or defaulted to 0 due to invalid Bill or Tip inputs.");
        }
    } // else defaults to 0

    // --- Logging Final Calculated Values (Optional for debugging) ---
    /*
    console.log({
        billAmount, numberOfPeople, actualTipPercent,
        totalTipAmount, totalBillAmount,
        tipAmountPerPerson, totalAmountPerPerson
    });
    */

    // ===========================================================
    // --- POINT WHERE CALCULATIONS ARE DONE ---
    //
    // At this point, the variables `tipAmountPerPerson` and
    // `totalAmountPerPerson` hold the final numerical results
    // (or 0 if inputs were invalid).
    //
    // The subsequent tasks in this step will add code HERE
    // to format these numbers and update the HTML display elements.
    //
    // ===========================================================
    const formattedTipAmount = tipAmountPerPerson.toFixed(2);
    const formattedTotalAmount = totalAmountPerPerson.toFixed(2);

    const displayTipAmount = `$${formattedTipAmount}`;
    const displayTotalAmount = `$${formattedTotalAmount}`;

    console.log("Formatted for Display - Tip Amount Per Person:", displayTipAmount);
    console.log("Formatted for Display - Total Amount Per Person:", displayTotalAmount);

    if(tipAmountDisplay){
        tipAmountDisplay.textContent = displayTipAmount;
    }else{
        console.log('error');
    }

    if(totalAmountDisplay){
        totalAmountDisplay.textContent = displayTotalAmount;
    }else{
        console.log('error');
    }

} // End of calculateTip function

function resetCalculator(){
    if (billInput) {
        billInput.value = '';
    }

    // 2. Clear the custom tip input value.
    if (customTipInput) {
        customTipInput.value = '';
    }

    // 3. Deselect any active tip percentage buttons.
    //    Iterate through all tip buttons and remove the 'active' class.
    if (tipButtons && tipButtons.length > 0) {
        tipButtons.forEach(button => {
            button.classList.remove('active');
        });
    }

    // 4. Set the value of the number of people input to empty.
    //    Alternatively, you could set it to '1' if that's your desired default.
    //    Let's use empty to match the bill input for consistency.
    if (peopleInput) {
        peopleInput.value = '';
    }

    // 5. Reset the text content of the tip amount/person display to '$0.00'.
    if (tipAmountDisplay) {
        tipAmountDisplay.textContent = '$0.00';
    }

    // 6. Reset the text content of the total/person display to '$0.00'.
    if (totalAmountDisplay) {
        totalAmountDisplay.textContent = '$0.00';
    }

    // 7. Remove any validation error styling from input fields.
    //    We explicitly remove the 'error' class from each input.
    if (billInput) {
        billInput.classList.remove('error');
    }
    if (customTipInput) {
        customTipInput.classList.remove('error');
    }
    if (peopleInput) {
        peopleInput.classList.remove('error');
    }

    if (billInput) {
         billInput.focus();
    }
}

// Add an initial call to calculateTip if you want the calculator
// to display initial values (e.g., $0.00) when the page loads.
// This also handles cases where browsers might autofill form fields.
document.addEventListener('DOMContentLoaded', calculateTip);
