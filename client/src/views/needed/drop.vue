<template>
  <div>
    <!-- Just the drop down -->
    <div class="col-lg-4 col-md-6">
            <div class="form-group">
              <label>Select Province</label>
              <select
                class="form-control"
              >
                <option
                  v-for="province in provinces"
                  :key="province.id"
                  :value="province.id"
                >
                  {{ province.province }}
                </option>
              </select>
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
      provinces:[],
    };
  },
  props: {

  },
  components: {
  },
  computed: {
  },
  methods: {
   getAllLocations() {
      let url = "/apinew/testingGetAllProvinces/";
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          if (response.status === 200) {
            this.provinces = response.data.province;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  mounted() {
    this.getAllLocations();
  }
}
</script>
