<template>
  <div class="container py-5">
    <div class="row">
      <div class="col-md-4 col-lg-2 col-sm-2">
        <nav class="flex-column sidebar-nav">
          <router-link class="nav-link text-secondary pl-0" to="/reports">Reports</router-link>
          <router-link class="nav-link text-secondary pl-0" to="/rentedByMe">My Items</router-link>
          <router-link class="nav-link text-secondary pl-0" to="/RentedFromSomeone">What I have rented</router-link>
          <router-link class="nav-link text-secondary pl-0" to="/dashboard/payments">Payments</router-link>
          <router-link class="nav-link text-secondary pl-0" to="/pending-posts">Pending Posts</router-link>
        </nav>
      </div>
    </div>
  </div>
</template>

<script>
</script>