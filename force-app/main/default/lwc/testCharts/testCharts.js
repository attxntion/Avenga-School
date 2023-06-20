import { LightningElement, track } from "lwc";
import chartjs from "@salesforce/resourceUrl/chartjs";
import { loadScript } from "lightning/platformResourceLoader";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class PolarAreaChart extends LightningElement {
  chartJSLoaded;
  chart;

  constructor() {
    super();
    this.chartJSLoaded = false;
  }

  renderedCallback() {
    alert("rendered");
    if (!this.chartJSLoaded) {
      alert("chartJSLoaded " + this.chartJSLoaded);
      loadScript(this, chartjs)
        .then(() => {
          this.chartJSLoaded = true;

          this.buildChart();
        })
        .catch((error) => {
          this.dispatchEvent(
            new ShowToastEvent({
              title: "Error Loading Chart JS",
              message: error.message,
              variant: "error"
            })
          );          
        });
    }
  }

  buildChart() {
    let canvas = this.template.querySelector("canvas");
    let context = canvas.getContext("2d");

    this.chart = new window.Chart(context, {
      type: "bar",
      data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [
          {
            label: "# of Votes",
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
              "rgba(255, 99, 132, 0.2)",
              "rgba(54, 162, 235, 0.2)",
              "rgba(255, 206, 86, 0.2)",
              "rgba(75, 192, 192, 0.2)",
              "rgba(153, 102, 255, 0.2)",
              "rgba(255, 159, 64, 0.2)"
            ],
            borderColor: [
              "rgba(255, 99, 132, 1)",
              "rgba(54, 162, 235, 1)",
              "rgba(255, 206, 86, 1)",
              "rgba(75, 192, 192, 1)",
              "rgba(153, 102, 255, 1)",
              "rgba(255, 159, 64, 1)"
            ],
            borderWidth: 1
          }
        ]
      },
      options: {
        legend: {
          position: "top",
          padding: 10
        },
        scales: {
          xAxes: [
            {
              beginAtZero: true,
              ticks: {
                autoSkip: false
              }
            }
          ]
        },
        responsive: true
      }
    });
  }
}