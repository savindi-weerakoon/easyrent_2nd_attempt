<template>
  <div>
    <!-- Just the drop down -->
    <div class="col-lg-4 col-md-6">
            <div class="form-group">
              <label>Select Province</label>
              <select
                class="form-control"
                v-model="selectedDistrictId"
                @change="getProvince"
              >
                <option
                  v-for="province in provinces"
                  :key="province.id"
                  :value="province.id"
                >
                  {{ province.district }}
                </option>
              </select>
            </div>
            <table class="table">
        <thead>
          <tr>
            <th>Post Title</th>
            <th class="text-nowrap">content</th>
            <th class="text-nowrap">price
              <button type="button" class="badge badge-light" @click="getProvince($event, 'ASC', 'published_time')">
                  v
                </button>
              <button type="button" class="badge badge-light" @click="getProvince($event, 'DESC', 'published_time')">
                  ^
                </button>  
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="post in postByDistrict"
            :key="post.id"
            :value="post.id"
          >
            <td>
                {{post.post_title}}
            </td>
            <td>
                {{post.content}}
            </td>
            <td>
                {{post.price}}
            </td>
            </tr>
        </tbody>
        </table>    
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
      prices:[],
      postByDistrict:[],
      selectedDistrictId: 0,
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
            this.provinces = response.data.district;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getProvince(event, order, order_by) {
      const sortOrder = order || 'DESC';
      const orderBy = order_by || 'published_time';
      const url = `/apinew/testingProvinceFilter/?district_id=${this.selectedDistrictId}&order_by=${orderBy}&order=${sortOrder}`;
      axios({
        method: "get",
        url: url,
      })
       .then((response) => {
          if (response.status === 200) {
            this.postByDistrict = response.data.postByDistrict;
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
