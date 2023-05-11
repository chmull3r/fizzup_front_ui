<template>
  <div>
    <nav id="navbar-example2" class="navbar bg-body-tertiary mb-3 pl-0" style="font-size: 0.9rem">
      <h3 class="">Anciens Commentaires <span style="font-size:1.2rem;">({{ comments.length }})</span></h3>
      <ul class="nav nav-pills">
        <li @click="toggleDateBtn" class="nav-item">
          <a class="nav-link pointer" @click="sortByDate(dateArrowFilterUp ? 'ASC' : 'DESC')">Date <i class="fa" :class="[dateArrowFilterUp ? 'fa-arrow-up' : 'fa-arrow-down']"></i></a>
        </li>
        <li @click="toggleNoteBtn" class="nav-item">
          <a class="nav-link pointer" @click="sortByNote(noteArrowFilterUp ? 'ASC' : 'DESC')">Note <i class="fa" :class="[noteArrowFilterUp ? 'fa-arrow-up' : 'fa-arrow-down']"></i></a>
        </li>
      </ul>
    </nav>

    <div v-if="comments">
      <ul class="list-unstyled">
        <li v-for="comment in comments" class="mb-4">
          <div class="d-flex justify-content-center">
            <div class="mr-2 pt-2 col">
              <img :src="comment.image" width="50" height="50" class="cover-fit">
            </div>
            <div class="mr-3 pt-2 col-9">
              {{ comment.opinion }}
              <p class="mb-0">-- {{ comment.pseudo }} -- {{ comment.email }}</p>
              <p style="font-style: italic; font-size: 0.8rem; text-transform: lowercase; color: #6c757d">Posté le {{ comment.date }}</p>
            </div>
            <div class="note-stars flex-fill pt-2 col" style="min-width: 90px;">
              <span v-for="y in comment.note">
                <i class="fa fa-star yellow-star"></i>
              </span>
              <span v-for="g in displayGreyStars(comment.note)">
                <i class="fa fa-star grey-star"></i>
              </span>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div v-else class="alert alert-light" role="alert">
      <p class="text-center">Soyez le premier à commenter !</p>
    </div>
  </div>
</template>

<script>
// import moment from '@nuxtjs/moment';
export default {
  data() {
    return {
      dateArrowFilterUp: false,
      noteArrowFilterUp: true,
    }
  },
  props: ['comments'],
  computed: {
    displayGreyStars() {
      return (note) => 5 -  note;
    },
  },
  mounted() {
    this.sortByDate('DESC');
  },
  methods: {
    sortByDate(sortFilter) {
      this.comments.sort((a, b) => {
        return sortFilter == "DESC" ? new Date(b.date) - new Date(a.date) : new Date(a.date) - new Date(b.date) ;
      })
      return this.comments;
    },
    sortByNote(sortFilter) {
      this.comments.sort((a, b) => {
        return sortFilter == "ASC" ? a.note - b.note : b.note - a.note ;
      })
      return this.comments;
    },
    toggleDateBtn() {
      this.dateArrowFilterUp = !this.dateArrowFilterUp;
    },
    toggleNoteBtn() {
      this.noteArrowFilterUp = !this.noteArrowFilterUp;
    },
  },

}
</script>
