<template>
  <div>
    <nav id="navbar-example2" class="navbar bg-body-tertiary mb-3 pl-0" style="font-size: 0.9rem">
      <h3 class="">Anciens Commentaires <span style="font-size:1.2rem;">({{ comments.length }})</span></h3>
      <ul class="nav nav-pills">
        <li class="nav-item">
          <a class="nav-link" @click="sort('date', 'ASC')">Date <i class="fa fa-arrow-up"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" @click="sort('date', 'DESC')">Date <i class="fa fa-arrow-down"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" @click="sort('note', 'ASC')">Note <i class="fa fa-arrow-down"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" @click="sort('note', 'DESC')">Note <i class="fa fa-arrow-down"></i></a>
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
<!--            Calculer les étoiles à la sortie du call à l'api en appelant this.displayStars() / afficher la variable yellow_grey / retirer le second paramètre de la méthode-->
            <span v-if="yellow_stars > 0" v-for="index in displayStars(comment.note, 'yellow')" :key="index">
              <i class="fa fa-star" style="color: #ffdd00;"></i>
            </span>
            <span v-if="grey_stars > 0" v-for="index in displayStars(comment.note, 'grey')" :key="index">
              <i class="fa fa-star" style="color: #efefee;"></i>
            </span>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      yellow_stars: 0,
      grey_stars: 0,
      comments: [
        {
          "pseudo": "troisticha",
          "email": "troisticha@miaou.fr",
          "note": 3,
          "opinion": "lulululululululululul",
          // "image": "@/assets/images/upload_img.png",
          "image": "https://yt3.googleusercontent.com/drOYmUuKmkhp672EiXe5NZcMOb5WHhUn6Qwscot71pAal1kvm2GrZ5jtJwkkumVZQXnYOhTYaw=s900-c-k-c0x00ffffff-no-rj",
          "date": "23/03/2023",
        },
      ]
    }
  },
  methods: {
    sort(sortType, sortValue) {
      console.log(sortType, sortValue);
    },
    displayStars(note, color) {
      this.yellow_stars = note;
      this.grey_stars = 5 - note;
      if (color == 'yellow') {

        return this.yellow_stars;
      } else if (color == 'grey') {
        return this.grey_stars;
      }
    }
  },

}
</script>
