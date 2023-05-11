<template>
  <div>
    <div class="d-flex justify-content-between my-4">
      <h2 class="">Donne ton avis !</h2>
    </div>

    <div class="q-container">
      <form id="new-comment" class="pl-4 pt-4 pr-4 pb-4" @submit="sendNewComment" method="post">
        <div>
          <a style="display: contents">
            <input type="submit" value="Envoyer" class="btn btn-sm btn-warning">
          </a>
        </div>
        <div style="display:flex" class="mb-4 justify-content-center">
          <label for="userProfileFile"><img width="100px" height="100px" v-model="fields.image" :src="!fields.image ? 'images/upload_img.png' : fields.image" class="img-thumbnail" :alt="fields.image ?? fields.image"></label>
          <input type="file" accept="image/jpeg" id="userProfileFile" @change="uploadImage" name="userProfileFile">
        </div>
        <div class="row mb-4">
          <div class="col">
            <input v-model.trim="fields.pseudo" type="text" class="form-control" placeholder="happyrando" id="pseudo" name="pseudo" aria-label="pseudo">
          </div>
          <div class="col">
            <input v-model="fields.email" type="email" class="form-control" placeholder="email@awesome.com" name="email" aria-label="email">
          </div>
        </div>
        <div class="mb-3">
          <textarea v-model.trim="fields.opinion" placeholder="..." class="form-control" id="opinion" name="opinion" rows="3"></textarea>
        </div>
        <label for="note" class="form-label">{{ noteLabelMessage }}<i class="fa fa-star" style="color: #ffdd00;"></i></label>
        <input v-model="fields.note" type="range" class="form-range" name="vote" value="1" min="0" max="5" id="note">
        <div v-if="errors.length" class="mt-4 alert alert-danger d-flex align-items-center" role="alert">
          <p>
            <b>Ces champs manquent ou ne sont pas valides :</b>
            <ul>
              <li v-for="error in errors">{{ error }}</li>
            </ul>
          </p>
        </div>
        <div v-if="success" class="mt-4 alert alert-success d-flex align-items-center" role="alert">
          <p>{{ success }}
          </p>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      fields: {
        pseudo: null,
        email: null,
        opinion: null,
        image: null,
        note: 0,
      },
      previewImage: null,
      errors: [],
      success: null,
      apiErrors: []
    }
  },
  computed: {
    noteLabelMessage() {
      let message = "Note l'expérience:";
      return message.concat(' ', this.fields.note);
    },
  },
  methods: {
    sendNewComment(e) {
      this.errors = [];
      for (const [field, value] of Object.entries(this.fields)) {
        this.checkFormErrors(field, value);
      }

      e.preventDefault();

      if (this.errors.length === 0) {
        const apiUrl ="http://api_cosmic:8740/comment/new";

        try {
          fetch(apiUrl + encodeURIComponent(this.fields))
          // simulate api validation : new comment save in LocalStorage
          this.fields['date'] = new Date().toJSON();
          this.saveNewCommentInLocalStorage('localComments');
        } catch (errorResponse) {
          console.log(errorResponse);
          this.errors.push(errorResponse.error)
        }
      }
    },
    checkFormErrors(field, value) {
      if (value === null) {
        this.errors.push(field)
      } else if (field == "email" && !this.validEmail(value)) {
        this.errors.push(field)
      }
      return this.errors;
    },
    validEmail(email) {
      const regex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return regex.test(email);
    },
    uploadImage(e) {
      const image = e.target.files[0];
      const reader = new FileReader();
      reader.readAsDataURL(image);
      reader.onload = e =>{
        this.fields.image = e.target.result;

      };
    },
    saveNewCommentInLocalStorage(key) {
      let datas = [this.fields];
      if(localStorage.getItem('localComments') !== null) {
        datas = JSON.parse(localStorage.getItem('localComments'));
        datas.push(this.fields);
      }
      try {
        localStorage.setItem(key, JSON.stringify(datas));
        this.success = "Youhou ! Votre commentaire a été ajouté."
        this.resetForm();
      } catch(localError) {
        this.errors.push(localError.error);
      }
    },
    resetForm() {
      this.fields.pseudo = null;
      this.fields.email = null;
      this.fields.opinion = null;
      this.fields.image = null;
      this.fields.note = 0;
    }
  }
}
</script>
