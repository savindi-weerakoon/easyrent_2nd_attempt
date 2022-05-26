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
  </div>
  <div class="row">
    <div class="col-lg-4 mb-4 text-center">
      <div class="card bg-danger text-white">
        <div class="card-body">
          <h5 class="card-title">{{summary.count_month}}</h5>
          <h6 class="card-subtitle mb-2"><small>TOTAL ORDERS IN THIS MONTH</small></h6>
        </div>
      </div>
    </div>
    </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'reports',
  data() {
    return {
      summary: {
        order_count: 0,
        gross: 0,
        month_income: 0,
        count_month: 0,
      }
    }
  },
  props: {
    user: {
      type: Object
    }
  },
  components: {
  },
  computed: {
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
          this.summary.count_month = response.data.count_month
          debugger
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
