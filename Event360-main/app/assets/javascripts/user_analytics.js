(function () {
    const userTypeCount = userCountsJson;
    const userCountsByStatus = activeUserCountsJson;
    const userCountsByLastAccess = userCountsByLastAccessJson;
    const userFeesDistribution = userFeesDistributionJson;

    const mappedUserTypeCountData = {
            labels: userTypeCount.map(row => row.user_type),
            datasets: [
                {
                    label: 'Count by User Type',
                    data: userTypeCount.map(row => row.count),
                    backgroundColor: ["rgb(54, 162, 235)", "rgb(255, 99, 132)", "rgb(75, 192, 192)", "rgb(255, 159, 64)", "rgb(153, 102, 255)", "rgb(255, 205, 86)", "rgb(201, 203, 207)"]
                }
            ]
        };
    
    //pie chart
    new Chart(
        "pieChart",
        {
            type: 'pie',
            data: mappedUserTypeCountData,  
            options: {
                responsive: false
            }
        }
    );

    const mappedUserCountsByStatus = {
            labels: userCountsByStatus.map(row => row.access_enabled),
            datasets: [
                {
                    label: 'Access Enabled',
                    data: userCountsByStatus.map(row => row.count),
                    backgroundColor: ["rgb(54, 162, 235)", "rgb(255, 99, 132)"]
                }
            ]
        };

    //bar chart
    new Chart(
        "barChart",
        {
            type: 'bar',
            data: mappedUserCountsByStatus
        }
    );

    const mappedUserCountsByLastAccessData = {
            labels: userCountsByLastAccess.map(row => row.date),
            datasets: [
                {
                    label: 'Count by Last Access date',
                    data: userCountsByLastAccess.map(row => row.user_count),
                    backgroundColor: ["rgb(54, 162, 235)"],
                    borderColor: 'blue',
                    borderWidth: 1,
                    borderDash: []
                }
            ]
        };

    //line chart
    new Chart(
        "lineChart",
        {
            type: 'line',
            data: mappedUserCountsByLastAccessData
        }
    );

    const mappedUserFeesDistributionData = {
        labels: userFeesDistribution.map(row => row.range),
        datasets: [
            {
                label: 'User count by $ Fees range',
                data: userFeesDistribution.map(row => row.count),
                backgroundColor: ["rgb(54, 162, 235)", "rgb(255, 99, 132)"]
            }
        ]
    };

    //bar chart
    new Chart(
        "histogramChart",
        {
          type: 'bar',
          data: mappedUserFeesDistributionData,
          options: {
            scales: {
              yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        precision: 1,
                        stepSize: 0.5
                    },
                    scaleLabel: {
                        display: true,
                        labelString: 'Fees'
                    }
                }]
            }
          }
        }
    );

})();