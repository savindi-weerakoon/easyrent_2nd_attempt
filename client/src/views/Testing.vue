<template>
  <div class="post pt-5">
    <div class = "posts">
     <h4>All Posts</h4>
     <!-- <pre>{{posts}}</pre> -->
     <p v-for="post in posts" :key="post.post_id">
       <pre>{{post}}</pre>
     </p>
    </div>
  </div> 

  <div>
    <!-- pass data from url -->
    <!-- prevous page -> 
    :to="`/addItemReview/${notification.post_id}/${notification.id}/${notification.tenant_id}`" (pendingPayments)
    then change in router js
    then new page coumputed and pass using form.append -->
  </div>

  <div>
    <!-- post & get mix method -->
    getRentedbyMe() {
      const url = "/apinew/report_rentedbyme/";
      var form = new FormData();
      form.append("renter_id", this.user.user_id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            this.rents = response.data.rent;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
  </div>  

  <div>
    <!-- post method only -->
    itemReview() {
      let url = '/apinew/reviewPost/'
      var form = new FormData();
      form.append("reservation_id", this.reserveId);
      form.append("post_id", this.postId);
      form.append("user_id", this.user.user_id);
      form.append("rate", this.rating);
      form.append("review", this.review);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.$toast.success('You have successfully rated the item');
          this.$router.push({ path: "/" });
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
  </div>

  <template>
  <!-- dropdown list -->
  <select class="form-control" v-model="form.rentType">
    <option
      v-for="rentType in form.rentTypes"
      :key="rentType.id"
      :value="rentType.id"
      v-text="rentType.name"
    ></option>
  </select>

<!-- <div class="table">
  <thead>
    <tr>
      <th>Username</th>
      <th><Lastname/th>
    </tr>  
  </thead>
  <tbody>
    <tr v-for "users2 in users" :key="users2.user_id">
      <td>{{user2.firstname}}</td>
      <td>{{user2.lastname}}</td>
    </tr>
  </tbody>
</div> -->

  <!-- check box -->
  <!-- <div class="form-check" v-for="users2 in users" :key="users2.user_id">
    <input
      type="checkbox"
      v-model="searchuser"
      name="searchuser"
      :value="users2.users"
    />
    {{ users2.user_id }}&nbsp;&nbsp;{{ users2.username }}&nbsp;&nbsp;{{
      users2.firstname
    }}&nbsp;&nbsp;{{ users2.lastname }}
  </div>
  You have selected : {{ searchuser }} -->


</template>
</template>

<script>
import axios from 'axios'
export default {
  name: 'post',
  data () {
    return {
      posts:[]
    }
  },
  methods: {
    getPosts() { 
      let url = 'https://jsonplaceholder.typicode.com/posts'
      axios({
        method: 'get',
        url: url,
      })
      .then(response => {
        this.posts = response.data
        console.log(response.data)
      })
      .catch(error => {
        console.error(error)
      })
    }
  },
  mounted() {
    this.getPosts()
  },
};
</script>