function handleCheckboxChange(checkbox) {
    var id = checkbox.id;
    var checkedPermission = JSON.parse(sessionStorage.getItem('checkedPermission')) || [];
    if (checkbox.checked) {
      checkedPermission.push(id);
    } else {
      var index = checkedPermission.indexOf(id);
      if (index > -1) {
        checkedPermission.splice(index, 1);
      }
    }

    sessionStorage.setItem('checkedPermission', JSON.stringify(checkedPermission));

    fetch('/update_permission', {
      method: 'POST',
      body: JSON.stringify({checked_permission: checkedPermission}),
      headers: {
        "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content'),
        'Content-Type': 'application/json'
      }
    });
  }