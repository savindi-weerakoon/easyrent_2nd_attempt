<template>
  <div class="container py-5">
    <div class="row">
      <div class="col-md-3">
        <ul class="list-group">
          <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
            "
          >
            <router-link class="nav-link text-secondary pl-0" to="/dashboard/reports"
              >Reports</router-link
            >
          </li>
          <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
            "
          >
            <router-link
              class="nav-link text-secondary pl-0"
              to="/dashboard/rentedByMe"
              >My Items</router-link
            >
          </li>
          <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
            "
          >
            <router-link
              class="nav-link text-secondary pl-0"
              to="/dashboard/RentedFromSomeone"
              >What I have rented</router-link
            >
          </li>
          <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
            "
          >
            <router-link
              class="nav-link text-secondary pl-0"
              to="/dashboard/PendingPosts"
              >Pending Posts</router-link
            >
          </li>
           <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
            "
          >
            <router-link
              class="nav-link text-secondary pl-0"
              to="/dashboard/PendingPayments"
              >Pending Payments</router-link
            >
          </li>
          <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
            "
          >
            <router-link
              class="nav-link text-secondary pl-0"
              to="/dashboard/Notifications"
            >
              Notifications
            </router-link>
          </li>
          <!-- <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
            "
          >
            <router-link
              class="nav-link text-secondary pl-0"
              to="/dashboard/TestingGetAllLocations"
              >All Provinces</router-link
            >
          </li> -->
        </ul>
      </div>
      <div class="col-md-9">
        <router-view :user="user"/>
      </div>
    </div>
  </div>
</template>

<script>
export default {
props: {
      user: {
        type: Object
      }
    },
}    
</script>