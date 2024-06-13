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
    
    function calculatedays(){
		var d1 = document.getElementById("d1").value;
		var d2 = document.getElementById("d2").value;
		const dateOne = new Date(d1);
		const dateTwo = new Date(d2);
		const time = Math.abs(dateTwo - dateOne);
		const days = Math.ceil(time/(1000*60*60*24));
		document.getElementById("output").innerHTML=days;
	}
  