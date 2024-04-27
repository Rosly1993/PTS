$(document).ready(function () {
    var table = $('#items_table').DataTable({
        "ajax": "../inventory/get_prresults",
        "columns": [
            { data: 'area_id', className: 'text-center' },
            { data: 'area', className: 'text-center' },
            { data: 'model', className: 'text-center' },
            { data: 'actual_qty', className: 'text-center' }
        ],
        "responsive": true,
        "searching": false,
        "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
        "pageLength": 10
    });

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [], // Placeholder for area names
            datasets: [] // Placeholder for data
        },
        options: {
            scales: {
                x: { stacked: true },
                y: { stacked: true }
            }
        }
    });

    function updateChartData() {
        var chartData = {};

        // Accumulate quantities for each area and model
        table.rows({ search: 'applied' }).data().each(function (item) {
            if (!chartData[item.area]) {
                chartData[item.area] = {};
            }
            if (!chartData[item.area][item.model]) {
                chartData[item.area][item.model] = 0;
            }
            chartData[item.area][item.model] += parseFloat(item.actual_qty);
        });

        var areas = Object.keys(chartData);
        var models = [...new Set(areas.flatMap(area => Object.keys(chartData[area])))];

        var datasets = models.map(model => ({
            label: model,
            data: areas.map(area => chartData[area][model] || 0),
            backgroundColor: getRandomColor() // Assign colors or predefined ones
        }));

        // Update chart
        myChart.data.labels = areas;
        myChart.data.datasets = datasets;
        myChart.update();
    }

    table.on('draw.dt', function () {
        updateChartData();
    });

    function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }
});
