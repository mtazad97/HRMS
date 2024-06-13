/**
 * 
 */
    function handleSelect(selectElement) {
      var otherText = document.getElementById('otherText');

      if (selectElement.value === 'other') {
        otherText.style.display = 'block'; // Show the input field
      } else {
        otherText.style.display = 'none'; // Hide the input field
      }
    };
    
    
        
   
  