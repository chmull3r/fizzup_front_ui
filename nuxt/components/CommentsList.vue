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

    <ul class="list-unstyled">
      <li v-for="comment in comments" class="mb-4">
        <div class="d-flex justify-content-center">
          <div class="mr-2 pt-2 col">
            <img :src="comment.image" width="50" height="50">
          </div>
          <div class="mr-3 pt-2 col-9">
            {{ comment.opinion }}
            <p class="mb-0">-- {{ comment.pseudo }} -- {{ comment.email }}</p>
            <p style="font-style: italic; font-size: 0.8rem; text-transform: lowercase; color: #6c757d">Posté le {{ comment.date }}</p>
          </div>
          <div class="note-stars flex-fill pt-2 col" style="min-width: 90px;">
            <span v-if="yellow_stars > 0" v-for="y in displayStars(comment.note, 'yellow')" :key="yellow_stars.length">
              <i class="fa fa-star" style="color: #ffdd00;"></i>
            </span>
            <span v-if="grey_stars > 0" v-for="g in displayStars(comment.note, 'grey')" :key="grey_stars.length">
              <i class="fa fa-star" style="color: #efefee;"></i>
            </span>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
// import moment from '@nuxtjs/moment';
export default {
  data() {
    return {
      yellow_stars: 0,
      grey_stars: 0,
      comments: [
        {
          "pseudo": "Marydu68",
          "email": "mary68@gmail.com",
          "note": 5,
          "opinion": "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          // "image": "@/assets/images/upload_img.png",
          "image": "https://api.cloudly.space/resize/clip/1200/760/75/aHR0cHM6Ly9zdGF0aWMuYXBpZGFlLXRvdXJpc21lLmNvbS9maWxlc3RvcmUvb2JqZXRzLXRvdXJpc3RpcXVlcy9pbWFnZXMvMTg4LzEvMTA0MjA2NjguanBn/image.jpg",
          "date": "2023-01-16",
        },
        {
          "pseudo": "Cokiet_fluff",
          "email": "cfluff@outlokk.fr",
          "note": 2,
          "opinion": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          // "image": "@/assets/images/upload_img.png",
          "image": "https://i.redd.it/e9nejy2ijtg31.jpg",
          "date": "2021-05-01",
        },
        {
          "pseudo": "PascalMorin",
          "email": "pascalmo@orange.fr",
          "note": 1,
          "opinion": "Ac turpis egestas sed tempus. At lectus urna duis convallis convallis tellus id interdum. Odio eu feugiat pretium nibh ipsum consequat nisl vel. Et ligula ullamcorper malesuada proin libero nunc consequat interdum varius. Id faucibus nisl tincidunt eget nullam non nisi est sit. Iaculis urna id volutpat lacus laoreet non curabitur. Id ornare arcu odio ut sem nulla.",
          // "image": "@/assets/images/upload_img.png",
          "image": "https://youdidwhatwithyourweiner.com/wp-content/uploads/2018/06/Dog-Mountain-Trail-Slider.jpg",
          "date": "2022-06-25",
        },


      ],
      commentsFromApi: [],
      errors: null,
      dateArrowFilterUp: false,
      noteArrowFilterUp: true,
    }
  },
  computed: {
  },
  created() {
  //   this.fetchComments();
    this.sortByDate('DESC');
  },
  methods: {
    async fetchComments() {
      try {
        this.commentsFromApi = await fetch('http://api_cosmic:8740/comments');
      } catch (error) {
        this.errors = error.message;
      }
    },
    displayStars(note, color) {
      this.yellow_stars = note;
      this.grey_stars = 5 - note;
      if (color == 'yellow') {
        return this.yellow_stars;
      } else if (color == 'grey') {
        return this.grey_stars;
      }
    },
    sortByDate(sortFilter) {
      this.comments.sort(function(a, b) {
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
