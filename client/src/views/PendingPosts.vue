<template>
  <div>
    <div v-if="user.role_id == 1">
      <h5>Pending Posts</h5>
      <div>
        <table v-if="rents && rents.length > 0" class="table w-100">
          <thead>
            <tr>
              <th>Post Title</th>
              <th>Post Category</th>
              <th class="text-right">Price</th>
              <th class="text-right">Accept or Reject</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="rent in rents" :key="rent.post_id">
              <td>
                <router-link :to="`/postView/${rent.post_id}`">{{
                  rent.post_title
                }}</router-link>
              </td>
              <td>{{ rent.category_name }}</td>
              <td class="text-right">{{ rent.price }}</td>
              <td class="text-right">
                <button
                  type="button"
                  class="btn btn-success mr-3"
                  @click="rent.isAcceptModal = true"
                >
                  Accept
                </button>
                <button
                  type="button"
                  class="btn btn-danger"
                  @click="rent.isRejectModal = true"
                >
                  Reject
                </button>
                <ConfirmationModal
                  v-if="rent.isAcceptModal"
                  @ok="accept(rent)"
                  @cancel="rent.isAcceptModal = false"
                  :okLabel="'Accept'"
                  :cancelLabel="'Cancel'"
                  :title="'Accept this payment'"
                >
                  <p>Do you want to accept this post?</p>
                </ConfirmationModal>
                <ConfirmationModal
                  v-if="rent.isRejectModal"
                  @ok="reject(rent)"
                  @cancel="rent.isRejectModal = false"
                  :okLabel="'Reject'"
                  :okColor="'btn-danger'"
                  :cancelLabel="'Cancel'"
                  :title="'Reject this payment'"
                >
                  <p>Do you want to reject this post?</p>
                </ConfirmationModal>
              </td>
            </tr>
          </tbody>
        </table>
        <div v-else>
          <div class="alert alert-dark">
            There are no items under pending state
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <h5>My Pending Posts</h5>
      <div v-if="posts && posts.length > 0" class="row">
        <div
          class="col-lg-4 col-md-6"
          v-for="post in posts"
          :key="post.post_id"
        >
          <Post :post="post" />
        </div>
      </div>
      <div v-else class="col-ml-3 mt-2">
        <div class="alert alert-dark">
          You do not have items under pending state
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import Post from "@/components/common/Post.vue";
import ConfirmationModal from "@/components/common/ConfirmationModal.vue";
export default {
  data() {
    return {
      rents: [],
      post_id: 1,
      posts: [],
    };
  },
  props: {
    user: {
      type: Object,
    },
    postId: {
      type: Number,
    },
  },
  components: {
    Post,
    ConfirmationModal,
  },
  methods: {
    getPendingPosts() {
      const url = "/apinew/getPendingPosts/";
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          if (response.status === 200) {
            this.rents = response.data.posts;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getOwnersPosts() {
      const url = "/apinew/getOwnersPosts/";
      var form = new FormData();
      form.append("user_id", this.user.user_id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            this.posts = response.data.posts;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    accept(post) {
      const url = "/apinew/changePendingToActive/";
      var form = new FormData();
      form.append("post_id", post.post_id);
      post.isAcceptModal = false;
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.$toast.success("You have successfully accepted the post");
          this.getPendingPosts();
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    reject(post) {
      const url = "/apinew/changePendingToReject/";
      var form = new FormData();
      form.append("post_id", post.post_id);
      post.isRejectModal = false;
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.$toast.success("You have successfully rejected the post");
          this.getPendingPosts();
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  mounted() {
    this.getPendingPosts();
    this.getOwnersPosts();
  },
};
</script>