var __basePath = './';

var filterParams = {
  comparator: function (filterLocalDateAtMidnight, cellValue) {
    var dateAsString = cellValue;
    if (dateAsString == null) return -1;
    var dateParts = dateAsString.split('/');
    var cellDate = new Date(
      Number(dateParts[2]),
      Number(dateParts[1]) - 1,
      Number(dateParts[0])
    );

    if (filterLocalDateAtMidnight.getTime() === cellDate.getTime()) {
      return 0;
    }

    if (cellDate < filterLocalDateAtMidnight) {
      return -1;
    }

    if (cellDate > filterLocalDateAtMidnight) {
      return 1;
    }
  },
  browserDatePicker: true,
};

var columnDefs = [
  { field: 'name' },
  { field: 'email' },
  {
    headerName: "Location",
    field: 'talentData',
    cellStyle: {},
    cellRenderer: function (params) {
      talentData = params.data.talentData
      if (talentData) {
        talentData = JSON.parse(talentData)
        return talentData.city + ", " + talentData.state
      } else {
        return "-"
      }
    }
  },
  {
    headerName: "Payment Link",
    field: 'Payment Link',
    cellStyle: {},
    cellRenderer: function (params) {
      talentData = params.data.talentData
      if (talentData) {
        talentData = JSON.parse(talentData)
        return talentData.paymentLink
      } else {
        return "-"
      }
    }
  },
  {
    headerName: "Active Status",
    field: 'is_active',
    cellStyle: {},
    cellRenderer: function (params) {
      if (params.value)
        return '<label class="switch"> <input type="checkbox" checked onclick="changeUserStatus(\'' + params.data._id["$oid"] + '\')" > <span class="slider round"></span> </label>'
      else
        return '<label class="switch"> <input type="checkbox" onclick="changeUserStatus(\'' + params.data._id["$oid"] + '\')" > <span class="slider round"></span> </label>'
    }
  },
  {
    field: 'updated_at',
    filter: 'agDateColumnFilter',
  },
];

var gridOptions = {
  columnDefs: columnDefs,
  defaultColDef: {
    flex: 1,
    minWidth: 150,
    filter: true
  },
};

var gridDiv = document.querySelector('#myGrid');
new agGrid.Grid(gridDiv, gridOptions);

function isValidHttpUrl(string) {
  let url;
  try {
    url = new URL(string);
  } catch (_) {
    return false;
  }
  return url.protocol === "http:" || url.protocol === "https:";
}

function sendRequest(url) {
  if(!isValidHttpUrl(url)) return;
  //Clear the table
  gridOptions.api.setRowData([]);

  var requestOptions = {
    method: 'GET',
    redirect: 'follow'
  };

  fetch(url, requestOptions)
    .then(response => response.json())
    .then(result => { gridOptions.api.setRowData(result) })
    .catch(error => console.log('error', error));
}

const apiUrl = document.getElementById("myGrid").getAttribute("data-grid-api");
document.addEventListener('DOMContentLoaded', sendRequest(apiUrl));
function changeUserStatus(id) {
  fetch(apiUrl + "/change_status/" + id)
    .then(response => response.json())
    .catch(error => console.log('error', error));
}

