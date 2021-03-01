<?php echo form_open('',"class='form-group' need-validation");

   echo '<fieldset class="alert alert-secondary">';
   echo '<h2>Vos informations</h2>';

   echo '<div class="form-group"><br>';
      echo form_label('Nom :', 'nom');
      echo form_input('Nom','','class="form-control" placeholder="Veuillez entrer votre nom" id="nom" required');
      echo form_error('nom');
   echo '</div>';
   

   echo '<div class="form-group"><br>';
      echo form_label('Prénom :', 'prenom');
      echo form_input('prenom','','class="form-control" placeholder="Veuillez entrer votre prénom" id="prenom" required');
      echo form_error('prenom');
   echo '</div>';


//    <div class="form-group">
//       <p>Sexe *</p>
//       <div class="form-check">
//       <input type="radio" name="gender" <?php if (isset($gender) && $gender=="homme") echo "checked";> value="homme" > Homme <br>
//       <input type="radio" name="gender" <?php if (isset($gender) && $gender=="femme") echo "checked";> value="femme" > Femme
//       </div><span class="error"><?php echo $genderErr;></span>
//    </div>


   echo '<div class="form-group"><br>';
      echo form_label('Date de naissance :', 'ddn');
      echo form_input('ddn','','class="form-control" placeholder="Veuillez entrer votre Date de Naissance" id="ddn" required');
      echo form_error('ddn');
   echo '</div>';



   echo '<div class="form-group"><br>';
      echo form_label('Code postal :', 'cp');
      echo form_input('cp','','class="form-control" placeholder="Veuillez entrer votre Code postal" id="cp" required');
      echo form_error('cp');
   echo '</div>';


   echo '<div class="form-group"><br>';
      echo form_label('Adresse :', 'adresse');
      echo form_input('adresse','','class="form-control" placeholder="Veuillez entrer votre Adresse" id="adresse" required');
      echo form_error('adresse');
   echo '</div>';


   echo '<div class="form-group"><br>';
      echo form_label('Ville :', 'ville');
      echo form_input('ville','','class="form-control" placeholder="Veuillez entrer votre Ville" id="ville" required');
      echo form_error('ville');
   echo '</div>';


   echo '<div class="form-group"><br>';
      echo form_label('E-mail :', 'mail');
      echo form_input('mail','','class="form-control" placeholder="Veuillez entrer votre E-mail" id="mail" required');
      echo form_error('mail');
   echo '</div>';
   
   echo '</fieldset>';
   
   echo '<br><fieldset class="alert alert-secondary">';
   echo '<h1>Votre demande</h1>';

   echo '<div class="form-group"><br>';
      echo form_label('Sujet :', 'sujet');
      echo form_dropdown('sujet', $array,set_value('Catégorie'),'class="form-control" id="sujet" required');
      echo form_error('sujet');
   echo '</div>';



   echo '</fieldset>';
//    <legend for="sujet">Sujet *</legend>
//    <select class="form-control" name="sujet" id="sujet">
//       <option value="sélectionner un sujet">Veuillez selectionner un sujet</option>
//       <option value="mes commandes" <?php if (isset($sujet) && $sujet=="mes commandes") echo "selected";>>Mes commandes</option>
//       <option value="Question sur un produit" <?php if (isset($sujet) && $sujet=="Question sur un produit") echo "selected";>>Question sur un produit</option>
//       <span class="error"><?php echo $sujetErr;></span>
//    </select>

//    <label for="votre question">Votre question *</label>
//    <textarea class="form-control" name="commentaire" value="" id="votre question" rows="2"><?php echo $commentaire;></textarea>
//    <span class="error"><?php echo $commentaireErr;></span>

//    <div class="form-group form-check">
//       <input type="checkbox" class="form-check-input" value="J'accepte le traitement informatique de ce formulaire" name="checkbox" <?php if (isset($checkbox) && $checkbox=="J'accepte le traitement informatique de ce formulaire") {echo "checked";}> id="checkbox">
//       <label class="form-check-label" for="checkbox">J'accepte le traitement informatique de ce formulaire.</label>
//       <span class="error"><?php echo $checkboxErr;></span>

//       <br><br><button type="submit" class="btn btn-dark">Envoyer</button>
//       <button type="reset" class="btn btn-dark">Annuler</button>
//    </div>
?>
</form>
