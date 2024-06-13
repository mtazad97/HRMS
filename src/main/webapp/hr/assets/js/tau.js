  // Search functionality
  $("#searchInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#data-table tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });

  // Sorting functionality
  function sortTable(columnIndex) {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("data-table");
    switching = true;

    while (switching) {
      switching = false;
      rows = table.rows;

      for (i = 1; i < rows.length - 1; i++) {
        shouldSwitch = false;
        x = rows[i].getElementsByTagName("td")[columnIndex];
        y = rows[i + 1].getElementsByTagName("td")[columnIndex];

        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          shouldSwitch= true;
          break;
        }
      }

      if (shouldSwitch) {
        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
        switching = true;
      }
    }
  }

  function changeEntries() {
    var selectedValue = $("#entries").val();
    var rows = $("#data-table tbody tr");

    if (selectedValue === "all") {
      rows.show();
    } else {
      rows.hide();
      rows.slice(0, selectedValue).show();
    }
  }

//function calculateDaysBetween() {
         //   var startDate = document.getElementById('startDate').value;
           // var endDate = document.getElementById('endDate').value;

            //if (startDate && endDate) {
              //  var start = new Date(startDate);
                //var end = new Date(endDate);

                // Calculate the difference in time between the two dates in milliseconds
               // var timeDiff = end - start;

                // Calculate the number of days, including both the start and end dates
                //var daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24)) + 1;

                //document.getElementById('result').innerText =daysDiff;
           // } else {
               // document.getElementById('result').innerText = 'Please enter both dates.';
          //  }
       // }

function calculateDaysBetween() {
            var startDate = document.getElementById('startDate').value;
            var endDate = document.getElementById('endDate').value;

            if (startDate && endDate) {
                var start = new Date(startDate);
                var end = new Date(endDate);

                // Calculate the difference in time between the two dates in milliseconds
                var timeDiff = end - start;

                // Calculate the number of days, including both the start and end dates
                var daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24)) + 1;

                // Store the result in the hidden input field
                document.getElementById('result').value = daysDiff;
            } else {
                document.getElementById('result').value = ''; // Clear the value if dates are not entered
            }
        }
