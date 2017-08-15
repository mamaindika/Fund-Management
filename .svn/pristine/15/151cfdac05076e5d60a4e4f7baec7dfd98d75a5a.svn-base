<style>
.reveal-if-active {
  opacity: 0;
  max-height: 0;
  overflow: hidden;
  font-size: 16px;
  -webkit-transform: scale(0.8);
          transform: scale(0.8);
  -webkit-transition: 0.5s;
  transition: 0.5s;
}
.reveal-if-active label {
  display: block;
  margin: 0 0 3px 0;
}
.reveal-if-active input[type=text] {
  width: 100%;
}
input[type="radio"]:checked ~ .reveal-if-active, input[type="checkbox"]:checked ~ .reveal-if-active {
  opacity: 1;
  max-height: 100px;
  padding: 10px 20px;
  -webkit-transform: scale(1);
          transform: scale(1);
  overflow: visible;
}

*{
  box-sizing: border-box;
}
</style>
<script type="text/javascript">
    var FormStuff = {
  
  init: function() {
    this.applyConditionalRequired();
    this.bindUIActions();
  },
  
  bindUIActions: function() {
    $("input[type='radio'], input[type='checkbox']").on("change", this.applyConditionalRequired);
  },
  
  applyConditionalRequired: function() {
    
    $(".require-if-active").each(function() {
      var el = $(this);
      if ($(el.data("require-pair")).is(":checked")) {
        el.prop("required", true);
      } else {
        el.prop("required", false);
      }
    });
    
  }
  
};
FormStuff.init();
</script>
<form method="post" action="#">
  <div>
    <div>
      <input type="radio" name="choice-animals" id="choice-animals-dogs" required>
      <label for="choice-animals-dogs">I like dogs more</label>
    
      <div class="reveal-if-active">
        <label for="which-dog">Good call. What's the name of your favorite dog?</label>
        <input type="text" id="which-dog" name="which-dog" class="require-if-active" data-require-pair="#choice-animals-dogs">
      </div>
    </div>
    <div>
      <input type="radio" name="choice-animals" id="choice-animals-cats">
      <label for="choice-animals-cats">I like cats more</label>
    
      <div class="reveal-if-active">
        <label for="which-cat">Why? Cats are weird. Respond.</label>
        <input type="text" id="which-cat" name="which-cat" class="require-if-active" data-require-pair="#choice-animals-cats">
      </div>
    </div>
  </div>
  
  
  <div>
    <input type="submit" value="Submit">
  </div>
      
</form>