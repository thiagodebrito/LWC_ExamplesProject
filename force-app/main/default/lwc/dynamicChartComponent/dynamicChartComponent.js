import { LightningElement, wire } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import ChartJS from '@salesforce/resourceUrl/ChartJS';
import getSalesData from '@salesforce/apex/SalesDataController.getSalesData';


export default class DynamicChartComponent extends LightningElement {

    chart;
    salesData = [];
    monthLabels = [];

    @wire(getSalesData)
    wiredSalesData({error, data}){
        if(data){
            this.salesData = data.map(result => result.total);
            this.monthLabels = data.map(result => 'Month ${result.month}');
            this.renderChart();
        }else if(error){
            console.error('Error fetching sales data:', error);
        }
    }

    renderedCallback(){
        if(this.chart){
            return;
        }
        loadScript(this, ChartJS)
            .then(() => { 
                this.renderChart();
            })
            .catch(error => {
                console.error('Error loading Chart.js', error);
            });
    }

    renderChart(){
        if(!this.salesData.length || this.chart){
            return;
        }

        const ctx =this.template.querySelector('canvas').getContext('2d');
        this.chart = new Chart(ctx, {
            type: 'line', // para trocar o modelo de grafico use no type: bar, line ou pie
            data: {
                labels: this.monthLabels,
                datasets: [
                    {
                        label: 'Sales',
                        data: this.salesData,
                        borderColor: '#36A2EB',
                        fill: false,
                    },
                ],
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                    },
                },
            },
        });
    }

}