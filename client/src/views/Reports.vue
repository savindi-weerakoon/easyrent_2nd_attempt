<template>
  <div class="row">
    <div class="col-lg-4 mb-4 text-center">
      <div class="card bg-danger text-white">
        <div class="card-body">
          <h5 class="card-title">{{summary.order_count}}</h5>
          <h6 class="card-subtitle mb-2"><small>TOTAL ORDERS</small></h6>
        </div>
      </div>
    </div>
    <div class="col-lg-4 mb-4 text-center">
      <div class="card bg-info text-white">
        <div class="card-body">
          <h5 class="card-title">Rs.{{summary.gross}}/=</h5>
          <h6 class="card-subtitle mb-2"><small>TOTAL INCOME</small></h6>
        </div>
      </div>
    </div>
    <div class="col-lg-4 mb-4 text-center">
      <div class="card bg-success text-white">
        <div class="card-body">
          <h5 class="card-title">Rs.{{summary.month_income}}/=</h5>
          <h6 class="card-subtitle mb-2"><small>THIS MONTH INCOME</small></h6>
        </div>
      </div>
    </div>
    <div class="col-lg-6 text-center">
      <div class="card bg-danger text-white">
        <div class="card-body">
          <h6 class="card-subtitle mb-2">Monthly Transactions</h6>
          <bar-chart v-if="isChartLoaded" :chartdata="monthlyTrans.data" :options="monthlyTrans.options"/>
        </div>
      </div>
    </div>
    <div class="col-lg-6 text-center">
      <div class="card bg-warning text-white">
        <div class="card-body">
          <h6 class="card-subtitle mb-2">Daily Orders</h6>
          <line-chart v-if="isChartLoaded" :chartdata="dailyTransactions.data" :options="dailyTransactions.options"/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import barChart from '@/components/charts/bar-chart'
import lineChart from '@/components/charts/line-chart'
export default {
  name: 'reports',
  data() {
    return {
      isChartLoaded: false,
      monthlyTransactions: {
        data: {
          labels: [],
          datasets: [
            {
              label: 'Total transactions per month',
              backgroundColor: '#FFFFFF',
              data: []
            }
          ]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          height: 200,
          legend: {
            labels: {
              fontColor: "white"
            }
          },
          scales: {
            yAxes: [{
              ticks: {
                fontColor: "white"
              }
            }],
            xAxes: [{
              ticks: {
                fontColor: "white"
              }
            }]
          }
        }
      },
      dailyTransactions: {
        data: {
          labels: [],
          datasets: [
            {
              label: 'Transaction amount',
              backgroundColor: '#FFFFFF',
              data: []
            }
          ]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          height: 200,
          legend: {
            labels: {
              fontColor: "white"
            }
          },
          scales: {
            yAxes: [{
              ticks: {
                fontColor: "white"
              }
            }],
            xAxes: [{
              ticks: {
                fontColor: "white"
              }
            }]
          }
        }
      },
      summary: {
        order_count: 0,
        gross: 0,
        month_income: 0
      }
    }
  },
  props: {
    user: {
      type: Object
    }
  },
  components: {
    'bar-chart': barChart,
    'line-chart': lineChart
  },
  computed: {
    monthlyTrans() {
      return this.monthlyTransactions
    },
    dailyTrans() {
      return this.dailyTransactions
    }
  },
  methods: {
    getReports () {
      let url = '/apinew/reports/'
      var form = new FormData();
      form.append("user_id", this.user.user_id);
      axios({
        method: 'post',
        url: url,
        data: form,
      })
      .then(response => {
        if (response.status === 200) {
          this.summary.order_count = response.data.order_count
          this.summary.gross = response.data.gross
          this.summary.month_income = response.data.month_income
          this.monthlyTransactions.data.labels = []
          this.monthlyTransactions.data.datasets.data = []
          response.data.monthly_transactions.forEach(o => {
            this.monthlyTransactions.data.labels.push(o.month)
            this.monthlyTransactions.data.datasets[0].data.push(o.transaction)
          })
          this.dailyTransactions.data.labels = []
          this.dailyTransactions.data.datasets.data = []
          response.data.daily_transactions.forEach(o => {
            this.dailyTransactions.data.labels.push(o.hour)
            this.dailyTransactions.data.datasets[0].data.push(o.transaction)
          })
          this.isChartLoaded = true
        }
      })
      .catch(error => {
        console.error(error)
      });
    }
  },
  mounted() {
    this.getReports()
  }
}
</script>
