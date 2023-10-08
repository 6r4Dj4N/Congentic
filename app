// CONGENTIC MVP Code

// Placeholder variables
const apiUrl = 'PLACEHOLDER_API_ENDPOINT';
let data = []; // Cached data

// Fetch data from the API
async function fetchData() {
  try {
    const response = await fetch(apiUrl);
    data = await response.json();
    displayData();
  } catch (error) {
    console.error('Error fetching data:', error);
  }
}

// Display data with sorting and filtering options
function displayData() {
  const container = document.getElementById('data-container');

  // Clear previous content
  container.innerHTML = '';

  // Check if data is available
  if (data.length === 0) {
    const message = document.createElement('p');
    message.textContent = 'No data available';
    container.appendChild(message);
    return;
  }

  // Create sort and filter controls
  const controlsDiv = document.createElement('div');
  controlsDiv.classList.add('controls');

  const sortSelect = document.createElement('select');
  sortSelect.addEventListener('change', handleSort);
  sortSelect.innerHTML = `<option value="">Sort By</option>
                          <option value="name">Name</option>
                          <option value="date">Date</option>`;
  controlsDiv.appendChild(sortSelect);

  const filterInput = document.createElement('input');
  filterInput.addEventListener('input', handleFilter);
  filterInput.placeholder = 'Filter by name or category';
  controlsDiv.appendChild(filterInput);

  container.appendChild(controlsDiv);

  // Filter and sort data
  let filteredData = data.slice(); // Copy data array
  const filterValue = filterInput.value.toLowerCase();
  if (filterValue) {
    filteredData = filteredData.filter(item => 
      item.name.toLowerCase().includes(filterValue) ||
      item.category.toLowerCase().includes(filterValue)
    );
  }

  const sortValue = sortSelect.value;
  if (sortValue) {
    filteredData.sort((a, b) => {
      if (sortValue === 'name') {
        return a.name.localeCompare(b.name);
      } else if (sortValue === 'date') {
        return new Date(b.date) - new Date(a.date);
      }
    });
  }

  // Display filtered and sorted data in a table
  const table = document.createElement('table');
  const headerRow = document.createElement('tr');
  const headers = Object.keys(filteredData[0]);

  // Create table header
  headers.forEach(header => {
    const th = document.createElement('th');
    th.textContent = header;
    headerRow.appendChild(th);
  });
  
  table.appendChild(headerRow);

  // Populate table rows
  filteredData.forEach(item => {
    const row = document.createElement('tr');

    headers.forEach(header => {
      const cell = document.createElement('td');
      cell.textContent = item[header];
      row.appendChild(cell);
    });

    table.appendChild(row);
  });

  container.appendChild(table);
}

// Sort data based on selected option
function handleSort(event) {
  displayData();
}

// Filter data based on input value
function handleFilter(event) {
  displayData();
}

// Event listener to trigger data fetch
window.addEventListener('DOMContentLoaded', () => {
  fetchData();
});<!DOCTYPE html>
<html>
<head>
  <style>
    /* Neon glow effect */
    .neon-glow {
      background-color: #000;
      border-radius: 10px;
      box-shadow: 0 0 20px #00ff00,
                0 0 3px #00ff00;
    }

    /* Glass morphism effect */
    .glass {
      background-color: rgba(255, 255, 255, 0.2);
      backdrop-filter: blur(10px);
      border-radius: 10px;
      border: 1px solid rgba(255, 255, 255, 0.2);
      box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
    }

    /* Glossy effect */
    .glossy {
      background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.6) 25%, transparent 25%),
                        linear-gradient(-45deg, rgba(255, 255, 255, 0.6) 25%, transparent 25%),
                        linear-gradient(45deg, transparent 75%, rgba(255, 255, 255, 0.6) 75%),
                        linear-gradient(-45deg, transparent 75%, rgba(255, 255, 255, 0.6) 75%);
      background-size: 20px 20px;
      background-position: 0 0, 10px 0, 10px -10px, 0px 10px;
    }

    /* Custom styles for controls */
    .controls {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px;
      background-color: rgba(0, 0, 0, 0.5);
      border-radius: 5px;
      margin-bottom: 10px;
    }
    
    .controls select,
    .controls input {
      background: #000;
      color: #00ff00;
      border: none;
      padding: 5px 10px;
      border-radius: 5px;
      font-size: 14px;
    }
    
    /* Custom styles for table */
    table {
      background-color: rgba(0, 0, 0, 0.5);
      border-collapse: collapse;
      width: 100%;
    }
    
    th, td {
      padding: 10px;
      text-align: left;
      color: #00ff00;
    }
    
    tr:nth-child(even) {
      background-color: rgba(255, 255, 255, 0.1);
    }
    
    /* Custom styles for message */
    p {
      color: #00ff00;
      text-align: center;
    }
  </style>
</head>
<body>
  <div id="data-container" class="neon-glow glass">
    <!-- Data will be dynamically displayed here -->
  </div>

  <script>
    // CONGENTIC MVP Code
    // Place the JavaScript code here
  </script>
</body>
</html>
