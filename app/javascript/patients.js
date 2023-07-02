document.addEventListener("DOMContentLoaded", function() {
  var patientData = <%= raw @patient_count_by_day.to_json %>;

  // Get the canvas element
  var chartCanvas = document.getElementById("patientChart").getContext("2d");

  // Create the chart
  var patientChart = new Chart(chartCanvas, {
    type: "line",
    data: {
      labels: Object.keys(patientData),
      datasets: [{
        label: "Patient Registrations",
        data: Object.values(patientData),
        backgroundColor: "rgba(0, 123, 255, 0.2)",
        borderColor: "rgba(0, 123, 255, 1)",
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      scales: {
        x: {
          display: true,
          title: {
            display: true,
            text: "Date"
          }
        },
        y: {
          display: true,
          title: {
            display: true,
            text: "Patient Count"
          }
        }
      }
    }
  });
});
