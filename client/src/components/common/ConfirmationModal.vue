<template>
  <div class="modal d-flex align-items-center cursor-pointer" @click="$emit('cancel')">
    <div class="modal-dialog">
      <div class="modal-content cursor-default" @click.stop="null">
        <div class="modal-header">
          <h5 class="modal-title">{{title}}</h5>
          <button
            type="button"
            class="close cursor-pointer"
            @click.stop="$emit('cancel')"
          >
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <slot></slot>
        </div>
        <div class="modal-footer">
          <button v-if="okLabel" type="button" :class="`btn ${okColor} cursor-pointer`" @click.stop="$emit('ok')">{{okLabel}}</button>
          <button v-if="cancelLabel" type="button" class="btn btn-secondary cursor-pointer" @click.stop="$emit('cancel')">
            {{cancelLabel}}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'confirmation-modal',
  props: {
    title: {
      type: String,
    },
    okLabel: {
      type: String,
    },
    okColor: {
      type: String,
      default: 'btn-success'
    },
    cancelLabel: {
      type: String,
    },
  }
}
</script>